.DEFAULT_GOAL:=help
.PHONY: help
help: ## Show this help message.
	@echo 'usage: make [target] [USE_DOCKER=true]'
	@echo
	@echo 'targets:'
	@grep -E '^[8+a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: dev_req
dev_req: ## Installs dbt-rpc in develop mode along with only development dependencies.
	@\
	pip install -r dev-requirements.txt
	pip install -r editable-requirements.txt

.PHONY: dev-uninstall
dev-uninstall: ## Uninstall all packages in venv except for build tools
	@\
    pip freeze | grep -v "^-e" | cut -d "@" -f1 | xargs pip uninstall -y; \
    pip uninstall -y dbt-rpc

.PHONY: clean
clean: ## Resets development environment.
	@echo 'cleaning repo...'
	@rm -rf .eggs/
	@rm -rf build/
	@rm -rf dbt_rpc.egg-info/
	@rm -rf dist/
	@rm -rf logs/
	@rm -rf target/
	@find . -type f -name '*.pyc' -delete
	@find . -type d -name '__pycache__' -depth -delete
	@echo 'done.'