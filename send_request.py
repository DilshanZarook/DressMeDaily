import requests

def send_request(image_path, url):
    files = {'img': open(image_path, 'rb')}
    response = requests.post(url, files=files)
    return response.json()

if __name__ == "__main__":
    image_path = "/Users/amanjanee/Downloads/dilshan.jpeg"  # Replace with the path to your image file
    classify_url = "http://127.0.0.1:5000/classify"
    reclassify_url = "http://127.0.0.1:5000/reclassify"

    # Sending requests to both endpoints
    classify_response = send_request(image_path, classify_url)
    reclassify_response = send_request(image_path, reclassify_url)

    # Printing the responses
    print("Response from /classify:")
    print(classify_response)
    print("\nResponse from /reclassify:")
    print(reclassify_response)
