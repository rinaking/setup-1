# 기여 방법

## 환경 준비

[docs/01-빠른-시작.md](docs/01-빠른-시작.md).

## 작업 흐름

1. `main` 최신화 후 브랜치 생성: `git switch main && git pull && git switch -c feat/x`.
2. 작업 → `make check` 통과 확인.
3. 의존성을 바꿨으면 `uv lock` 실행, `uv.lock` 을 커밋에 포함.
4. `git push -u origin feat/x` → PR 생성 (`gh pr create --fill --web`).
5. CI 통과 + 리뷰 승인 1개 → **Squash and merge** → 브랜치 삭제.

규칙 상세: [docs/03-협업-흐름.md](docs/03-협업-흐름.md).

## 커밋 메시지

Conventional Commits: `feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `chore:`.

## 보고

버그·제안은 [Issues](https://github.com/rinaking/setup-1/issues) 에 템플릿으로 등록.
