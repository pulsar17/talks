---
title: Where do the 🐍🐍🐍 go? [hint - venvs]
author: Ishaan Arora
date: 2022-09-24
styles:
    style: monokai
---

# `$ whoami`
- ♥ - 🐍 🐧 🎨
- [@pulsar17 - GitLab](https://gitlab.com/pulsar17)
- [@pulsar17 - GitHub](https://github.com/pulsar17)
- [pulsar17.me](https://pulsar17.me)
- [@realpulsar17 - Twitter](https://twitter.com/realpulsar17)

---------

# Discarded titles
- ~~Why venv why?~~
- ~~🧙🔥: venvs~~
- ~~?/~~

## A lot of stories in the talk

---------

# Why am I giving this talk
- venvs ~~are~~ can be *confusing*
- venv = 🧙 [when I started]

---------

# Let me tell you a story
- 🧙
- 🐍
- ©
- `python3 -m venv venv`
- `source venv/bin/activate`
- 😀 → 😕
- The End

--------

# Why venvs?
- Wanna use - `numpy`, `requests`


- So `pip install` them.
- Unfortunately, packages have versions.
- Newer ones are generally 🍰🍒
- only `import requests`

---------

# Why venvs? (contd)

- no `import requests@2.28.1`
- ok, fine
- `pip install requests==2.28.1`
- then import
- what if?
- I need to use the latest `requests==2.30.0` (suppose it has a security patch)

---------

# Why venvs? (contd)

- by default it's 🐰👐🏻☭ *OUR PIP*
- no isolation for different projects
- by default
    `pip install`s *globally* *

---------

# Why venvs? (contd)

- install = move files to well known locations
    - can 🔍 and 🍔 them
    - can ❌ them

- for me that location will be 
    - `~/.local/lib/python3.10/site-packages`

---------

```
/home/pulsar17/.local/lib/python3.10/site-packages
├── chardet
├── chardet-3.0.4.dist-info
├── charset_normalizer
├── charset_normalizer-2.0.12.dist-info
├── forbiddenfruit
├── forbiddenfruit-0.1.4.dist-info
├── idna
├── idna-2.10.dist-info
├── requests
├── requests-2.28.0.dist-info
├── urllib3
└── urllib3-1.25.11.dist-info

12 directories, 0 files
```

---------
# How to mess up your system 101

- do `sudo pip install` 💀


- do `pip install --user` (kinda 🆗)

---------

# *There must be a better way*™
- Yes, use virtual environments

- use the `venv` module
    - `python3 -m venv venv`

---------

# About the slides

## Slides created thanks to
- [lookatme](https://pypi.org/project/lookatme/)
- and ofcourse Python 🐍

## License
[CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)
