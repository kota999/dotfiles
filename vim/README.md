my .vimrc and .vim

add evervim.vimrc for evervim setting

evervim is edit evernote from vim plugin

* Require : [Evervim](https://github.com/kakkyz81/evervim)

  Install markdown python-module

        pip install markdown # markdown python-module install

  If cannot use python from vim, reinstall vim.

* Initial step for evervim

  You need to get Developer Tokens from [Evernote Developer token](https://www.evernote.com/api/DeveloperToken.action)

  And add to .vimrc.

  let g:evervim_devtoken='YOUR_DVELOPER_TOKEN'

  You will setup evervim from vim console.

        :EvervimSetup

* Simple Usage

  you will execute evervim commands from vim console.

        :EvervimCreateNote # create new note
        :EvervimNotebookList # show list of notebook
        :EvervimListTags # show list of tags
        :EvervimSearchByQuery # serach your notebook
