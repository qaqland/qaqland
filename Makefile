# helper for md2html

TITLE := qaqland
CSS_URL := "nginx.css"

all: output/index.html

output:
	mkdir -p $@
	touch output/.nojekyll

output/nginx.css: nginx.css | output
	cp nginx.css $@

output/index.html: README.md | output/nginx.css
	md2html -f $< \
		--html-title="$(TITLE)" \
		--html-css="$(CSS_URL)" \
		--funderline \
		--fstrikethrough \
		-o $@

clean:
	rm -r output
