build:
	mkdocs build

serve:
	mkdocs serve

node_modules:
	npm install

cv-files: node_modules
	node_modules/.bin/hackmyresume build cv/resume.json TO out/voronenko.all
cv-analyze: node_modules
	node_modules/.bin/hackmyresume analyze cv/resume.json
cv-validate: node_modules
	node_modules/.bin/hackmyresume validate cv/resume.json
