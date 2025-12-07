FROM nvidia/cuda:12.2.0-runtime-ubuntu22.04   # لدعم GPU
RUN apt-get update && apt-get install -y ffmpeg git python3-pip  # للفيديو
WORKDIR /app
COPY . .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
EXPOSE 8501
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
