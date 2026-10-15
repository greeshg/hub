FROM python:3.10
WORKDIR / Hello
COPY . .
CMD ["python","Hello.py"]
