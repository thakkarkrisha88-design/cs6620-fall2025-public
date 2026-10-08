# Python base image (3.11 because pydub breaks on 3.13)
FROM python:3.11-slim

# All later commands run inside /app in the container
WORKDIR /app

# Install dependencies first so Docker can cache this layer
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . .

# Tell Flask which file holds the app
ENV FLASK_APP=app.py

# Document the port the app listens on
EXPOSE 5000

# Run Flask on port 5000, listening on all interfaces
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]