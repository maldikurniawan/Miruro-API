FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY api.py .

# Expose the default FastAPI port
EXPOSE 8002

# Run the application with uvicorn
CMD ["sh", "-c", "uvicorn api:app --host 0.0.0.0 --port ${PORT:-8002}"]