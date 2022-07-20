# unicodify.py - a simple script to demonstrate Python's support for unicode
# Copyright (C) 2022  Ishaan Arora <ishaanarora1000@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.


from pprint import pprint
import unicodedata

# Various ways to add Unicode strings
characters = "A", "\x61", "\N{KATAKANA LETTER SMALL KA}", "\U0001F600", "\u266B", "\u0941"


def codepointify(codepoint: int):
    """
    Format a codepoint according to the Unicode standard
    >>> codepointify(61)
    'U+003D'
    >>> codepointify(0x266B)
    'U+266B'
    >>> codepointify(0x1F600)
    'U+1F600'
    """
    hex_codepoint = hex(codepoint)[2:].upper()
    # For codepoints less than U+FFFF, pad it with 0s
    padded_hex_codepoint = hex_codepoint.rjust(4, "0")
    return f"U+{padded_hex_codepoint}"


unicode_characters = [
    (char, unicodedata.name(char))
    for char in characters
]

if __name__ == "__main__":
    pprint(unicode_characters)
    import doctest
    doctest.testmod()
