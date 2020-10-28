#!/usr/bin/env python
import unicodedata
import os
from fontTools.ttLib import TTFont


fonts = []


for root,dirs,files in os.walk("/usr/share/fonts/"):
    for file in files:
       if file.endswith(".ttf"): fonts.append(os.path.join(root,file))


def char_in_font(unicode_char, font):
    for cmap in font['cmap'].tables:
        if cmap.isUnicode():
            if ord(unicode_char) in cmap.cmap:
                return True
    return False


def find(char):
    for fontpath in fonts:
        font = TTFont(fontpath)   # specify the path to the font in question
        if char_in_font(char, font):
            for fontname in font['name'].names:
                print(fontname.string)
            print(char + " in file " + fontpath)


find(u"󰤯")
