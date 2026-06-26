# Build from ~/Projects:
#   docker build -f raphael-licensing/Dockerfile .
FROM python:3.11-slim
WORKDIR /app
RUN pip install --no-cache-dir uv
COPY raphael-contracts /deps/raphael-contracts
RUN uv pip install --system /deps/raphael-contracts
COPY raphael-licensing/pyproject.toml raphael-licensing/README.md ./
COPY raphael-licensing/src ./src
RUN python3 -c "import re; from pathlib import Path; p=Path('pyproject.toml'); p.write_text(re.sub(r'\n\[tool\.uv\.sources\][^\[]*','\n',p.read_text(),flags=re.S))"
RUN uv pip install --system -e .
ENV RAPHAEL_SERVICE_PORT=8086
EXPOSE 8086
CMD ["uvicorn", "raphael_licensing.app:app", "--host", "0.0.0.0", "--port", "8086"]
