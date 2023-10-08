function copy_files {
  print_header
  pretty_print '💾 Installing got on your system'
  rm -rf ~/.got
  mkdir ~/.got
  cp -a  ./app/. ~/.got
  chmod +x ~/.got/got.sh
}
