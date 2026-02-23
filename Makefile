.PHONY: serve

serve:
	npx @marp-team/marp-cli . --theme-set themes/ --allow-local-files --server
