.PHONY: install install-dev format lint test all clean

install:
	pip install -r requirements.txt

install-dev:
	pip install -r requirements-dev.txt

format:
	ruff format src tests

lint:
	ruff check src tests

test:
	pytest tests -v

all: format lint test

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -type d -name ".ruff_cache" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
