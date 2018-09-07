# My Vim CheatSheet
## Basic Keybind
 + Insert Mode
   + i
 + Escape Mode
   + [Esc]
 + Visual Mode
   + v
 + Line Feed and Insert Mode
   + o
 + Write file
   + :w
 + Close file
   + :q
 + Go to file top
   + gg
 + Go to file bottom
   + [Shift]g
 + Go to line head
   + 0
 + Go to line tail
   + $
 + Yank
   + y<number_or_area>
   + yy
 + Cut
   + d<number_or_area>
   + dd
   + x
 + Paste
   + p
   + p<number_or_area>
 + Undo
   + u
 + Modify character
   + r<after_char>
 + Count up for number
   + [Ctrl]a
 + Grep
   + vimgrep "pattern" *file_pattern*
     + move: cn, cp
 + Rectangular selection
   + [Ctrl]v
     + [Shift]<vim_shortcut>
 + For inner brackets( "(", "{" ), quoate("'", '"'), tag("t")
   + select
     + vi)
   + delete
     + di)
   + delete and insert
     + ci)
 + Register/Done/Show macro
   + qa, <command>, q
   + @a
   + :reg

## Customize Vim Keybind
 + Path completion
   + [Tab][Tab]
 + New Tab
   + tn
 + Move Tab
   + t<tab_numer>
 + Close Tab
   + tc
 + Move between toggle
   + s[hjklw]
   + Ctrl-[hjklw]
 + Move toggle
   + Ctrl-[HJKLr]

## Plugin Keybind
### Often
 + Completion & Snippets
   + [Tab]
 + Comment out for line
   + \c{ }
 + Open markdown preview
   + :PrevimOpen
 + Open/Close filer
   + ,uf & [Del]
   + :VimFiler & q
   + :NERDTree & :q
 + Show Yank History
   + :YRShow
 + Paste Yank form History
   + :YRGetElem <history_number>
 + View TagBar
   + :TagbarToggle
 + View Undo Tree
   + :GundoToggle
   + :undolist
 + Git command
   + :Gwrite
   + :Gread
   + :Gremove
   + :Gmove
   + :Gcommit
   + :Gblame

### Sometimes
 + Surround Char for text
   + yss'
 + Delete Surround Char for text
   + ds'
 + Change Surround Char
   + cs'"
 + Execute program
   + :QuickRun
 + Wakeup shell on vim
   + :VimShell
 + Markdown Table Writing Helper
   + :TableModeEnable & :TableModeDisable
 + Show Vim CheatSheet
   + :Cheat

## Plugin List
[Show Here](./vim/vimrc)
