FROM python:3.12-slim
WORKDIR /final-project
COPY ./final-project .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
EXPOSE 80
EXPOSE 5080
CMD ["gunicorn", "--bind", "0.0.0.0:5080", "wsgi:app", "--workers", "3"]

