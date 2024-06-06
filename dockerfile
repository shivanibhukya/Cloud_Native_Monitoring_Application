# Use the official Python image from the Docker Hub, specifically the version 3.9 with Debian Buster
FROM python:3.9-buster

# Set the working directory inside the Docker container to /app
WORKDIR /app

# Copy the requirements.txt file from the local machine to the working directory inside the container
COPY requirements.txt .

# Install the Python packages listed in the requirements.txt file, using pip3 without caching
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the application files from the local machine to the working directory inside the container
COPY . .

# Set an environment variable to configure Flask to run on all available IP addresses of the container
ENV FLASK_RUN_HOST=0.0.0.0

# Expose port 5000 on the Docker container to allow communication to/from the container
EXPOSE 5000

# Define the command to run the Flask application when the Docker container starts
CMD [ "flask", "run" ]
