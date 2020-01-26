ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
CACHE = ${HOME}/.cache
NVIM = ${HOME}/.config/nvim
SHARE = ${HOME}/.local/share

clean:
	rm -f ${HOME}/.ctags
	rm -f ${HOME}/.viminfo
	rm -f ${HOME}/.vimoutlinerrc
	rm -f ${HOME}/.vimpagerrc
	rm -f ${HOME}/.vimrc
	rm -f ${NVIM}/after
	rm -fr ${CACHE}/nvim
	rm -fr ${CACHE}/vim
	rm -fr ${SHARE}/dein.nvim
	rm -fr ${SHARE}/dein.vim
	rm -fr ${SHARE}/nvim
	rm -fr ${SHARE}/vim

dein:
	mkdir -p ${SHARE}
	mkdir -p ${SHARE}/nvim
	mkdir -p ${SHARE}/vim
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > install.sh
	if [ ! -d ${SHARE}/dein.nvim ]; then sh install.sh ${SHARE}/dein.nvim; fi
	if [ ! -d ${SHARE}/dein.vim ]; then sh install.sh ${SHARE}/dein.vim; fi
	rm -f install.sh

${HOME}/.vim:
	ln -snf $(ROOT_DIR) ${HOME}/.vim

install: | dein ${HOME}/.vim
	mkdir -p ${CACHE}/nvim
	mkdir -p ${CACHE}/vim
	ln -snf ${ROOT_DIR}/config/ctags ${HOME}/.ctags
	ln -snf ${ROOT_DIR}/config/vimoutlinerrc ${HOME}/.vimoutlinerrc
	ln -snf ${ROOT_DIR}/config/vimpagerrc ${HOME}/.vimpagerrc
	ln -snf ${ROOT_DIR}/config/vimrc ${HOME}/.vimrc
	ln -snf ${ROOT_DIR}/after ${NVIM}/after
