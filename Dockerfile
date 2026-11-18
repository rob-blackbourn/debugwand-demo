FROM python:3.14

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt
COPY app.py .

# for the app
EXPOSE 8080
# for debugpy
EXPOSE 5679

ENTRYPOINT ["python", "app.py"]
