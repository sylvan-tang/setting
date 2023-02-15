#!/usr/bin/env bash

if [[ ! -d $HOME/instantclient_19_8 ]]; then
	pushd $HOME
	wget https://download.oracle.com/otn_software/mac/instantclient/198000/instantclient-basic-macos.x64-19.8.0.0.0dbru.zip
	unzip instantclient-basic-macos.x64-19.8.0.0.0dbru.zip
	rm instantclient-basic-macos.x64-19.8.0.0.0dbru.zip
	popd
	ln -sf "$HOME/.oci8.pc" $HOME/instantclient_19_8/oci8.pc
fi

export PKG_CONFIG_PATH=$HOME/instantclient_19_8
export DYLD_LIBRARY_PATH=$HOME/instantclient_19_8
export LD_LIBRARY_PATH=$HOME/instantclient_19_8
