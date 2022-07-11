---
title: Having fun with text in Python or 🐍❤🔠
author: Ishaan Arora
date: 2022-07-23
extensions: [terminal, file_loader]
styles:
    style: monokai
---

# `$ whoami`
- QA Intern at Aakash BYJU's
- ♥ - 🐍 🐧 🎨
- [@pulsar17 - GitLab](https://gitlab.com/pulsar17) [@pulsar17 - GitHub](https://github.com/pulsar17)
- [pulsar17.me](https://pulsar17.me)

---------

# Discarded titles
- ~~Unicode and Python: A match made in heaven~~
- 🙂🤷 ~~Do you really understand text?~~
- ~~What I wish I knew about text~~

# Why am I giving this talk
- Unicode is *confusing*

# What the talk is about
🍕
🐼
🔡

```file
path: encoding_test.py
lang: python
relative: true
```

```file
path: encoding_test.py
lang: hexdump
transform: xxd
relative: true
```

--------

# What is text? really?
- abcdef
- こんにちは
- 🙂🐼🐍
- 🤸🕳

# Answer: It depends
- Text is subjective
- For us now, it's Unicode!
- Unicode = Text for modern software
- Formally, *Unicode is the universal character encoding*

# Answer: [Unicode](https://home.unicode.org/)

---------

# hexadecimal

Before we dive into Unicode, let's talk about hexadecimal. Isn't that a nice system to write your numbers in?
- Natural system - base 10

    ┌─────────────────────────┐
    │1       0       2       3│
    └─────────────────────────┘
     ↓       ↓       ↓       ↓       
    ┌─────────────────────────┐
    │1000    100     10      1│
    └─────────────────────────┘
     ↓       ↓       ↓       ↓       
   ┌────────────────────────────┐
   │10³     10²     10¹      10⁰│
   └────────────────────────────┘

---------

# hexadecimal (cont'd)

- Binary system - base 2

    ┌──────────┐ ┌──────┐
    │1111 1111₂│=│1023₁₀│
    └──────────┘ └──────┘

    ┌─────────────────────────────────────────────────────────────────────────┐
    │1       1       1       1       1       1       1       1       1       1│
    └─────────────────────────────────────────────────────────────────────────┘
     ↓       ↓       ↓       ↓       ↓       ↓       ↓       ↓       ↓       ↓
    ┌─────────────────────────────────────────────────────────────────────────┐
    │512     256     128     64      32      16      8       4       2       1│
    └─────────────────────────────────────────────────────────────────────────┘
     ↓       ↓       ↓       ↓       ↓       ↓       ↓       ↓       ↓       ↓
    ┌──────────────────────────────────────────────────────────────────────────┐
    │2⁹     2⁸       2⁷      2⁶      2⁵      2⁴      2³      2²      2¹      2⁰│
    └──────────────────────────────────────────────────────────────────────────┘

- Hexadecimal system - base 16

    ┌──────────┐   ┌────┐   ┌────┐
    │1111 1111₂│ = │FF₁₆│ = │0xFF│
    └──────────┘   └────┘   └────┘

---------

# hexadecimal (cont'd)

- Nice things to remember about hex
    - `0xF` = `(1111)₂`
    - `0xFF` = `(1111 1111)₂`
    - `0xFFF` = `(1111 1111 1111)₂`
    - See the pattern?
    - `0x10` ?
    - A mental picture to convert <number>₁₀ to <number>₁₆
        - `<number>₁₀` -> `<number>₂`
        - `<number>₂` -> `<number>₁₆`
            - group 4 bits of `<number>₂` -> 1 digit of `<number>₁₆`
    - Reverse also useful
        - `<number>₁₆` - each digit to 4 bits
- Example:
23₁₀ -> ?₁₆
```
23₁₀ -> (10111)₂
(10111)₂ -> (0001 0111)₂ -> 0x17
                ↓     ↓
                1     7
```

---------
  
# Unicode related terminology

## character
- Every character --> unique `codepoint`

- A [Unicode] *character* is an abstract concept
    - Unicode characters ≠ Real characters
    - Sometimes, a real character = Unicode char [ + Unicode char...]  

## codepoint
- A `codepoint` is an integer `∈ [0, 1,114,111]`
- In hex -> `[0x0, 0x10FFFF]`
- A codepoint is represented as `U+XXXXXX` where `XXXXXX` is <codepoint>₁₆
    - `U+0000` - `U+FFFF` : Original Unicode (late 80's - early 90's)
    - Wasn't enough
    - Now, the range is `U+0000` to `U+10FFFF` (has been since 1996)

---------

## codepoint (cont'd) 

|   Unicode Character   |   Codepoint   |
|----------------------:|---------------|
|       A               | `U+0041`      |
|       a               | `U+0061`      |
|       ヵ              | `U+30F5`      |
|       😀              | `U+1F600`     |
|       ♫               | `U+266B`      |

## plane

- Range of codepoints = `codespace`
- codespace is organized into `17` planes
- Each plane has `0xFFFF` codepoints
    - Plane 0 = `U+0000 .. U+FFFF`
    - Plane 1 = `U+1 0000 .. U+1 FFFF`
    - Plane 2 = `U+2 0000 .. U+2 FFFF`
    - ...
    - Plane 15 = `U+F 0000 .. U+F FFFF`
    - Plane 16 = `U+10 0000 .. U+10 FFFF`


---------
## plane (cont'd)

```
            
    U+0000      ◦--------◦
               /        / ------◦                       
              /   BMP  /        /                          
             /        /  SMP   /    ... 14 more planes    
    U+FFFF  ◦--------◦        /                            
                     ◦-------◦                            
                U+1FFFF                                     -------◦  
                                                                   /    
                                                          Private /     
                                                            Use  /      
                                                                /       
                                                         ------◦         
                                                    U+10FFFF 
```

- Most widely-used characters live on BMP

---------

# Now some Python

```terminal20
bash -c ipython3
```

---------
## `ascii`
- Good old ascii
- 7-bit encoding
    - If curious, it can encode `0x7F` characters

```terminal15
bash -c "man ascii"
```
---------

# Encodings

## encoding
- Character -> codepoint = just a mapping
    - Need to send the character over the network
    - Maybe save it as a file on storage
- Need to *translate* the character to bytes
- How to translate?

## A bit of history
- 16 bits for every character
    - `0xFFFF` codepoints was the limit
    - In 1996, a clever hack was introduced
    - Now `0x10FFFF` is the limit of codepoints
- Need 21 bits
    - Comments on efficiency?

---------

# The conversion

## code unit
- Character -> codepoint -> **code unit** **[+ code unit...]** -> byte [ + byte...]
- Convert codepoint into code unit(s)
    - Generally `8`, `16`, or `32` bits
    - `utf-8`, `utf-16`, and `utf-32`

For now we'll talk about the process until the code units

### `utf-32`
- Character -> codepoint -> one `32`-bit code unit
    - Not memory/storage efficient
    - But the programming model is easier, because of fixed width
- Simplest encoding

### `utf-16`
- Character -> codepoint -> one `16`-bit or two `16`-bit code units
    - For characters in BMP, one `16`-bit code unit
    - For characters in other planes, two `16`-bit code units

---------

### `utf-8`
- Character -> codepoint -> one-four `8`-bit code units
    - For characters in ASCII, one `8`-bit code unit
        - One-to-one compatible with ASCII
    - For other characters in BMP, upto three `8-bit` code units
- Most common encoding - default on Mac and Linux systems
- Efficient if only dealing with English and European languages
- Variable width
    - Not the most legible programming model

---------
# Now some more Python

```python
file = open("file.py", encoding="utf-16")
file.read()
```
```terminal20
bash -c ipython3
```

---------

# About the slides

## Slides created thanks to
- [lookatme](https://pypi.org/project/lookatme/)
- and ofcourse Python 🐍

## License
[CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)
