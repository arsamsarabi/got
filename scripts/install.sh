#!/bin/sh

export GOT_DEBUG="true"

source './scripts/install_deps.sh'
source './scripts/copy_files.sh'
source './scripts/add_alias.sh'
source './scripts/utilities.sh'

print_header
install_deps
copy_files
add_alias
pretty_print '🎉 Done! Run "got" to get started.'

