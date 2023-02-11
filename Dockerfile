FROM python:3.10

ENV PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=100

# Copy only requirements to cache them in docker layer
WORKDIR /code

# Creating folders, and files for a project:
COPY . /code

# Project initialization:
RUN python -m pip install --upgrade pip && \
  python -m pip install .

CMD [ "python", "-m", "gunicorn", "-k", "uvicorn.workers.UvicornWorker", \
  "--chdir", "src", "app:app", "--reload" ]
