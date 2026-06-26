"""API routes for raphael-licensing."""

from __future__ import annotations

from fastapi import APIRouter

router = APIRouter(tags=["raphael-licensing"])


@router.get("")
def list_root() -> dict[str, str]:
  return {"service": "raphael-licensing", "status": "stub"}
