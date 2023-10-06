.PHONY: all install_deps install_got add_alias finish_message

all: install_deps install_got add_alias finish_message

install_deps:
	./scripts/install-deps.sh

install_got:
	./scripts/install-got.sh

add_alias:
	./scripts/add-alias.sh

finish_message:
	./scripts/finish-message.sh
