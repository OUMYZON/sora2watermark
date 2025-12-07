FROM nvidia/cuda:11.8.0-runtime-ubuntu22.04

# تثبيت المتطلبات الأساسية
RUN apt-get update && \
    apt-get install -y git ffmpeg python3 python3-pip && \
    apt-get clean

# إنشاء مجلد العمل
WORKDIR /app

# نسخ المشروع داخل الكونتينر
COPY . /app

# تثبيت البايثون باعتماد ملف المتطلبات
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

# فتح البورت الخاص بالتطبيق
EXPOSE 7860

# تشغيل التطبيق
CMD ["python3", "start_server.py"]
