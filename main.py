from torchvision import models
import requests
from PIL import Image
from flask import request,Flask
from transformers import AutoModelForImageClassification
from torchvision import transforms
import torch
import torch.nn as nn
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

        # Predict with the model
        model.eval()  # Set the model to evaluation mode
        with torch.no_grad():
            outputs = model(image_tensor)
            probabilities = torch.nn.functional.softmax(outputs[0], dim=0)

        # Get top 5 probabilities and indices
        top5_prob, top5_catid = torch.topk(probabilities, 5)
        for i in range(top5_prob.size(0)):
            print(f"Top prediction is {class_idx[top5_catid[i].item()]}: {top5_prob[i].item() * 100:.2f}%")

            # Extract the highest prediction
            highest_prediction = {
                "label": class_idx[top5_catid[0].item()],
                "probability": top5_prob[0].item() * 100
            }

            # Prepare the rest of the predictions
            other_predictions = [
                {"label": class_idx[top5_catid[i].item()], "probability": top5_prob[i].item() * 100}
                for i in range(1, top5_prob.size(0))
            ]

            # Prepare your response data
            response_data = {
                "message": "Image processed successfully",
                "highest_prediction": highest_prediction,
                "other_top_predictions": other_predictions,
                # Include additional data as needed
            }

            # Return the JSON response
            return jsonify(response_data)

if __name__ == '__main__':
    app.run(debug=True)
