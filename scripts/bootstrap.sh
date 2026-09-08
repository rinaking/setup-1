#!/usr/bin/env sh
# 로컬 개발 환경 초기화: uv 설치 → 의존성 동기화 → pre-commit 훅 설치.
set -eu

if ! command -v uv >/dev/null 2>&1; then
    echo "uv 를 설치합니다..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    export PATH="${HOME}/.local/bin:${PATH}"
fi

uv sync --frozen
uv run pre-commit install --install-hooks

echo "완료. 'uv run pytest' 로 확인하세요."
