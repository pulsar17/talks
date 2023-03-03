---
title: Bash 101 - 🐚
author: Ishaan Arora
date: 2023-03-04
styles:
    style: monokai
---

# `$ whoami`
- ♥ - 🐍 🐧 🎨
- [@pulsar17 - GitLab](https://gitlab.com/pulsar17) [@pulsar17 - GitHub](https://github.com/pulsar17)
- [pulsar17.me](https://pulsar17.me)
- [@pulsar17](https://mastodon.social/@pulsar17) on Mastodon
- [@realpulsar17](https://twitter.com/realpulsar17) on Twitter

---------

# What is a shell anyway?
- 🐚?
- A shell is a normal program
    - like `ls`, `mkdir`, `rm`
- Purpose: execute other programs
- Picture Time: `📎shell.svg`

---------

# How to get help 
- `man <command>`
- `<command> --help`
- `info <command>`
- `<command>`

---------

# History of shells
- `sh` - Thompson shell (💀)
.  
.  
.  
- `csh` - C shell (generally available on BSD derivatives)
- `sh` - bourne shell
- `ksh` - KornShell
- **`bash`** - Bourne Again SHell (🐚)
- `zsh` - Z Shell

- You can *change* your shell [Demo]

--------
# How shell finds a command
--------

# Shell as a programming language
- variables
- if statements 
- flow control - `&&`, `||`, and `&`
    - `mkdir dir` `&&` `cd dir`
    -
    -
- for loop

--------

# Shell tips
[Demo]
- `sudo !!`
- `clear`
- `Alt` + `Shift` + `#`
- Delete a line - `Ctrl` + `E`, `Ctrl` + `U`
- `Ctrl` + `Z` - Job control
- Command substitution `for i in $(seq 1 10); do sleep 0.8; echo -ne "\a"; done`

-------

# About the slides

## License
[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)
