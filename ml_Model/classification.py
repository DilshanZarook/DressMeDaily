# -*- coding: utf-8 -*-
"""Classification.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/15U43NMlJ6hnw-b8vMsBbXL7nY3a0r0xy
"""

from google.colab import drive
drive.mount('/content/drive')

from PIL import Image
from transformers import AutoModelForImageClassification, ViTFeatureExtractor
from torch.utils.data import DataLoader, Dataset
from torchvision import transforms
import torch
import torch.nn as nn
import torch.optim as optim

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
        label = torch.tensor(self.labels[idx])

        if self.transform:
            image = self.transform(image)

        return image, label

# Define your image transformation pipeline
transform = transforms.Compose([
    transforms.Resize((224, 224)),
    transforms.ToTensor(),
])

# Specify image paths and corresponding labels
image_paths = [
    "/content/drive/MyDrive/1163.jpg",
    "/content/drive/MyDrive/imagesForDMD/10000.jpg",
    "/content/drive/MyDrive/imagesForDMD/10007.jpg",
    # Add more paths as needed
]

labels = [0, 0, 1]  # Corresponding labels for each image path

# Create a custom dataset
dataset = CustomDataset(image_paths, labels, transform=transform)

# Create a DataLoader for training
batch_size = 32
dataloader = DataLoader(dataset, batch_size=batch_size, shuffle=True)

# Load the pre-trained model and feature extractor
model = AutoModelForImageClassification.from_pretrained("google/vit-base-patch16-224")
feature_extractor = ViTFeatureExtractor.from_pretrained("google/vit-base-patch16-224")

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
num_epochs = 1
for epoch in range(num_epochs):
    for images, labels in dataloader:
        inputs = feature_extractor(images=images, return_tensors="pt")
        labels = labels.squeeze()

        # Forward pass
        outputs = model(**inputs)
        logits = outputs.logits
        loss = criterion(logits, labels)

        # Backward pass and optimization
        optimizer.zero_grad()
        loss.backward()
        optimizer.step()

        # Print predicted class for each image
        predicted_labels = logits.argmax(dim=1)
        predicted_labels_list = [class_mapping[label.item()] for label in predicted_labels]
        labels_list = [class_mapping[label.item()] for label in labels]
        print(f"Ground Truth: {labels_list}, Predicted: {predicted_labels_list}")

    print(f"Epoch {epoch + 1}/{num_epochs}, Loss: {loss.item()}")

# Save the fine-tuned model
# model.save_pretrained("/path/to/save/fine_tuned_model")