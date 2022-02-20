# Following should really be possible to do by gir2swift
s/referenceTableFunc: /referenceTableFunc: @escaping /
s/destroy: /destroy: @escaping /
s/`func`: /`func`: @escaping /

# futile attempts to solve `hb_language_t` and `FT_Face` issues
# s/-> hb_language_t /-> hb_language_t! /
# s/-> FT_Face /-> FT_Face! /
# s/language: hb_language_t /language: hb_language_t! /