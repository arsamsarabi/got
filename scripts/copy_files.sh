function copy_files {
  clear
  tell '💾 Installing got on your system'
  rm -rf ~/.got
  mkdir ~/.got
  cp -a  ./app/. ~/.got
  chmod +x ~/.got/got.sh
}
