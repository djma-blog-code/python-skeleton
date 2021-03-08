#
# Makefile
#
.EXPORT_ALL_VARIABLES:

#set default ENV based on your username and hostname
APP_DIR=app
TEST_DIR=$(APP_DIR)/test
SRC_DIR=$(APP_DIR)/src
DOCS_DIR=$(APP_DIR)/docs
VENV=python-skeleton-venv
PROGRAM=run.py
TOUCH_FILES=requirements docs-requirements
TEMP_FOLDERS=coverage_html_report $(VENV) $(DOCS_DIR)/build

help:
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36mmake %-30s\033[0m %s\n", $$1, $$2}'

virtual-env: ## Creates a virtual environment for the python dependencies
	@echo "=========> Creating local python venv"
	python3 -m venv $(VENV)/

requirements: virtual-env ## Install python dependencies
	@echo "=========> Installing Requirements within the created virtual environment"
	( \
		source $(VENV)/bin/activate; \
		pip install -r $(APP_DIR)/requirements.txt; \
		pip install -r $(APP_DIR)/test-requirements.txt; \
    )
	touch $@

docs-requirements: virtual-env ## Install python dependencies
	@echo "=========> Installing Requirements within the created virtual environment"
	( \
		source $(VENV)/bin/activate; \
		pip install -r $(APP_DIR)/docs-requirements.txt; \
    )
	touch $@

html-docs: changelog docs-requirements ## Build html documentation
	@echo "=========> Building HTML documents"
	( \
		source $(VENV)/bin/activate; \
		cd $(DOCS_DIR); \
		make html; \
	)
	echo -e "\033[0;32m**** Documents are now built. run command 'firefox $(DOCS_DIR)/build/html/index.html' to view ****\033[0m"

unittest: virtual-env requirements ## run the unit tests for the app
	@echo "=========> Running Unit Tests"
	( \
		source $(VENV)/bin/activate; \
		PYTHONPATH=$(APP_DIR):$(PYTHONPATH) pytest $(TEST_NAME) ; \
	)

coverage: virtual-env requirements ## generate a coverage report for the unit tests
	@echo "=========> Running Coverage Report"
	( \
		source $(VENV)/bin/activate; \
		PYTHONPATH=$(APP_DIR):$(PYTHONPATH) pytest --cov-report term-missing --cov=src $(TEST_DIR); \
	)

changelog: docs-requirements ## generate a new changelog
	gitchangelog -d > app/docs/source/Changelog.rst

minor-revision:

ci: unittest coverage ## unit tests and coverage report in one

clean: ## clean everything up
	-rm $(TOUCH_FILES)
	-rm -Rf $(TEMP_FOLDERS)


.PHONY: help clean unittest coverage  
