"""``python -m setup1`` 진입점."""

from __future__ import annotations

import sys

from setup1.example import summarize


def main() -> None:
    """예시 요약 통계를 표준 출력에 쓴다."""
    result = summarize([1.0, 2.0, 3.0, 4.0])
    sys.stdout.write(f"{result}\n")


if __name__ == "__main__":  # pragma: no cover
    main()
