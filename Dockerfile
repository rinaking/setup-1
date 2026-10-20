# syntax=docker/dockerfile:1

# 1) uv 바이너리 확보
FROM ghcr.io/astral-sh/uv:0.13.3 AS uv

# 2) 의존성 설치 — .venv 구성 (개발 도구 제외)
FROM python:3.13-slim AS builder
COPY --from=uv /uv /uvx /bin/
ENV UV_COMPILE_BYTECODE=1 \
    UV_LINK_MODE=copy \
    UV_PYTHON_DOWNLOADS=never
WORKDIR /app
COPY pyproject.toml uv.lock README.md ./
COPY src ./src
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --frozen --no-dev --no-editable

# 3) 런타임 — .venv 만 복사, 비루트 실행
FROM python:3.13-slim AS runtime
ENV PATH="/app/.venv/bin:$PATH" \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1
RUN groupadd --system app && useradd --system --gid app --uid 1000 --create-home app
WORKDIR /app
COPY --from=builder --chown=app:app /app/.venv /app/.venv
USER app
CMD ["python", "-m", "setup1"]
