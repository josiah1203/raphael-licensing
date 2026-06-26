FROM python:3.11-slim
WORKDIR /app
RUN pip install --no-cache-dir uv
COPY pyproject.toml README.md ./
COPY src ./src
RUN uv pip install --system -e .
ENV RAPHAEL_SERVICE_PORT=8086
EXPOSE 8086
CMD ["uvicorn", "raphael_licensing.app:app", "--host", "0.0.0.0", "--port", "8086"]
