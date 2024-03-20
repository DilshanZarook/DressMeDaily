from flask import Flask, request, jsonify, send_from_directory
import os
from werkzeug.utils import secure_filename
import cv2
import numpy as np
from numpy.linalg import norm
from keras.applications.resnet50 import ResNet50, preprocess_input
from keras.layers import GlobalMaxPooling2D
from sklearn.neighbors import NearestNeighbors
import pickle
import tensorflow
import shutil
import logging

# Configure logging
logging.basicConfig(filename='app.log', level=logging.INFO)

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = './uploads'
app.config['RECOMMENDED_FOLDER'] = './recommended' # New configuration for recommended images

# Create the recommended folder if it doesn't exist
os.makedirs(app.config['RECOMMENDED_FOLDER'], exist_ok=True)

# Load feature list and filenames
feature_list = np.array(pickle.load(open("featurevector.pkl", "rb")))
filename = pickle.load(open("filename.pkl", "rb"))

# Initialize the model
model = ResNet50(weights='imagenet', include_top=False, input_shape=(224, 224, 3))
model.trainable = False
model = tensorflow.keras.Sequential([
 model,
 GlobalMaxPooling2D()
])

@app.route('/recommend', methods=['POST'])
def recommend_api():
    if 'file' not in request.files:
        return jsonify({"error": "No file part in the request"}), 400
    file = request.files['file']
    if file.filename == '':
        return jsonify({"error": "No selected file"}), 400
    file_path = os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(file.filename))
    file.save(file_path)
  
    # Extract features from the uploaded image
    features = extract_feature(file_path, model)
  
    # Find nearest neighbors
    recommended_filenames = get_recommendations(features, feature_list)
  
    # Log the filenames of the recommended images
    logging.info(f"Recommended filenames: {recommended_filenames}")
  
    # Copy recommended images to the recommended folder
    for recommended_filename in recommended_filenames:
        # Adjust the path to remove the first "Dataset"
        adjusted_filename = remove_first_dataset(recommended_filename)
        src_path = os.path.join('.', 'Dataset', adjusted_filename)
        dst_path = os.path.join(app.config['RECOMMENDED_FOLDER'], adjusted_filename)
        
        # Check if the source file exists
        if not os.path.exists(src_path):
            logging.error(f"Source file does not exist: {src_path}")
            continue # Skip this file and move to the next one
        
        # Attempt to copy the file
        try:
            shutil.copy(src_path, dst_path)
            logging.info(f"Copied file to: {dst_path}")
        except Exception as e:
            logging.error(f"Failed to copy file: {e}")
  
    # Return filenames of recommended items
    return jsonify(recommended_filenames)

@app.route('/recommended/<path:filename>')
def serve_recommended_image(filename):
    return send_from_directory(app.config['RECOMMENDED_FOLDER'], filename)

def extract_feature(img_path, model):
    img = cv2.imread(img_path)
    img = cv2.resize(img, (224, 224))
    img = np.array(img)
    expand_img = np.expand_dims(img, axis=0)
    pre_img = preprocess_input(expand_img)
    result = model.predict(pre_img).flatten()
    normalized = result / norm(result)
    return normalized

def get_recommendations(features, feature_list):
    neighbors = NearestNeighbors(n_neighbors=5, algorithm="brute", metric="euclidean")
    neighbors.fit(feature_list)
    distance, indices = neighbors.kneighbors([features])

    recommended_filenames = [filename[i] for i in indices[0][1:]] # Excludes the query image
    return recommended_filenames

def remove_first_dataset(path):
    # Split the path into its components
    components = path.split(os.path.sep)
    
    # Check if the first component is "Dataset" and remove it if it is
    if components[0] == "Dataset":
        components.pop(0)
    
    # Join the components back into a path
    new_path = os.path.sep.join(components)
    
    return new_path

if __name__ == '__main__':
    app.run(debug=True)
