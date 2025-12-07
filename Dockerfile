# Base image with CUDA support (GPU)
FROM nvidia/cuda:12.0.0-runtime-ubuntu22.04

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git ffmpeg python3 python3-pip && \
    apt-get clean

# Set working directory
WORKDIR /app

# Copy files to container
COPY . .

# Upgrade pip and install uv (package manager used by this project)
RUN pip3 install --upgrade pip
RUN pip3 install uv

# Install python dependencies using pyproject.toml
RUN uv sync

# Expose port for streamlit
EXPOSE 8501

# Start app
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
