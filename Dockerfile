FROM ghcr.io/marketsquare/robotframework-browser/rfbrowser-stable:19.3.1

WORKDIR /app

COPY pyproject.toml uv.lock .python-version ./

RUN pip install uv && uv sync
RUN uv pip freeze > requirements.txt
RUN pip install -r requirements.txt

USER root
RUN mkdir -p results/
