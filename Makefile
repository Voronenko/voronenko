# Convenience makefile to set up the environment and build the documentation

python = python2.7

all: p-env/bin/pip docs

docs: out/html/index.html

out/html/index.html: README.rst docs/_static/css/* p-env/bin/sphinx-build # docs/_templates/* preprocess_sources
	@echo "Ablog build ${PWD}"
	@p-env/bin/sphinx-build -W docs out/html
	@touch $@
	@echo "Website was generated at '$@'."

docs_sources: docs/*.rst

#preprocess_sources: docs/*.rst.jinja2
#	p-env/bin/python code/bin/generate-docs

# NOTE: This requires you to have plantuml installed, so it's not hooked into
# any of the standard targets. Run it on demand.
plantuml: docs/diagrams/*.plantuml
	plantuml -tsvg $^


p-env/bin/sphinx-build: p-env/bin/pip
	@touch $@

p-env/bin/pip: p-env/bin/python
	p-env/bin/pip install -r requirements.txt

p-env/bin/python:
	virtualenv -p $(python) --no-site-packages p-env
	@touch $@


clean: clean_generated
	@rm -rf .Python p-env out

clean_generated:
	@find -type f -iname '*_generated.rst' -delete

.PHONY: all docs clean preprocess_sources
