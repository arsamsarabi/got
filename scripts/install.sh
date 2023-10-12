#!/bin/sh

export GOT_DEBUG="true"

source './scripts/install_deps.sh'
source './scripts/copy_files.sh'
source './scripts/add_alias.sh'
source './scripts/utilities.sh'

install_deps
copy_files
add_alias
tell '🎉 Done! Run "got" to get started.'

