# Edition
|Command        |Meaning                    |
|---------------|---------------------------|
|x              |Removes character at cursor|
|X              |Removes character before cursor|
|d{motion}      |Delete until {motion}      |
|dd             |Delete line                |
|D              |Delete until end of line   |
|I              |Insert before first non-blank|
|i              |Insert (left of cursor)    |
|a              |Append (right of cursor)   |
|A              |Append on end of line      |
|o              |Create line below cursor   |
|O              |Create line above cursor   |
|:read {name}   |Insert {name} file         |
|:read !{cmd}   |Insert output of {cmd}     |
|p              |Paste after                |
|gp             |Paste after and put cursor after|
|P              |Paste before               |
|gP             |Paste before and put cursor after|
|yy             |Yank current line          |
|y$             |Yank until end of line     |
|yw             |Yank word                  |

# Navigation
|Command        |Meaning                    |
|---------------|---------------------------|
|^              |First non-blank character  |
|0              |Beginning of line          |
|$              |End of line                |
|gg             |Beginning of file          |
|G              |End of file                |
|b              |Beginning of word          |
|e              |End of word                |

# Tabs
|Command        |Meaning                    |
|---------------|---------------------------|
|:tabedit {file}|Edit file in new tab       |
|:tabclose      |Close current tab          |
|:tabclose {i}  |Close `i`-th tab           |
|:tabonly       |Close other tabs           |
|:tabs          |List all tabs              |
|:tabm 0        |Move current tab to first  |
|:tabm          |Move current tab to last   |
|:tabm {i}      |Move current tab to `i+1`  |
|:tabn          |Go to next tab             |
|gt             |Go to next tab             |
|:tabp          |Go to previous tab         |
|gT             |Go to previous tab         |
|:tabfirst      |Go to first tab            |
|:tablast       |Go to last tab             |
|{i}gt          |Go to tab in position `i`  |

# Search
|Command        |Meaning                    |
|---------------|---------------------------|
|/{pattern}     |Search forward {pattern}   |
|?{pattern}     |Search backward {pattern}  |
|n              |Repeat latest forward      |
|N              |Repeat latest backward     |

# Selection
|Command        |Meaning                    |
|---------------|---------------------------|
|ctrl+v         |Rectangle selection        |
|v              |Visual mode (per character)|
|V              |Visual mode (per line)     |
|~              |Switch case                |
|d              |Delete                     |
|c              |Change                     |
|y              |Yank                       |
|>              |Indent right               |
|<              |Indent left                |

# Replace
|Command        |Meaning                    |
|---------------|---------------------------|
|:{range}s/{pattern}/{string}/{flags}|Replace {pattern} to {string}.<br>`c` - confirm each one,<br>`g` - all in line,<br>`i` - ignore case|

