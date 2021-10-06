install:
	pip install -r /app/requirements.txt

install-dev:
	pip install -r /app/requirements-dev.txt

packages:
	pip-compile /app/requirements.in

packages-dev:
	pip-compile /app/requirements-dev.in

upgrade:
	pip-compile --upgrade /app/requirements.in

upgrade-dev:
	pip-compile --upgrade /app/requirements-dev.in
