import tensorflow
from keras.applications.resnet50 import ResNet50, preprocess_input
from keras.layers import GlobalMaxPooling2D
import cv2
import numpy as np
from numpy.linalg import norm
import pickle
from sklearn.neighbors import NearestNeighbors
import streamlit as st
import os
from PIL import Image

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

st.title("Men and Women Fashion Recommender System")

def save_uploaded_file(uploaded_file):
    try:
        upload_path = os.path.join('uploads', uploaded_file.name)
        os.makedirs(os.path.dirname(upload_path), exist_ok=True)  # Ensure directory exists
        with open(upload_path, 'wb') as f:
            f.write(uploaded_file.getbuffer())
            return 1
    except Exception as e:
        print(e)  # Print any exception
        return 0

def extract_feature(img_path, model):
    img = cv2.imread(img_path)
    img = cv2.resize(img, (224, 224))
    img = np.array(img)
    expand_img = np.expand_dims(img, axis=0)
    pre_img = preprocess_input(expand_img)
    result = model.predict(pre_img).flatten()
    normalized = result / norm(result)
    return normalized

def recommend(features, feature_list):
    neighbors = NearestNeighbors(n_neighbors=5, algorithm="brute", metric="euclidean")
    neighbors.fit(feature_list)

    distance, indices = neighbors.kneighbors([features])
    return indices

uploaded_file = st.file_uploader("Choose an image")
if uploaded_file is not None:
    if save_uploaded_file(uploaded_file):
        # Display the file
        display_image = Image.open(uploaded_file)
        resized_img = display_image.resize((200, 200))
        st.image(resized_img)
        
        # Feature extraction
        features = extract_feature(os.path.join("uploads", uploaded_file.name), model)
        
        # Recommendation
        indices = recommend(features, feature_list)
        
        # Show recommendations
        cols = st.columns(5)
        for i, col in enumerate(cols):
            with col:
                st.image(filename[indices[0][i]])
    else:
        st.header("Some error occurred in the file upload")  # Show any error if occurred
