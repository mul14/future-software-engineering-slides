.PHONY: serve open

serve:
	npx @marp-team/marp-cli . --theme-set themes/ --allow-local-files --server

open:
	npm run build && open slides.html
