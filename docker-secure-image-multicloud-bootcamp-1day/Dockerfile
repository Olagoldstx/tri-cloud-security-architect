
# ---- build stage ----
FROM python:3.12-slim AS build

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# RUN apt-get update && apt-get install -y --no-install-recommends \
#     build-essential ca-certificates \ && rm -rf /var/lib/apt/lists/*
# 
WORKDIR /wheels
COPY app/requirements.txt ./
RUN pip wheel --no-cache-dir --wheel-dir /wheels -r requirements.txt

# ---- runtime stage ----
FROM gcr.io/distroless/python3-debian12:nonroot

LABEL org.opencontainers.image.source="https://github.com/you/docker-secure-image-multicloud-bootcamp-1day" \
      org.opencontainers.image.description="Secure Flask example with defense-in-depth" \
      org.opencontainers.image.licenses="Apache-2.0"

WORKDIR /app
COPY --from=build /wheels /wheels
COPY app/ /app/

ENV PYTHONPATH=/app
ENV APP_ENV=prod
EXPOSE 8080

CMD ["/usr/bin/python3", "-m", "gunicorn", "-w", "2", "-b", "0.0.0.0:8080", "main:app"]
