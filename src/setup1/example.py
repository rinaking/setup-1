"""표본 통계 유틸리티.

패키지 구조와 품질 도구(ruff·mypy·pytest) 파이프라인을 확인하기 위한 최소 구현이다.
"""

from __future__ import annotations

from collections.abc import Sequence
from dataclasses import dataclass


@dataclass(frozen=True, slots=True)
class Summary:
    """표본의 요약 통계."""

    count: int
    mean: float
    minimum: float
    maximum: float


def summarize(values: Sequence[float]) -> Summary:
    """숫자 시퀀스의 요약 통계를 계산한다.

    Args:
        values: 하나 이상의 실수.

    Returns:
        개수·평균·최솟값·최댓값을 담은 ``Summary``.

    Raises:
        ValueError: ``values`` 가 비어 있을 때.
    """
    if not values:
        raise ValueError("values must not be empty")
    total = float(sum(values))
    return Summary(
        count=len(values),
        mean=total / len(values),
        minimum=float(min(values)),
        maximum=float(max(values)),
    )
