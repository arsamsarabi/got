.PHONY: all install_deps install_got add_alias finish_message

all: install_deps install_got add_alias finish_message

install_deps:
	clear
	echo "----------------------------------------"
	echo "📦 Installing go and gum using brew"
	brew install go gum

install_got:
	echo "----------------------------------------"
	echo "💾 Installing got on your system"
	rm -rf ~/.got
	mkdir ~/.got
	cp -a  ./app/. ~/.got
	chmod +x ~/.got/got.sh

add_alias:
	echo "----------------------------------------"
	echo "🔗 Adding alias"
	echo "alias got='~/.got/got.sh'" >> ~/.bashrc
	source ~/.bashrc

finish_message:
	echo "----------------------------------------"
	echo "🎉 Done! Run 'got' to get started."
