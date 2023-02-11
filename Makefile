.PHONY: setup
setup:
	@python -m venv venv
	@venv/bin/pip install --upgrade pip
	@venv/bin/pip install -r requirements.txt -r requirements.dev.txt
	@pre-commit install

.PHONE: run
run:
	@python -m gunicorn -k uvicorn.workers.UvicornWorker --chdir src app:app --reload
