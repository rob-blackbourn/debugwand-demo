FROM python:3.14

WORKDIR /app

COPY app-requirements.txt .
RUN pip install -r app-requirements.txt
COPY app.py .

# for the app
EXPOSE 8080
# for debugpy
EXPOSE 5679

ENTRYPOINT ["python", "app.py"]
