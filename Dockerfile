# Use an official Python image as a base
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file if exists
COPY requirements.txt .

# Install dependencies including Bokeh
RUN pip install --no-cache-dir -r requirements.txt 

# Copy the rest of the application files
COPY . .

# Set environment variables if required
ENV PYTHONUNBUFFERED=1

# Expose the port used by the Bokeh server (default 5006)
EXPOSE 5006

# Start with a bash shell
CMD ["/bin/bash"]

# Command to run the Bokeh server with the main script
#CMD ["bokeh", "serve", "--allow-websocket-origin=*", "--port", "5006", "--show", "main.py"]
