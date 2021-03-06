---
title: Having fun with text in Python or πβ€π 
author: Ishaan Arora
date: 2022-07-23
extensions: [terminal, file_loader]
styles:
    style: monokai
---

# `$ whoami`
- QA Intern at Aakash BYJU's
- β₯ - π π§ π¨
- [@pulsar17 - GitLab](https://gitlab.com/pulsar17) [@pulsar17 - GitHub](https://github.com/pulsar17)
- [pulsar17.me](https://pulsar17.me)

---------

# Discarded titles
- ~~Unicode and Python: A match made in heaven~~
- ππ€· ~~Do you really understand text?~~
- ~~What I wish I knew about text~~

# Why am I giving this talk
- Unicode ~~is~~ can be *confusing*

# What the talk is about
π
πΌ
π‘

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

# What is text really?
- abcdef
- γγγ«γ‘γ―
- ππΌπ
- π€Έπ³

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

    βββββββββββββββββββββββββββ
    β1       0       2       3β
    βββββββββββββββββββββββββββ
     β       β       β       β       
    βββββββββββββββββββββββββββ
    β1000    100     10      1β
    βββββββββββββββββββββββββββ
     β       β       β       β       
   ββββββββββββββββββββββββββββββ
   β10Β³     10Β²     10ΒΉ      10β°β
   ββββββββββββββββββββββββββββββ

---------

# hexadecimal (cont'd)

- Binary system - base 2

    ββββββββββββββ ββββββββ
    β(1111 1111)ββ=β1023βββ
    ββββββββββββββ ββββββββ

    βββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ
    β1       1       1       1       1       1       1       1       1       1β
    βββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ
     β       β       β       β       β       β       β       β       β       β
    βββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ
    β512     256     128     64      32      16      8       4       2       1β
    βββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ
     β       β       β       β       β       β       β       β       β       β
    ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ
    β2βΉ     2βΈ       2β·      2βΆ      2β΅      2β΄      2Β³      2Β²      2ΒΉ      2β°β
    ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ

- Hexadecimal system - base 16

    ββββββββββββββ   ββββββ   ββββββ
    β(1111 1111)ββ = βFFβββ = β0xFFβ
    ββββββββββββββ   ββββββ   ββββββ

---------

# hexadecimal (cont'd)

- Nice things to remember about hex
    - `0xF` = `(1111)β`
    - `0xFF` = `(1111 1111)β`
    - `0xFFF` = `(1111 1111 1111)β`
    - See the pattern?
    - `0x10` ?
    - A mental picture to convert <number>ββ to <number>ββ
        - `<number>ββ` -> `<number>β`
        - `<number>β` -> `<number>ββ`
            - group 4 bits of `<number>β` -> 1 digit of `<number>ββ`
    - Reverse also useful
        - `<number>ββ` - each digit to 4 bits
- Example:
23ββ -> ?ββ
```
23ββ -> (10111)β
(10111)β -> (0001 0111)β -> 0x17
                β     β
                1     7
```

---------
  
# Unicode related terminology

## character
- Every character --> unique `codepoint` and unique `name`

- A [Unicode] *character* is an abstract concept
    - Unicode characters β  Real characters
    - Sometimes, a real character = Unicode char [ + Unicode char...]  

## codepoint
- A `codepoint` is an integer `β [0, 1,114,111]`
- In hex -> `[0x0, 0x10FFFF]`
- A codepoint is represented as `U+XXXXXX` where `XXXXXX` is <codepoint>ββ
    - `U+0000` - `U+FFFF` : Original Unicode (late 80's - early 90's)
    - Wasn't enough
    - Now, the range is `U+0000` to `U+10FFFF` (has been since 1996)

---------

## codepoint (cont'd) 

|   Unicode Character   |   Codepoint   |
|----------------------:|---------------|
|       A               | `U+0041`      |
|       a               | `U+0061`      |
|       γ΅              | `U+30F5`      |
|       π              | `U+1F600`     |
|       β«               | `U+266B`      |
|       ΰ₯               | `U+0941`      |

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
            
    U+0000      β¦--------β¦
               /        / ------β¦                       
              /   BMP  /        /                          
             /        /  SMP   /    ... 14 more planes    
    U+FFFF  β¦--------β¦        /                            
                     β¦-------β¦                            
                U+1FFFF                                     -------β¦  
                                                                   /    
                                                          Private /     
                                                            Use  /      
                                                                /       
                                                         ------β¦         
                                                    U+10FFFF 
```

- Most widely-used characters live on BMP

---------

# Now some Python

π`unicodify.py`

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

# Yet some more Python

π`encodings.py`

---------
# Now some more Python

- Strings in Python are *Unicode strings*
    - Unicode string = sequence of codepoints\*
- So, strings in Python = sequence of *codepoints*
- Iterate on a string
   - ΰ€ΰ₯ΰ€―ΰ€Ύ  
```
        ΰ€   U+0915
        ΰ₯   U+094D
        ΰ€―   U+092F
        ΰ€Ύ   U+093E
```

---------

# About the slides

## Slides created thanks to
- [lookatme](https://pypi.org/project/lookatme/)
- and ofcourse Python π

## License
[CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)
