"""Raphael service: raphael-licensing."""

from __future__ import annotations

from fastapi import FastAPI
from fastapi.responses import JSONResponse

from raphael_contracts.errors import ErrorResponse
from raphael_licensing.routes import router

app = FastAPI(
    title="raphael-licensing",
    description="License templates, propagation, royalties",
    version="0.1.0",
    openapi_url="/v1/licensing/openapi.json" if "/v1/licensing" else "/openapi.json",
)

app.include_router(router, prefix="/v1/licensing" if "/v1/licensing" else "")


@app.get("/health")
def health() -> dict[str, str]:
    return {"status": "ok", "service": "raphael-licensing"}


@app.exception_handler(Exception)
async def unhandled(_request, exc: Exception) -> JSONResponse:
    err = ErrorResponse(code="internal_error", message=str(exc))
    return JSONResponse(status_code=500, content=err.model_dump())
