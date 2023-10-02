.PHONY: all install_deps build install_got add_alias finish_message

all: install_deps build install_got add_alias finish_message

install_deps:
	echo "📦 Installing dependencies..."
	echo "installing go and gum using brew"
	clear
	brew install go gum shc

build:
	echo "🛠️ Building executable..."
	shc -f ./src/main.sh
	rm -rf ./src/main.sh.x.c
	rm -rf ./bin
	mkdir ./bin
	mv ./src/main.sh.x ./bin/got
	chmod +x ./bin/got

install_got:
	echo "💾 Installing got..."
	cp ./bin/got /usr/local/bin/got

add_alias:
	echo "🔗 Adding alias..."
	echo "alias got='got'" >> ~/.zshrc
	echo "alias got='got'" >> ~/.bashrc
	echo "alias got='got'" >> ~/.bash_profile
	source ~/.zshrc && source ~/.bashrc && source ~/.bash_profile

finish_message:
	echo "🎉 Done! Run 'got' to get started."
