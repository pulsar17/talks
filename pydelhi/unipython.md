---
title: Having fun with text in Python or 🐍❤🔠
author: Ishaan Arora
date: 2022-07-23
extensions: [terminal, file_loader]
styles:
    style: monokai
---

# `$ whoami`
---------
## What the talk is about
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
---------

# 🙂 (Question: Do you think it's text?)
- yes/no
- not sure
- If you consider **abc** text, then why not 🙂🐼🐍
- If no, you're in for a 🤸🕳

# Answer: [Unicode](https://home.unicode.org/)
---------

  
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
              /   BMP  /        /                           -------◦  
             /        /  SMP   /    ... 14 more planes             / 
    U+FFFF  ◦--------◦        /                           Private /   
                     ◦-------◦                              Use  /   
                U+1FFFF                                         /
                                                        -------◦     
                                                    U+10FFFF 
```

- Most characters live on BMP


---------

- Standardize that across the industry, so that an Android user can send an iPhone user an 🍏 and it doesn't turn into 🍭
    - Not only emojis but written text: <japanese characters>
- Standardize how text can be combined, represented, [sorted?] to express language.

---------

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
   │10^3    10^2    10^1    10^0│
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
    │2^9    2^8     2^7     2^6     2^5     2^4     2^3     2^2     2^1     2^0│
    └──────────────────────────────────────────────────────────────────────────┘

- Hexadecimal system - base 16

    ┌──────────┐   ┌────┐   ┌────┐
    │1111 1111₂│ = │FF₁₆│ = │0xFF│
    └──────────┘   └────┘   └────┘

---------

# About the slides
## License
[CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)


