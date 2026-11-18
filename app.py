from datetime import datetime
from bareasgi import Application, HttpRequest, HttpResponse, text_writer
import uvicorn

app = Application()


@app.on_http_request({'GET'}, '/')
async def http_request_handler(_request: HttpRequest) -> HttpResponse:
    return HttpResponse(
        200,
        [(b'content-type', b'text/plain')],
        text_writer(f"The time is {datetime.now()}")
    )

uvicorn.run(app, host="0.0.0.0", port=8080)
