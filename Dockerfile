# Use an official Python runtime as a parent image
FROM python:3.8

# Set the working directory in the container
WORKDIR /Users/amanjanee/PycharmProjects/pythonProject4

# Copy the current directory contents into the container at /app
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Run app.py when the container launches
CMD ["gunicorn", "-b", "0.0.0.0:5000", "main:app"]