# Sử dụng Python 3.9
FROM python:3.9-slim

# Cài gói hệ thống cần thiết
RUN apt-get update && apt-get install -y \
    build-essential \
    default-libmysqlclient-dev \
    && rm -rf /var/lib/apt/lists/*

# Tạo thư mục app
WORKDIR /app

# Copy requirements
COPY requirements.txt .

# Cài thư viện Python
RUN pip install --no-cache-dir -r requirements.txt

# Copy toàn bộ code vào container
COPY . .

# Expose port Flask
EXPOSE 5000

# Run Flask app
CMD ["python", "src/app.py"]
