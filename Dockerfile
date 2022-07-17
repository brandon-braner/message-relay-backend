FROM --platform=linux/amd64 python:3.10

WORKDIR /code

ENV PATH /root/.local/bin:$PATH
RUN apt-get update && apt-get upgrade -y && \
    apt install -y python3-pip && \
    rm -rf /var/lib/apt/lists/*

COPY ./ /code

RUN python -m pip install --no-cache-dir --use-deprecated=legacy-resolver -r requirements.txt

ENV PORT=8080
EXPOSE 8080

#CMD ["poetry", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
CMD gunicorn main:app --workers 4 --worker-class uvicorn.workers.UvicornWorker --bind 0.0.0.0:8080

# If running behind a proxy like Nginx or Traefik add --proxy-headers
#CMD uvicorn app.main:app --host 0.0.0.0 --port :$PORT --proxy-headers
