.DEFAULT_GOAL := help
.PHONY: help setup lock sync lint format typecheck test check pre-commit docker clean

help: ## 타깃 목록
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN{FS=":.*?## "}{printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}'

setup: ## 의존성 동기화 + pre-commit 훅 설치
	uv sync --frozen
	uv run pre-commit install --install-hooks

lock: ## pyproject.toml 변경을 uv.lock 에 반영
	uv lock

sync: ## uv.lock 그대로 환경 재현
	uv sync --frozen

lint: ## ruff 정적 검사
	uv run ruff check .

format: ## ruff 포매터 적용
	uv run ruff format .

typecheck: ## mypy 타입 검사
	uv run mypy

test: ## pytest + 커버리지
	uv run pytest

check: lint typecheck test ## lint + typecheck + test + 포맷 검사
	uv run ruff format --check .

pre-commit: ## 모든 파일에 pre-commit 실행
	uv run pre-commit run --all-files

docker: ## 런타임 이미지 빌드 + 스모크 실행
	docker build -t setup1:local .
	docker run --rm setup1:local

clean: ## 캐시·빌드 산출물 삭제
	rm -rf .venv .mypy_cache .pytest_cache .ruff_cache .coverage htmlcov dist build
