SHARE = ${HOME}/.local/share
SOURCE = ${HOME}/.dotfiles/vim

${SHARE}/dein.nvim: dein

${SHARE}/dein.vim: dein

clean:
	rm -f ${HOME}/.config/nvim
	rm -f ${HOME}/.ctags
	rm -f ${HOME}/.vim
	rm -f ${HOME}/.viminfo
	rm -f ${HOME}/.vimoutlinerrc
	rm -f ${HOME}/.vimpagerrc
	rm -f ${HOME}/.vimrc
	rm -fr ${SHARE}/dein.nvim
	rm -fr ${SHARE}/dein.vim
	rm -fr ${SHARE}/nvim
	rm -fr ${SHARE}/vim

dein:
	mkdir -p ${SHARE}
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > install.sh
	if [ ! -d ${SHARE}/dein.nvim ]; then \
		sh install.sh ${SHARE}/dein.nvim ; \
	fi
	if [ ! -d ${SHARE}/dein.vim ]; then \
		sh install.sh ${SHARE}/dein.vim ; \
	fi
	rm -f install.sh

install: ${SHARE}/dein.nvim ${SHARE}/dein.vim
	ln -snf ${SOURCE} ${HOME}/.vim
	ln -snf ${SOURCE}/config/ctags ${HOME}/.ctags
	ln -snf ${SOURCE}/config/vimoutlinerrc ${HOME}/.vimoutlinerrc
	ln -snf ${SOURCE}/config/vimpagerrc ${HOME}/.vimpagerrc
	ln -snf ${SOURCE}/config/vimrc ${HOME}/.vimrc
	ln -snf ${SOURCE}/nvim ${HOME}/.config/nvim
	mkdir -p ${SHARE}/nvim
	mkdir -p ${SHARE}/vim
