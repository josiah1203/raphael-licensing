# raphael-licensing

License templates, propagation, royalties

## API

- Prefix: `/v1/licensing`
- Port: `8086`
- Health: `GET /health`

## Events

_Published and consumed events documented in `openapi.yaml` and raphael-contracts._

## Development

```bash
uv sync
uv run uvicorn raphael_licensing.app:app --reload --port 8086
```

Part of the [Raphael Platform](https://github.com/hummingbird-labs) by HummingBird Labs.
