"""``setup1.example`` 과 진입점 테스트."""

from __future__ import annotations

import pytest

from setup1.__main__ import main
from setup1.example import Summary, summarize


def test_summarize_basic() -> None:
    result = summarize([1.0, 2.0, 3.0, 4.0])
    assert result == Summary(count=4, mean=2.5, minimum=1.0, maximum=4.0)


def test_summarize_single_value() -> None:
    assert summarize([42.0]) == Summary(count=1, mean=42.0, minimum=42.0, maximum=42.0)


def test_summarize_accepts_integers() -> None:
    result = summarize([2, 4, 6])
    assert result.mean == 4.0
    assert result.minimum == 2.0
    assert result.maximum == 6.0


def test_summarize_rejects_empty() -> None:
    with pytest.raises(ValueError, match="must not be empty"):
        summarize([])


def test_main_writes_summary(capsys: pytest.CaptureFixture[str]) -> None:
    main()
    out = capsys.readouterr().out
    assert "count=4" in out
