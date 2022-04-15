.DEFAULT_GOAL := help
.PHONY: help
help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

all: dotconfig baseroot zsh

hello: ## init hello
	@echo "hello!!"

dotconfig: ## dotconfig
	@bash $(CURDIR)/scripts/dotconfig.sh

baseroot: ## baseroot
	@bash $(CURDIR)/scripts/dothome.sh

zsh: ## zsh
	@bash $(CURDIR)/scripts/dotzsh.sh
