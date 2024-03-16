import torch
from torchvision import models, transforms
from PIL import Image
import json
import requests
from PIL import Image
from flask import request,Flask
from transformers import AutoModelForImageClassification
from torch.utils.data import DataLoader, Dataset
from torchvision import transforms
import torch
import torch.nn as nn
import torch.optim as optim
from transformers import ViTImageProcessor
from flask import jsonify

app = Flask(__name__)

@app.route('/classify', methods=['POST'])
def identify_classify():
        img = request.files["img"]

        # Download ImageNet class index
        class_idx_url = 'https://raw.githubusercontent.com/anishathalye/imagenet-simple-labels/master/imagenet-simple-labels.json'
        class_idx = requests.get(class_idx_url).json()

        # Load the pre-trained model
        model = models.resnet50(weights='ResNet50_Weights.IMAGENET1K_V1')
        model.eval()

        # Define a transform to preprocess the image
        transform = transforms.Compose([
            transforms.Resize(256),
            transforms.CenterCrop(224),
            transforms.ToTensor(),
            transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225]),
        ])

        # Load an image
        image_path = img  # Update this path to your image file
        image = Image.open(image_path)

        # Convert PIL Image to PyTorch tensor and add batch dimension
        image_tensor = transform(image).unsqueeze(0)

        # Check for number of channels
        if image_tensor.shape[0] != 3:
            print("Image has unexpected number of channels. Converting to RGB")
            image_tensor = transforms.functional.to_pil_image(image_tensor).convert('RGB')
            image_tensor = transforms.ToTensor()(image_tensor)

        # Add batch dimension
        image_tensor = image_tensor.unsqueeze(0)

        # Predict with the model
        model.eval()  # Set the model to evaluation mode
        with torch.no_grad():
            outputs = model(image_tensor)
            probabilities = torch.nn.functional.softmax(outputs[0], dim=0)

        # Get top 5 probabilities and indices
        top5_prob, top5_catid = torch.topk(probabilities, 5)
        for i in range(top5_prob.size(0)):
            print(f"{class_idx[top5_catid[i].item()]}: {top5_prob[i].item() * 100:.2f}%")

            # Prepare your response data
            response_data = {
                "message": "Image processed successfully",
                "top_predictions": [
                    {"label": class_idx[top5_catid[i].item()], "probability": top5_prob[i].item() * 100}
                    for i in range(top5_prob.size(0))
                ],
                # Include additional data as needed
            }

            # Return the JSON response
            return jsonify(response_data)

@app.route('/reclassify', methods=['POST'])
def reclassify_image(imagePath=True):
        # Define a custom dataset for your classification task
        class CustomDataset(Dataset):
            def __init__(self, image_paths, labels, transform=None):
                self.image_paths = image_paths
                self.labels = labels
                self.transform = transform

            def __len__(self):
                return len(self.image_paths)

            def __getitem__(self, idx):
                image = Image.open(self.image_paths[idx]).convert("RGB")
                label = self.labels[idx]

                if self.transform:
                    image = self.transform(image)
                return image, torch.tensor(label)

        # Define your image transformation pipeline
        transform = transforms.Compose([
            transforms.Resize((224, 224)),
            transforms.ToTensor(),
        ])

        # Specify image paths and corresponding labels
        image_paths = [imagePath]
        labels = [0]  # Update this based on your actual labels

        # labels = [0, 0, 1]  # Corresponding labels for each image path

        # Create a custom dataset
        dataset = CustomDataset(image_paths, labels, transform)

        # Create a DataLoader for training
        batch_size = 32
        dataloader = DataLoader(dataset, batch_size=batch_size, shuffle=True)

        # Load the pre-trained model and feature extractor
        model = AutoModelForImageClassification.from_pretrained("google/vit-base-patch16-224")
        feature_extractor = ViTImageProcessor.from_pretrained("google/vit-base-patch16-224")

        # Modify the classification head for your specific task
        model.classifier = nn.Linear(model.config.hidden_size, len(set(dataset.labels)))

        # Define loss function and optimizer
        criterion = nn.CrossEntropyLoss()
        optimizer = optim.Adam(model.parameters(), lr=0.001)

        # Define class mapping
        class_mapping = {
            0: "Workwear",
            1: "Casualwear",
            2: "Partywear"
            # Add more classes as needed
        }

        # Training loop
        num_epochs = 5
        for epoch in range(num_epochs):
            for image, label in dataset:
                inputs = feature_extractor(images=image.unsqueeze(0), return_tensors="pt")
                label = label.squeeze(0)

                # Forward pass
                outputs = model(**inputs)
                logits = outputs.logits

                # Reshape the logits and labels to have the same shape
                logits = logits.view(-1, logits.shape[-1])
                labels = label.view(-1)

                loss = criterion(logits, labels)

                # Backward pass and optimization
                optimizer.zero_grad()
                loss.backward()
                optimizer.step()

                # Print predicted class for each image
                predicted_label = logits.argmax(dim=1)
                predicted_label_name = class_mapping[predicted_label.item()]
                label_name = class_mapping[label.item()]
                print(f"Ground Truth: {label_name}, Predicted: {predicted_label_name}")

            print(f"Epoch {epoch + 1}/{num_epochs}, Loss: {loss.item()}")


if __name__ == '__main__':
    app.run(debug=True)