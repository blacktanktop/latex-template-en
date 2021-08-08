export PWD=`pwd`
export DIR=.
export FILENAME=main
CONTAINER=pman0214/alpine-texlive-ja-epspdf
# ===========================================
latexmk: ## compile LaTeX
	docker run --rm -v $(PWD)/$(DIR):/app $(CONTAINER) latexmk $(FILENAME).tex
clean: ## Remove intermediate files and .dvi, .ps, and .pdf files.
	docker run --rm -v $(PWD)/$(DIR):/app $(CONTAINER) latexmk -C $(FILENAME).tex
help: ## this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
