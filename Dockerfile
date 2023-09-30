# Use an official Python runtime as a parent image
FROM python:3.8

# Set environment variables to prevent Python bytecode and enable unbuffered mode
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Create and set the working directory in the container
WORKDIR /app

# Copy only the requirements file into the container first
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

RUN apt-get update && apt-get install -y iputils-ping

# Copy the entire Django project into the container
COPY . /app/

# Expose the port your Django app will run on (use the same port as in your Django settings)
EXPOSE 8000

# Start the Django application using pipenv (adjust this command to match your Django project)
CMD ["pipenv", "run", "python", "manage.py", "runserver", "0.0.0.0:8000"]
