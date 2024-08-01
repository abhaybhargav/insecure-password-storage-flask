# Use an official Python runtime as the base image
FROM python:3.9-slim

# install sqlite binary
RUN apt-get update && apt-get install -y sqlite3 wget hashcat


# Set the working directory in the container
WORKDIR /app

# install wordlist
RUN wget -O wordlist.txt https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-100.txt

# Copy the requirements file into the container
COPY requirements.txt .

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . .

# Make port 8880 available to the world outside this container
EXPOSE 8880

# Run app.py when the container launches
CMD ["python", "app.py"]