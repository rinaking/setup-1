# 세팅1

[![CI](https://github.com/rinaking/setup-1/actions/workflows/ci.yml/badge.svg)](https://github.com/rinaking/setup-1/actions/workflows/ci.yml)
![Python](https://img.shields.io/badge/python-3.13-blue)
![deps](https://img.shields.io/badge/deps-uv-261230)
![license](https://img.shields.io/badge/license-MIT-green)

Python 데이터·ML 팀 협업을 위한 기준 저장소. Dev Container · Docker · `uv.lock` 으로 OS 와 무관하게 같은 환경을 재현한다.

## 빠른 시작

### Dev Container (권장)

VS Code 에서 저장소를 열고 명령 팔레트 → **Dev Containers: Reopen in Container**.

### 로컬

```bash
# uv 설치 — macOS/Linux
curl -LsSf https://astral.sh/uv/install.sh | sh
# Windows(PowerShell): irm https://astral.sh/uv/install.ps1 | iex

uv sync --frozen
uv run pre-commit install --install-hooks
uv run pytest
```

### Docker

```bash
docker build -t setup1:local .
docker run --rm setup1:local
```

## 개발 명령

| 명령 | 동작 |
| --- | --- |
| `make check` | lint · type · test 전체 |
| `make test` | pytest + 커버리지 |
| `make format` | ruff 포매팅 |
| `make lock` | `pyproject.toml` 변경을 `uv.lock` 에 반영 |
| `uv add <패키지>` | 실행 의존성 추가 (`uv.lock` 갱신) |
| `uv add --dev <패키지>` | 개발 의존성 추가 |

## 문서

| 문서 | 내용 |
| --- | --- |
| [빠른 시작](docs/01-빠른-시작.md) | 환경 준비 세 가지 방법 |
| [개발 환경](docs/02-개발-환경.md) | uv · Dev Container · Docker · 재현성 |
| [협업 흐름](docs/03-협업-흐름.md) | 브랜치 · 커밋 · PR · 리뷰 · 병합 |
| [코드 품질](docs/04-코드-품질.md) | ruff · mypy · pytest · pre-commit |
| [CI](docs/05-ci.md) | GitHub Actions · Dependabot |
| [트러블슈팅](docs/06-트러블슈팅.md) | 환경별 오류와 해결 |
| [디렉터리 구조](docs/07-디렉터리-구조.md) | 파일 배치 규칙 |

기여 방법은 [CONTRIBUTING.md](CONTRIBUTING.md).

## 라이선스

MIT — [LICENSE](LICENSE).
