ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

CACHE = ${HOME}/.cache
NVIM  = ${HOME}/.config/nvim
SHARE = ${HOME}/.local/share

clean:
	rm -fr ${CACHE}/nvim
	rm -fr ${CACHE}/vim
	rm -f ${HOME}/.ctags
	rm -f ${HOME}/.viminfo
	rm -f ${HOME}/.vimoutlinerrc
	rm -f ${HOME}/.vimpagerrc
	rm -f ${HOME}/.vimrc
	rm -f ${NVIM}/after
	rm -fr ${SHARE}/dein.nvim
	rm -fr ${SHARE}/dein.vim
	rm -fr ${SHARE}/nvim
	rm -fr ${SHARE}/vim
	#
	gem uninstall --all --user-install neovim || true
	#
	pip uninstall pynvim || true
	pip3 uninstall pynvim || true

install: | ${HOME}/.vim dein
	mkdir -p ${CACHE}/nvim
	mkdir -p ${CACHE}/vim
	mkdir -p ${NVIM}
	#
	ln -snf ${ROOT_DIR}/after ${NVIM}/after
	ln -snf ${ROOT_DIR}/config/ctags ${HOME}/.ctags
	ln -snf ${ROOT_DIR}/config/vimoutlinerrc ${HOME}/.vimoutlinerrc
	ln -snf ${ROOT_DIR}/config/vimpagerrc ${HOME}/.vimpagerrc
	ln -snf ${ROOT_DIR}/config/vimrc ${HOME}/.vimrc

${HOME}/.vim:
	ln -snf $(ROOT_DIR) ${HOME}/.vim

dein:
	mkdir -p ${SHARE}
	mkdir -p ${SHARE}/nvim
	mkdir -p ${SHARE}/vim
	#
	curl --silent https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh --output install.sh
	#
	if [ ! -d ${SHARE}/dein.nvim ]; then sh install.sh ${SHARE}/dein.nvim; fi
	if [ ! -d ${SHARE}/dein.vim ]; then sh install.sh ${SHARE}/dein.vim; fi
	#
	rm -f install.sh

ruby:
	gem install --user-install neovim

python:
	pip install pynvim
	pip3 install pynvim
