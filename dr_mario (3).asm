################# CSC258 Assembly Final Project ###################
# This file contains our implementation of Dr Mario.
#
# Student 1: Yuxuan Liu, 1009869475
# Student 2: Yi Pan, Student Number (if applicable)
#
# We assert that the code submitted here is entirely our own 
# creation, and will indicate otherwise when it is not.
#
######################## Bitmap Display Configuration ########################
# - Unit width in pixels:       2
# - Unit height in pixels:      2
# - Display width in pixels:    80
# - Display height in pixels:   80
# - Base Address for Display:   0x10008000 ($gp)
##############################################################################

.data
##############################################################################
# Immutable Data
##############################################################################
# The address of the bitmap display. Don't forget to connect it!
ADDR_DSPL:
  .word 0x10008000
# The address of the keyboard. Don't forget to connect it!
ADDR_KBRD:
  .word 0xffff0000
Virus_check_BitMap: 
  .space 6400
game_over:
.word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000
.word 0x000000 .word 0x040404 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x060606 .word 0x040404 .word 0x000000
.word 0x000000 .word 0x7D7D7D .word 0xBABABA .word 0xB4B4B4 .word 0xB4B4B4 .word 0xB5B5B5 .word 0xB5B5B5 .word 0xB5B5B5 .word 0xB5B5B5 .word 0xB5B5B5 .word 0xB5B5B5 .word 0xB4B4B4 .word 0xB4B4B4 .word 0xB5B5B5 .word 0xB5B5B5 .word 0xB5B5B5 .word 0xB5B5B5 .word 0xB5B5B5 .word 0xB4B4B4 .word 0xB4B4B4 .word 0xB4B4B4 .word 0xB5B5B5 .word 0xB5B5B5 .word 0xB4B4B4 .word 0xB4B4B4 .word 0xB4B4B4 .word 0xB4B4B4 .word 0xB5B5B5 .word 0xB5B5B5 .word 0xB4B4B4 .word 0xB4B4B4 .word 0xB5B5B5 .word 0xB5B5B5 .word 0xB5B5B5 .word 0xB5B5B5 .word 0xB5B5B5 .word 0xB5B5B5 .word 0xBABABA .word 0x7D7D7D .word 0x000000
.word 0x000000 .word 0x959595 .word 0xDEDEDE .word 0xD7D7D7 .word 0xD8D8D8 .word 0xD9D9D9 .word 0xD9D9D9 .word 0xD9D9D9 .word 0xD9D9D9 .word 0xD9D9D9 .word 0xD9D9D9 .word 0xD7D7D7 .word 0xD7D7D7 .word 0xD9D9D9 .word 0xD9D9D9 .word 0xD9D9D9 .word 0xD9D9D9 .word 0xD9D9D9 .word 0xD8D8D8 .word 0xD7D7D7 .word 0xD8D8D8 .word 0xD9D9D9 .word 0xD9D9D9 .word 0xD8D8D8 .word 0xD7D7D7 .word 0xD7D7D7 .word 0xD7D7D7 .word 0xD9D9D9 .word 0xD9D9D9 .word 0xD8D8D8 .word 0xD8D8D8 .word 0xD9D9D9 .word 0xD9D9D9 .word 0xD9D9D9 .word 0xD9D9D9 .word 0xD9D9D9 .word 0xD8D8D8 .word 0xDEDEDE .word 0x959595 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xDADADA .word 0xDADADA .word 0x848484 .word 0x303030 .word 0x303030 .word 0x303030 .word 0x303030 .word 0x303030 .word 0x404040 .word 0xCCCCCC .word 0xBEBEBE .word 0x353535 .word 0x303030 .word 0x303030 .word 0x303030 .word 0x303030 .word 0x616161 .word 0xDDDDDD .word 0x999999 .word 0x303030 .word 0x303030 .word 0xACACAC .word 0xD8D8D8 .word 0xD5D5D5 .word 0xCECECE .word 0x474747 .word 0x303030 .word 0x6A6A6A .word 0x6A6A6A .word 0x303030 .word 0x303030 .word 0x303030 .word 0x303030 .word 0x303030 .word 0x575757 .word 0xDBDBDB .word 0x939393 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xDADADA .word 0xE1E1E1 .word 0x6D6D6D .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x141414 .word 0xDEDEDE .word 0xBBBBBB .word 0x020202 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x3D3D3D .word 0xE6E6E6 .word 0x868686 .word 0x000000 .word 0x000000 .word 0xA3A3A3 .word 0xDCDCDC .word 0xD6D6D6 .word 0xD2D2D2 .word 0x1A1A1A .word 0x000000 .word 0x535353 .word 0x535353 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x323232 .word 0xEAEAEA .word 0x929292 .word 0x000000
.word 0x000000 .word 0x939393 .word 0xDBDBDB .word 0x696969 .word 0x232323 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x191919 .word 0xA8A8A8 .word 0x3A3A3A .word 0x020202 .word 0x888888 .word 0xAFAFAF .word 0xAFAFAF .word 0x494949 .word 0x141414 .word 0x595959 .word 0x7C7C7C .word 0x000000 .word 0x000000 .word 0x333333 .word 0x8F8F8F .word 0xBBBBBB .word 0x414141 .word 0x0A0A0A .word 0x000000 .word 0x5C5C5C .word 0x5C5C5C .word 0x000000 .word 0x7F7F7F .word 0xAFAFAF .word 0xAFAFAF .word 0xAFAFAF .word 0xC4C4C4 .word 0xEFEFEF .word 0x919191 .word 0x000000
.word 0x000000 .word 0x939393 .word 0xDCDCDC .word 0x2D2D2D .word 0x000000 .word 0x232323 .word 0xA2A2A2 .word 0xA2A2A2 .word 0xA2A2A2 .word 0xA2A2A2 .word 0xAFAFAF .word 0x949494 .word 0x000000 .word 0x000000 .word 0xD2D2D2 .word 0xF9F9F9 .word 0xFAFAFA .word 0x676767 .word 0x000000 .word 0x151515 .word 0x868686 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x6D6D6D .word 0xB5B5B5 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x5B5B5B .word 0x5B5B5B .word 0x000000 .word 0xC4C4C4 .word 0xFBFBFB .word 0xF3F3F3 .word 0xECECEC .word 0xEAEAEA .word 0xE1E1E1 .word 0x929292 .word 0x000000
.word 0x000000 .word 0x939393 .word 0xDCDCDC .word 0x333333 .word 0x000000 .word 0x3A3A3A .word 0xFCFCFC .word 0xF6F6F6 .word 0xF8F8F8 .word 0xF8F8F8 .word 0xFAFAFA .word 0x8E8E8E .word 0x000000 .word 0x000000 .word 0x515151 .word 0x5A5A5A .word 0x5B5B5B .word 0x252525 .word 0x000000 .word 0x1E1E1E .word 0x909090 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x2D2D2D .word 0x4A4A4A .word 0x000000 .word 0x000000 .word 0x000000 .word 0x5B5B5B .word 0x5B5B5B .word 0x000000 .word 0x4C4C4C .word 0x5B5B5B .word 0x6E6E6E .word 0xCFCFCF .word 0xD2D2D2 .word 0xD9D9D9 .word 0x929292 .word 0x000000
.word 0x000000 .word 0x939393 .word 0xDCDCDC .word 0x333333 .word 0x000000 .word 0x393939 .word 0xE3E3E3 .word 0x717171 .word 0x626262 .word 0x626262 .word 0x767676 .word 0x797979 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x1E1E1E .word 0x8F8F8F .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x5B5B5B .word 0x5B5B5B .word 0x000000 .word 0x000000 .word 0x000000 .word 0x1E1E1E .word 0xDCDCDC .word 0xD3D3D3 .word 0xDADADA .word 0x929292 .word 0x000000
.word 0x000000 .word 0x939393 .word 0xDCDCDC .word 0x333333 .word 0x000000 .word 0x3A3A3A .word 0xE0E0E0 .word 0x0E0E0E .word 0x000000 .word 0x000000 .word 0x151515 .word 0x727272 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x1E1E1E .word 0x8F8F8F .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x5B5B5B .word 0x5B5B5B .word 0x000000 .word 0x595959 .word 0x7A7A7A .word 0x959595 .word 0xE9E9E9 .word 0xD1D1D1 .word 0xDADADA .word 0x929292 .word 0x000000
.word 0x000000 .word 0x939393 .word 0xDCDCDC .word 0x333333 .word 0x000000 .word 0x393939 .word 0xE4E4E4 .word 0x6D6D6D .word 0x232323 .word 0x000000 .word 0x202020 .word 0x7E7E7E .word 0x000000 .word 0x000000 .word 0x555555 .word 0x6D6D6D .word 0x6D6D6D .word 0x2E2E2E .word 0x000000 .word 0x1E1E1E .word 0x8F8F8F .word 0x000000 .word 0x000000 .word 0x565656 .word 0x383838 .word 0x131313 .word 0x696969 .word 0x101010 .word 0x000000 .word 0x5B5B5B .word 0x5B5B5B .word 0x000000 .word 0xC0C0C0 .word 0xFBFBFB .word 0xF5F5F5 .word 0xDFDFDF .word 0xD2D2D2 .word 0xDADADA .word 0x929292 .word 0x000000
.word 0x000000 .word 0x939393 .word 0xDCDCDC .word 0x2D2D2D .word 0x000000 .word 0x3A3A3A .word 0xF0F0F0 .word 0xE9E9E9 .word 0x585858 .word 0x000000 .word 0x232323 .word 0x8D8D8D .word 0x000000 .word 0x000000 .word 0xCDCDCD .word 0xFCFCFC .word 0xFCFCFC .word 0x696969 .word 0x000000 .word 0x1E1E1E .word 0x8F8F8F .word 0x000000 .word 0x000000 .word 0xD1D1D1 .word 0x7D7D7D .word 0x2A2A2A .word 0xF9F9F9 .word 0x242424 .word 0x000000 .word 0x5B5B5B .word 0x5B5B5B .word 0x000000 .word 0xBABABA .word 0xE2E2E2 .word 0xD9D9D9 .word 0xDADADA .word 0xD9D9D9 .word 0xDADADA .word 0x929292 .word 0x000000
.word 0x000000 .word 0x939393 .word 0xDBDBDB .word 0x6C6C6C .word 0x2B2B2B .word 0x262626 .word 0x9E9E9E .word 0x949494 .word 0x383838 .word 0x000000 .word 0x232323 .word 0x8C8C8C .word 0x000000 .word 0x000000 .word 0xC0C0C0 .word 0xD9D9D9 .word 0xDADADA .word 0x585858 .word 0x000000 .word 0x1E1E1E .word 0x8F8F8F .word 0x000000 .word 0x000000 .word 0xC0C0C0 .word 0x909090 .word 0x737373 .word 0xE1E1E1 .word 0x1C1C1C .word 0x000000 .word 0x5B5B5B .word 0x5B5B5B .word 0x000000 .word 0x7A7A7A .word 0x969696 .word 0x8F8F8F .word 0x8F8F8F .word 0x9F9F9F .word 0xDADADA .word 0x929292 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xD9D9D9 .word 0xE8E8E8 .word 0x7D7D7D .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x1D1D1D .word 0x898989 .word 0x000000 .word 0x000000 .word 0xBEBEBE .word 0xDADADA .word 0xDBDBDB .word 0x565656 .word 0x000000 .word 0x181818 .word 0x8C8C8C .word 0x000000 .word 0x000000 .word 0xB8B8B8 .word 0xDFDFDF .word 0xF6F6F6 .word 0xDBDBDB .word 0x181818 .word 0x000000 .word 0x565656 .word 0x575757 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x2C2C2C .word 0xE1E1E1 .word 0x929292 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xDADADA .word 0xD9D9D9 .word 0x898989 .word 0x3B3B3B .word 0x3B3B3B .word 0x3B3B3B .word 0x3B3B3B .word 0x3B3B3B .word 0x565656 .word 0xA3A3A3 .word 0x383838 .word 0x3B3B3B .word 0xCDCDCD .word 0xD8D8D8 .word 0xD9D9D9 .word 0x757575 .word 0x3A3A3A .word 0x525252 .word 0xA6A6A6 .word 0x313131 .word 0x3B3B3B .word 0xC9C9C9 .word 0xDADADA .word 0xD3D3D3 .word 0xCDCDCD .word 0x474747 .word 0x373737 .word 0x818181 .word 0x7A7A7A .word 0x343434 .word 0x3B3B3B .word 0x3B3B3B .word 0x3B3B3B .word 0x3B3B3B .word 0x6C6C6C .word 0xEFEFEF .word 0x919191 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xDADADA .word 0xD1D1D1 .word 0xE5E5E5 .word 0xF9F9F9 .word 0xF9F9F9 .word 0xF9F9F9 .word 0xF9F9F9 .word 0xF9F9F9 .word 0xF9F9F9 .word 0xE9E9E9 .word 0xEEEEEE .word 0xF9F9F9 .word 0xF1F1F1 .word 0xD3D3D3 .word 0xD2D2D2 .word 0xD6D6D6 .word 0xF5F5F5 .word 0xF9F9F9 .word 0xEBEBEB .word 0xD8D8D8 .word 0xF8F8F8 .word 0xF2F2F2 .word 0xD4D4D4 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xEBEBEB .word 0xF8F8F8 .word 0xDFDFDF .word 0xE2E2E2 .word 0xF9F9F9 .word 0xF9F9F9 .word 0xF9F9F9 .word 0xF9F9F9 .word 0xF8F8F8 .word 0xE9E9E9 .word 0x919191 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xDADADA .word 0xD3D3D3 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xDADADA .word 0x929292 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xDADADA .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xDADADA .word 0x929292 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xDADADA .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xDADADA .word 0x929292 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xDADADA .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xDADADA .word 0x929292 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xDADADA .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xDADADA .word 0x929292 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xDADADA .word 0xD3D3D3 .word 0xD4D4D4 .word 0xD2D2D2 .word 0xD1D1D1 .word 0xD1D1D1 .word 0xD1D1D1 .word 0xD2D2D2 .word 0xD4D4D4 .word 0xD3D3D3 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD3D3D3 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD3D3D3 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xDADADA .word 0x929292 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xDADADA .word 0xD4D4D4 .word 0xD3D3D3 .word 0x484848 .word 0x272727 .word 0x272727 .word 0x272727 .word 0x606060 .word 0xD9D9D9 .word 0xD4D4D4 .word 0xD5D5D5 .word 0xD5D5D5 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD5D5D5 .word 0xD5D5D5 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD5D5D5 .word 0xD5D5D5 .word 0xD5D5D5 .word 0xD5D5D5 .word 0xD5D5D5 .word 0xD4D4D4 .word 0xD4D4D4 .word 0xD5D5D5 .word 0xD5D5D5 .word 0xD5D5D5 .word 0xD5D5D5 .word 0xD5D5D5 .word 0xD5D5D5 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xDADADA .word 0x929292 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xDEDEDE .word 0xB8B8B8 .word 0x333333 .word 0x050505 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x0C0C0C .word 0x484848 .word 0x8A8A8A .word 0x303030 .word 0x303030 .word 0xB0B0B0 .word 0xDCDCDC .word 0xACACAC .word 0x303030 .word 0x303030 .word 0x8C8C8C .word 0x434343 .word 0x303030 .word 0x303030 .word 0x303030 .word 0x303030 .word 0x303030 .word 0x848484 .word 0x4E4E4E .word 0x303030 .word 0x303030 .word 0x303030 .word 0x303030 .word 0x303030 .word 0x303030 .word 0xB0B0B0 .word 0xD8D8D8 .word 0xD3D3D3 .word 0xDADADA .word 0x929292 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xDFDFDF .word 0xAFAFAF .word 0x000000 .word 0x000000 .word 0x666666 .word 0xBABABA .word 0x494949 .word 0x000000 .word 0x181818 .word 0x717171 .word 0x000000 .word 0x000000 .word 0xA5A5A5 .word 0xDFDFDF .word 0x9F9F9F .word 0x000000 .word 0x000000 .word 0x747474 .word 0x141414 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x777777 .word 0x282828 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0xBDBDBD .word 0xDDDDDD .word 0xD3D3D3 .word 0xDADADA .word 0x929292 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xDFDFDF .word 0xB0B0B0 .word 0x040404 .word 0x000000 .word 0x8F8F8F .word 0xFAFAFA .word 0x5A5A5A .word 0x000000 .word 0x1D1D1D .word 0x747474 .word 0x000000 .word 0x000000 .word 0xA6A6A6 .word 0xDFDFDF .word 0xA0A0A0 .word 0x000000 .word 0x000000 .word 0x777777 .word 0x161616 .word 0x131313 .word 0xA6A6A6 .word 0xAFAFAF .word 0xAFAFAF .word 0xAFAFAF .word 0xD4D4D4 .word 0x282828 .word 0x000000 .word 0x2F2F2F .word 0x949494 .word 0x929292 .word 0x7B7B7B .word 0x050505 .word 0x3E3E3E .word 0x8F8F8F .word 0xD9D9D9 .word 0xDADADA .word 0x929292 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xDFDFDF .word 0xB0B0B0 .word 0x040404 .word 0x000000 .word 0x8A8A8A .word 0xEBEBEB .word 0x505050 .word 0x000000 .word 0x1D1D1D .word 0x747474 .word 0x000000 .word 0x000000 .word 0xA6A6A6 .word 0xDFDFDF .word 0xA0A0A0 .word 0x000000 .word 0x000000 .word 0x777777 .word 0x141414 .word 0x1F1F1F .word 0xF9F9F9 .word 0xF5F5F5 .word 0xF1F1F1 .word 0xEDEDED .word 0xE0E0E0 .word 0x202020 .word 0x000000 .word 0x4A4A4A .word 0xE9E9E9 .word 0xE7E7E7 .word 0xC3C3C3 .word 0x080808 .word 0x000000 .word 0x727272 .word 0xE2E2E2 .word 0xD9D9D9 .word 0x929292 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xDFDFDF .word 0xB0B0B0 .word 0x040404 .word 0x000000 .word 0x8A8A8A .word 0xECECEC .word 0x515151 .word 0x000000 .word 0x1D1D1D .word 0x747474 .word 0x000000 .word 0x000000 .word 0xA6A6A6 .word 0xDFDFDF .word 0xA0A0A0 .word 0x000000 .word 0x000000 .word 0x777777 .word 0x171717 .word 0x0D0D0D .word 0x5E5E5E .word 0x585858 .word 0x919191 .word 0xD8D8D8 .word 0xCACACA .word 0x1E1E1E .word 0x000000 .word 0x1D1D1D .word 0x5B5B5B .word 0x5B5B5B .word 0x4C4C4C .word 0x030303 .word 0x757575 .word 0xCDCDCD .word 0xDFDFDF .word 0xD9D9D9 .word 0x929292 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xDFDFDF .word 0xB0B0B0 .word 0x040404 .word 0x000000 .word 0x8A8A8A .word 0xECECEC .word 0x515151 .word 0x000000 .word 0x1D1D1D .word 0x747474 .word 0x000000 .word 0x000000 .word 0xA6A6A6 .word 0xDFDFDF .word 0xA0A0A0 .word 0x000000 .word 0x000000 .word 0x777777 .word 0x191919 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x676767 .word 0xE4E4E4 .word 0xCBCBCB .word 0x1E1E1E .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0xCCCCCC .word 0xF1F1F1 .word 0xD6D6D6 .word 0xDADADA .word 0x929292 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xDFDFDF .word 0xB0B0B0 .word 0x040404 .word 0x000000 .word 0x8A8A8A .word 0xECECEC .word 0x515151 .word 0x000000 .word 0x1D1D1D .word 0x747474 .word 0x000000 .word 0x000000 .word 0xADADAD .word 0xE8E8E8 .word 0xA6A6A6 .word 0x000000 .word 0x000000 .word 0x777777 .word 0x171717 .word 0x0D0D0D .word 0x747474 .word 0x7B7B7B .word 0xBCBCBC .word 0xE4E4E4 .word 0xCBCBCB .word 0x1E1E1E .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0xC0C0C0 .word 0xD8D8D8 .word 0xD3D3D3 .word 0xDADADA .word 0x929292 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xDFDFDF .word 0xB0B0B0 .word 0x040404 .word 0x000000 .word 0x8A8A8A .word 0xECECEC .word 0x515151 .word 0x000000 .word 0x1D1D1D .word 0x717171 .word 0x000000 .word 0x000000 .word 0x606060 .word 0x818181 .word 0x5D5D5D .word 0x000000 .word 0x000000 .word 0x747474 .word 0x141414 .word 0x1E1E1E .word 0xF6F6F6 .word 0xF7F7F7 .word 0xF2F2F2 .word 0xD9D9D9 .word 0xCBCBCB .word 0x1E1E1E .word 0x000000 .word 0x232323 .word 0x6C6C6C .word 0x434343 .word 0x000000 .word 0x000000 .word 0xC0C0C0 .word 0xDADADA .word 0xD3D3D3 .word 0xDADADA .word 0x929292 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xDFDFDF .word 0xB0B0B0 .word 0x040404 .word 0x000000 .word 0x8F8F8F .word 0xF4F4F4 .word 0x545454 .word 0x000000 .word 0x1A1A1A .word 0x949494 .word 0x4E4E4E .word 0x040404 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x040404 .word 0x464646 .word 0x949494 .word 0x111111 .word 0x1C1C1C .word 0xDEDEDE .word 0xDADADA .word 0xD9D9D9 .word 0xDCDCDC .word 0xCFCFCF .word 0x1E1E1E .word 0x000000 .word 0x575757 .word 0xFFFFFF .word 0x959595 .word 0x000000 .word 0x000000 .word 0xC7C7C7 .word 0xDEDEDE .word 0xD3D3D3 .word 0xDADADA .word 0x929292 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xDFDFDF .word 0xAFAFAF .word 0x000000 .word 0x000000 .word 0x5E5E5E .word 0xA0A0A0 .word 0x373737 .word 0x000000 .word 0x0E0E0E .word 0xCDCDCD .word 0xD0D0D0 .word 0x030303 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x040404 .word 0xC3C3C3 .word 0xC9C9C9 .word 0x0E0E0E .word 0x0F0F0F .word 0x888888 .word 0x919191 .word 0x8F8F8F .word 0x919191 .word 0xAEAEAE .word 0x212121 .word 0x000000 .word 0x555555 .word 0xEEEEEE .word 0x9B9B9B .word 0x434343 .word 0x030303 .word 0x838383 .word 0xB6B6B6 .word 0xD6D6D6 .word 0xDADADA .word 0x929292 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xDEDEDE .word 0xB9B9B9 .word 0x424242 .word 0x090909 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x0F0F0F .word 0x4B4B4B .word 0xCCCCCC .word 0xBFBFBF .word 0x404040 .word 0x363636 .word 0x000000 .word 0x090909 .word 0x414141 .word 0xC4C4C4 .word 0xC4C4C4 .word 0x0C0C0C .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x676767 .word 0x232323 .word 0x000000 .word 0x505050 .word 0xE9E9E9 .word 0xD9D9D9 .word 0xCDCDCD .word 0x030303 .word 0x000000 .word 0x6C6C6C .word 0xDFDFDF .word 0xDADADA .word 0x929292 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xDADADA .word 0xD3D3D3 .word 0xE6E6E6 .word 0x585858 .word 0x303030 .word 0x303030 .word 0x303030 .word 0x676767 .word 0xDCDCDC .word 0xD3D3D3 .word 0xD4D4D4 .word 0xDCDCDC .word 0xCDCDCD .word 0x303030 .word 0x585858 .word 0xD9D9D9 .word 0xD6D6D6 .word 0xC6C6C6 .word 0x3D3D3D .word 0x303030 .word 0x303030 .word 0x303030 .word 0x303030 .word 0x303030 .word 0x848484 .word 0x4E4E4E .word 0x373737 .word 0x7D7D7D .word 0xE8E8E8 .word 0xD5D5D5 .word 0xBBBBBB .word 0x3A3A3A .word 0x3B3B3B .word 0xA0A0A0 .word 0xE3E3E3 .word 0xD9D9D9 .word 0x929292 .word 0x000000
.word 0x000000 .word 0x929292 .word 0xDADADA .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD4D4D4 .word 0xD5D5D5 .word 0xD5D5D5 .word 0xD5D5D5 .word 0xD4D4D4 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD5D5D5 .word 0xD4D4D4 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD3D3D3 .word 0xD5D5D5 .word 0xD5D5D5 .word 0xD5D5D5 .word 0xD5D5D5 .word 0xD5D5D5 .word 0xD5D5D5 .word 0xD4D4D4 .word 0xD3D3D3 .word 0xEBEBEB .word 0xF8F8F8 .word 0xDEDEDE .word 0xD1D1D1 .word 0xD2D2D2 .word 0xE5E5E5 .word 0xF9F9F9 .word 0xF7F7F7 .word 0xD9D9D9 .word 0xD9D9D9 .word 0x929292 .word 0x000000
.word 0x000000 .word 0x949494 .word 0xDEDEDE .word 0xD6D6D6 .word 0xD6D6D6 .word 0xD7D7D7 .word 0xD7D7D7 .word 0xD7D7D7 .word 0xD7D7D7 .word 0xD7D7D7 .word 0xD6D6D6 .word 0xD6D6D6 .word 0xD6D6D6 .word 0xD6D6D6 .word 0xD7D7D7 .word 0xD7D7D7 .word 0xD7D7D7 .word 0xD6D6D6 .word 0xD6D6D6 .word 0xD7D7D7 .word 0xD7D7D7 .word 0xD7D7D7 .word 0xD7D7D7 .word 0xD7D7D7 .word 0xD7D7D7 .word 0xD7D7D7 .word 0xD7D7D7 .word 0xD7D7D7 .word 0xD7D7D7 .word 0xD7D7D7 .word 0xD7D7D7 .word 0xD6D6D6 .word 0xD7D7D7 .word 0xD7D7D7 .word 0xD8D8D8 .word 0xD7D7D7 .word 0xD6D6D6 .word 0xDEDEDE .word 0x949494 .word 0x000000
.word 0x000000 .word 0x808080 .word 0xBFBFBF .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xB9B9B9 .word 0xBFBFBF .word 0x808080 .word 0x000000
.word 0x000000 .word 0x080808 .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x0C0C0C .word 0x080808 .word 0x000000

frame_counter: .word 0
gravity_interval:  .word 30     # 下落间隔
interval_counter: .word 0

dr_mario:
.word 0x05055C .word 0x1E1EC0 .word 0x191BC1 .word 0x420B3F .word 0xC3211F .word 0xBF1616 .word 0x470000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000
.word 0x0505A6 .word 0x0909FF .word 0x0505FF .word 0x500046 .word 0xF80101 .word 0xFF0203 .word 0x810000 .word 0x000000 .word 0x000000 .word 0x000000 .word 0x000000
.word 0x000024 .word 0x121274 .word 0x020265 .word 0x4E4863 .word 0x967475 .word 0x811F1A .word 0x421403 .word 0x150C04 .word 0x000102 .word 0x000000 .word 0x000000
.word 0x000000 .word 0x78786E .word 0x67675D .word 0x686961 .word 0x888C83 .word 0x675C45 .word 0x815F3D .word 0x8C663F .word 0x4D351D .word 0x000000 .word 0x000000
.word 0x000000 .word 0x8F8F8F .word 0xA6A6A7 .word 0x665D56 .word 0x997F66 .word 0xBDB4AB .word 0xC2B8A7 .word 0x8C5721 .word 0x976737 .word 0x4F4338 .word 0x000000
.word 0x000000 .word 0x979899 .word 0xA99D90 .word 0xE7CCAC .word 0xECCDAD .word 0xBBA894 .word 0xDEC3A5 .word 0xCFA678 .word 0xCAA885 .word 0xB79C81 .word 0x000000
.word 0x000000 .word 0x353535 .word 0x9B9895 .word 0x766351 .word 0x6E5740 .word 0x543E29 .word 0xB19879 .word 0xDEC2A2 .word 0x7B542C .word 0x442A10 .word 0x000000
.word 0x000000 .word 0x010000 .word 0x656566 .word 0x93918E .word 0x665B50 .word 0x817769 .word 0xB1A89C .word 0x554F49 .word 0x9B9A9A .word 0x4D4D4E .word 0x000000
.word 0x000000 .word 0x000000 .word 0x363737 .word 0xA8A8A7 .word 0x2A231F .word 0x888A8B .word 0x5C5855 .word 0x38332D .word 0xDBDCDC .word 0xEBEBEB .word 0x292929
.word 0x000000 .word 0x000000 .word 0x888888 .word 0xEDEEEE .word 0x3A332C .word 0x4E4945 .word 0x2D261F .word 0xA3A3A3 .word 0x929292 .word 0xCFCFCF .word 0x737373
.word 0x000000 .word 0x000000 .word 0x2F2F2F .word 0xC4C4C4 .word 0x828382 .word 0x666B69 .word 0xA9AAA9 .word 0xBCBBBB .word 0x7C7C7C .word 0xA4A4A4 .word 0x595959
.word 0x000000 .word 0x000000 .word 0x000002 .word 0x8A8C8E .word 0x8D8E8E .word 0x969798 .word 0xA2A3A3 .word 0xC8C9CA .word 0x8C8F91 .word 0x2C2F32 .word 0x040405
.word 0x000000 .word 0x110902 .word 0x4D2805 .word 0x604C38 .word 0xC1BCB7 .word 0x7C7976 .word 0x555350 .word 0xB3ABA4 .word 0x775B3F .word 0x452402 .word 0x080300
.word 0x000000 .word 0x1D0F01 .word 0x7B4105 .word 0x703901 .word 0x613302 .word 0x3E2001 .word 0x2B1701 .word 0x663300 .word 0x763A00 .word 0x6F3A04 .word 0x0F0800


virus:
.word 0x000000 .word 0xE2E1DD .word 0xE2E1DD .word 0xE2E0DC .word 0xDFE0E0 .word 0xDEDFE0 .word 0xE1E0DC .word 0xE2E1DD .word 0xE2E1DD .word 0x000000
.word 0xE2E1DD .word 0xE2E1DD .word 0xE4E3E0 .word 0xCBCAC4 .word 0x91906A .word 0x908F68 .word 0xCCC9C0 .word 0xE4E3E0 .word 0xE2E1DD .word 0xE2E1DD
.word 0xE2E1DD .word 0xE2E1DD .word 0xE8E5E2 .word 0x91A6A0 .word 0x6F6921 .word 0x877018 .word 0xB8AC8F .word 0xE4E4E2 .word 0xE2E1DD .word 0xE1E0DD
.word 0xE2E1DD .word 0xE2E1DD .word 0xE6E6E4 .word 0xC5C0A9 .word 0x927A21 .word 0x937E24 .word 0x738469 .word 0xD9DBDB .word 0xE4E2DE .word 0xE1E0DC
.word 0xE2E0DC .word 0xE6E7E2 .word 0xDCDAD6 .word 0xC2B8B9 .word 0x889D9E .word 0xB1BCBF .word 0xABBDC1 .word 0xDADAD6 .word 0xDCDCD9 .word 0xE2E1DD
.word 0xE3E4DF .word 0xB4A0A2 .word 0x73404D .word 0x733244 .word 0xDDD4D7 .word 0xC0B188 .word 0x84907A .word 0x497D8A .word 0xA4ACAB .word 0xE7E5E1
.word 0xE6E8E2 .word 0x886367 .word 0x490B1F .word 0x4E1021 .word 0xAB8691 .word 0x8BA495 .word 0x124140 .word 0x225455 .word 0xB3BFC0 .word 0xE8E5E0
.word 0xE6E6E3 .word 0x8E7965 .word 0x553313 .word 0x502B1C .word 0x977D71 .word 0x93B3B8 .word 0x0E3D45 .word 0x224B40 .word 0x839486 .word 0xE8E5E1
.word 0xE4E3E0 .word 0xBDB9B0 .word 0xB6ADA0 .word 0xA08C7F .word 0xCFCDC5 .word 0xD4D1C8 .word 0x6A7563 .word 0x707B71 .word 0xADA68C .word 0xE4E4E1
.word 0x000000 .word 0xE5E5E1 .word 0xE6E6E3 .word 0xE6E7E4 .word 0xE3E2DF .word 0xDFDED9 .word 0xE0DDD7 .word 0xE8E5E2 .word 0xE2E2DF .word 0x000000


##############################################################################
# Mutable Data
##############################################################################

##############################################################################
# Code
##############################################################################
	.text
	.globl main

main:
##############################################################################
# Draw the bottle and the capsule
##############################################################################
  # Initialize the game
  lw $t0, ADDR_DSPL         # Contain the base address for display
  la $t9, Virus_check_BitMap
  
  jal draw_dr_mario
  jal draw_virus
  
  li $t1, 0xff0000          # Colour red
  li $t2, 0xFFFF00          # Colour yellow
  li $t3, 0x0000ff          # Colour blue
  li $t4, 0x808080          # Colour Grey

  # Draw the left_bottle_mouth
  add $t5, $zero, $zero     
  addi $t6, $t0, 1668       
  addi $t7, $zero, 3        
  addi $t8, $zero, 160      
  jal drawing_start
  # Draw the top_left_part
  add $t5, $zero, $zero     
  addi $t6, $t0, 1968       
  addi $t7, $zero, 6        
  addi $t8, $zero, 4        
  jal drawing_start
  # Draw the left side 
  add $t5, $zero, $zero    
  addi $t6, $t0, 1968        
  addi $t7, $zero, 18       
  addi $t8, $zero, 160      
  jal drawing_start
  # Draw the bottom
  add $t5, $zero, $zero 
  addi $t7, $zero, 15
  addi $t8, $zero, 4        
  jal drawing_start
  # Draw the right_bottle_mouth
  add $t5, $zero, $zero    
  addi $t6, $t0, 1684
  addi $t7, $zero, 2
  addi $t8, $zero, 160
  jal drawing_start
  # Draw the top_right
  add $t5, $zero, $zero
  addi $t7, $zero, 5
  addi $t8, $zero, 4
  jal drawing_start
  # Draw the right side
  add $t5, $zero, $zero
  addi $t7, $zero, 18
  addi $t8, $zero, 160
  jal drawing_start

  select_difficulty:
  lw $s6, ADDR_KBRD
  lw $s5, 0($s6)
  beq $s5, 1, check_easy_medium_hard
  j select_difficulty

  check_easy_medium_hard:
    lw $s7, 4($s6)                  # Indicate easy, medium or Hard
    
    li $s5, 0x31                
    beq $s7, $s5, easy
    li $s5, 0x32
    beq $s7, $s5, medium
    li $s5, 0x33
    beq $s7, $s5, hard
    j check_easy_medium_hard
    
   easy:
    li $s0, 4           # Easy 模式最多 4 个病毒
    jal generate_random_viruses
    j start_again

medium:
    li $s0, 6
    jal generate_random_viruses
    j start_again


  hard:
    li $s0, 10
    jal generate_random_viruses
    j start_again


generate_random_viruses:
    li $s1, 0              # 当前病毒数 = 0

virus_loop:
    # 1. 随机生成行号 (21-29)
    li $v0, 42        # syscall 42: generate random int in range [$a0, $a1)
    li $a0, 0         # 使用默认的随机数生成器
    li $a1, 9         # [0, 9) -> 会生成 0 到 8 的随机数
    syscall           # 结果保存在 $a0 中
    
    addi $a0, $a0, 21 # 将 0~8 映射到 21~29
    move $t5, $a0


    # 2. 随机生成列号 (12-25)
    li $v0, 42        # syscall 42: generate random int in range [$a0, $a1)
    li $a0, 0         # 使用默认的随机数生成器
    li $a1, 14        # [0, 14) -> 生成 0 到 13
    syscall           # 结果保存在 $a0 中
    
    addi $a0, $a0, 12 # 将 0~13 映射到 12~25
    move $t6, $a0

    # 3. 计算 Bitmap 地址
    lw $t0, ADDR_DSPL 
    la $t9, Virus_check_BitMap
    
    
    mul $t5, $t5, 160      # row offset
   
    mul $t6, $t6, 4        # col offset
    
    add $t5, $t5, $t6
    
    add $t6, $t0, $t5      # $t6 = 最终 Bitmap 地址
    

    # 4. 检查当前位置是否已有病毒
    lw $t7, 0($t6)
    li $t8, 0x000000
    bne $t7, $t8, virus_loop  # 如果不是黑色，跳过重新生成

    # 5. 随机选择颜色（红、黄、蓝）
    li $v0, 42
    li $a0, 0
    li $a1, 3
    syscall
    move $t7, $a0          # $t7: 颜色索引

    li $t1, 0xff0000       # red
    li $t2, 0xffff00       # yellow
    li $t3, 0x0000ff       # blue

    beq $t7, 0, set_red
    beq $t7, 1, set_yellow
    beq $t7, 2, set_blue

set_red:
    move $t1, $t1
    li   $t2, 1
    j write_color

set_yellow:
    move $t1, $t2
    li   $t2, 2
    j write_color

set_blue:
    move $t1, $t3
    li   $t2, 3
    j write_color

write_color:
    sw $t1, 0($t6)               # 写入颜色

    # 写入 Virus_check_BitMap 标志
    sub $t7, $t6, $t0            # $t7 = 偏移
    add $t7, $t7, $t9            # $t9 是 bitmap base，$t7 = Virus_check_BitMap 对应地址
    sb $t2, 0($t7)               # 存入 1/2/3 代表颜色

    # 计数器增加
    addi $s1, $s1, 1
    blt $s1, $s0, virus_loop     # 如果没达到上限，继续
    
    # ---- 写入颜色 ----
sw $t1, 0($t6)

# ---- 写入 Virus_check_BitMap 标志 (按颜色区分) ----
sub $t7, $t6, $t0      # 相对地址
add $t7, $t7, $t9      # $t7 now = Bitmap address in Virus_check_BitMap

# 判断颜色
li $t8, 0xFF0000
beq $t1, $t8, store_red
li $t8, 0xFFFF00
beq $t1, $t8, store_yellow
li $t8, 0x0000FF
beq $t1, $t8, store_blue

store_red:
  li $t8, 1
  j store_color
store_yellow:
  li $t8, 2
  j store_color
store_blue:
  li $t8, 3
  j store_color
  
store_color:
  sb $t8, 0($t7)

    jr $ra
    

  start_again:
  # Draw capsule
  li $t1, 0xff0000       # red
  li $t2, 0xffff00       # yellow
  li $t3, 0x0000ff       # blue

  li   $a0, 30
  la   $a1, gravity_interval
  sw   $a0, 0($a1)

  li   $a0, 0
  la   $a1, interval_counter
  sw   $a0, 0($a1)
  
  jal draw_capsule_helper
  
  j game_loop
  
  
##############################################################################
# Helper function: Drawing helper function
##############################################################################
drawing_start:         
    sw $t4, 0($t6)            
    addi $t5, $t5, 1          
    add $t6, $t6, $t8      
    beq $t5, $t7, drawing_end    
    j drawing_start    
  drawing_end:   
    jr $ra
  
##############################################################################
# Helper function: Draw the inital capsule
##############################################################################
draw_capsule_helper:
  # Test if location 1068 is black
  lw $t0, ADDR_DSPL 
  addi $t9, $zero, 0x000000
  lw $t4, 1068($t0)
  # If black draw at the the bottle mouth
  beq $t9, $t4, random_colour1 
  # If location is not black, jump to drawfirstcpasule and change the colour
  move $t1, $s4
  move $t2, $s3
  j draw_capsule

  # Choose two random colours
  random_colour1:
    li $v0, 42
    li $a0, 0
    li $a1, 3
    syscall                       
    addi $t5, $zero, 0
    addi $t6, $zero, 1
    addi $t7, $zero, 2
  IF:                           
    bne $a0, $t5, ELIF
    move $t4, $t1
    j random_colour2
  ELIF:
    bne $a0, $t6, ELSE
    move $t4, $t2
    j random_colour2
  ELSE:
    move $t4, $t3
    j random_colour2
  random_colour2:
    li $a0, 0                     
    syscall                   
  IF1:                      
    bne $a0, $t5, ELIF1
    move $t2, $t1
    move $t1, $t4
    j draw_capsule
  ELIF1:
    bne $a0, $t6, ELSE1
    move $t1, $t4
    j draw_capsule
  ELSE1:
    move $t2, $t3
    move $t1, $t4
    j draw_capsule

  draw_capsule:
    addi $sp, $sp, -4    
    sw   $ra, 0($sp)     
    
    # Paint the first half of the capsule
    move $t4, $t1
    add $t5, $zero, $zero       
    addi $t6, $t0, 1676       
    addi $t7, $zero, 1
    addi $t8, $zero, 160
    jal drawing_start
    # Paint the second half of the capsule
    move $t4, $t2                
    add $t5, $zero, $zero  
    addi $t6, $t0, 1836 
    addi $t7, $zero, 1
    addi $t8, $zero, 0
    jal drawing_start
    
    lw   $ra, 0($sp)     
    addi $sp, $sp, 4     

  # Then draw at 1068
  random_colour3:
    li $v0, 42
    li $a0, 0
    li $a1, 3
    syscall                       
    addi $t5, $zero, 0
    addi $t6, $zero, 1
    addi $t7, $zero, 2
  IF3:                           
    bne $a0, $t5, ELIF3
    li $s4, 0xff0000
    j random_colour4
  ELIF3:
    bne $a0, $t6, ELSE3
    li $s4, 0xFFFF00
    j random_colour4
  ELSE3:
    li $s4, 0x0000ff
    j random_colour4
  random_colour4:
    li $a0, 0                     
    syscall                   
  IF4:                      
    bne $a0, $t5, ELIF4
    li $s3, 0xff0000
    j draw_capsule2
  ELIF4:
    bne $a0, $t6, ELSE4
    li $s3, 0xFFFF00
    j draw_capsule2
  ELSE4:
    li $s3, 0x0000ff
    j draw_capsule

  draw_capsule2:
    addi $sp, $sp, -4    
    sw   $ra, 0($sp)     
    
    # Paint the first half of the capsule
    move $t4, $s4
    add $t5, $zero, $zero       
    addi $t6, $t0, 1068    
    addi $t7, $zero, 1
    addi $t8, $zero, 160
    jal drawing_start
    # Paint the second half of the capsule
    move $t4, $s3                
    add $t5, $zero, $zero  
    addi $t6, $t0, 1228 
    addi $t7, $zero, 1
    addi $t8, $zero, 0
    jal drawing_start
    lw   $ra, 0($sp)     
    addi $sp, $sp, 4 
    addi $t6, $t0, 1836
    jr $ra
  

##############################################################################
# 1a. Check if key has been pressed
##############################################################################
check_input:
  lw $t0, ADDR_KBRD
  lw $t9, 0($t0)
  beq $t9, 1, keyboard_input
  j no_input 
  
  
  keyboard_input:
    lw $t3, 4($t0)
    beq $t3, 0x71, respond_to_Q 
    lw $t3, 4($t0)
    beq $t3, 0x70, respond_to_P
    jr $ra

##############################################################################
# 1b. Check which key has been pressed   
##############################################################################   
check_key: 
  li $t9, 0x77        
  beq $t3, $t9, print_black   
  li $t9, 0x73         
  beq $t3, $t9, print_black
  li $t9, 0x61         
  beq $t3, $t9, print_black   
  li $t9, 0x64         
  beq $t3, $t9, print_black     

  # The input is not W, S, A, or D, so same as processing no keyboard input
  jal no_input

  no_input:
    jal print_black
    j no_keyboard_input

  # Print the capsule black first, avoid updating the position multiple times
  print_black:
    # Set up the counter that will be used for the check collision
    add $t9, $zero, $zero
    # Store the original ra to the stack
    addi $sp, $sp, -4    
    sw   $ra, 0($sp)
    beq $t8, $zero, bottom
    addi $t4, $zero, 1
    beq $t8, $t4, left
    addi $t4, $zero, 2
    beq $t8, $t4, top
    addi $t4, $zero, 3
    beq $t8, $t4, right
    
  bottom:
    li $t4, 0x000000 
    add $t5, $zero, $zero
    addi $t7, $zero, 2
    addi $t8, $zero, -160
    jal drawing_start
    addi $t6, $t6, 160
    addi $t6, $t6, 160
    add $t8, $zero, $zero
    lw   $ra, 0($sp)     
    addi $sp, $sp, 4 
    jr $ra
    
  left:
    li $t4, 0x000000
    add $t5, $zero, $zero
    addi $t7, $zero, 2
    addi $t8, $zero, 4
    jal drawing_start
    addi $t6, $t6, -4
    addi $t6, $t6, -4
    addi $t8, $zero, 1
    lw   $ra, 0($sp)     
    addi $sp, $sp, 4 
    jr $ra
    
  top:
    li $t4, 0x000000
    add $t5, $zero, $zero
    addi $t7, $zero, 2
    addi $t8, $zero, 160
    jal drawing_start
    addi $t6, $t6, -160
    addi $t6, $t6, -160
    addi $t8, $zero, 2
    lw   $ra, 0($sp)     
    addi $sp, $sp, 4 
    jr $ra
    
  right:
    li $t4, 0x000000
    add $t5, $zero, $zero
    addi $t7, $zero, 2
    addi $t8, $zero, -4
    jal drawing_start
    addi $t6, $t6, 4
    addi $t6, $t6, 4
    addi $t8, $zero, 3
    lw   $ra, 0($sp)     
    addi $sp, $sp, 4 
    jr $ra
    
##############################################################################
# 2a. Check for collisions
##############################################################################
collision:
  beq $t8, $zero, bb
  addi $t4, $zero, 1
  beq $t8, $t4, ll
  addi $t4, $zero, 2
  beq $t8, $t4, tt
  addi $t4, $zero, 3
  beq $t8, $t4, rr
      
  # When the second half of the capsule is at the bottom
  bb:    
    # Check command A
    li $t4, 0x61
    beq $t3, $t4, bba
    # Check command D
    li $t4, 0x64
    beq $t3, $t4, bbd
    # Check command w
    li $t4, 0x77
    beq $t3, $t4, bbw
    # Check command s
    li $t4, 0x73
    beq $t3, $t4, lrbs

  # Jump to no_input, so the cpsule will be redrawn at the same location
  # Treat it the same as no input, same behaviour
  bba:
    addi $t4, $t6, -4
    lw $t4, 0($t4)
    bne $t4, 0x000000, no_input  
    addi $t4, $t6, -164
    lw $t4, 0($t4)
    bne $t4, 0x000000, no_input
    # No collision
    j check_the_other_capsule
      
  bbd:
    addi $t4, $t6, 4
    lw $t4, 0($t4)
    bne $t4, 0x000000, no_input
    addi $t4, $t6, -156
    lw $t4, 0($t4)
    bne $t4, 0x000000, no_input
    # No collision
    j check_the_other_capsule
        
  bbw:
    # Right wall
    addi $t4, $t6, 4
    lw $t4, 0($t4)
    bne $t4, 0x000000, no_input
    # Special case, at bottle mouth
    addi $t4, $t6, -156
    lw $t4, 0($t4)
    bne $t4, 0x000000, no_input
    # No collision
    j check_the_other_capsule
        
  # When the second half of the capsule is at the left 
  ll:
    # Check command A
    li $t4, 0x61
    beq $t3, $t4, lla
    # Check command D
    li $t4, 0x64
    beq $t3, $t4, lld
    # Check command s
    li $t4, 0x73
    beq $t3, $t4, lrbs
    # Check command w
    li $t4, 0x77
    beq $t3, $t4, lrbs
    
  lla:
    addi $t4, $t6, -4
    lw $t4, 0($t4)
    bne $t4, 0x000000, no_input
    # No collision
    j check_the_other_capsule
        
  lld:
    addi $t4, $t6, 8
    lw $t4, 0($t4)
    bne $t4, 0x000000, no_input 
    # No collision
    j check_the_other_capsule

  lls:
    addi $t4, $t6, 160
    lw $t4, 0($t4)
    bne $t4, 0x000000, bottom_or_on_top 
    # No collision
    j check_the_other_capsule
      
  # When the second half of the capsule is at the top 
  tt:
    # Check command A
    li $t4, 0x61
    beq $t3, $t4, tta
    # Check command D
    li $t4, 0x64
    beq $t3, $t4, ttd
    # Check command w
    li $t4, 0x77
    beq $t3, $t4, ttw
    # Check command s
    li $t4, 0x73
    beq $t3, $t4, tts
      
  tta:                         
    addi $t4, $t6, -4
    lw $t4, 0($t4)
    bne $t4, 0x000000, no_input
    # No collision
    j check_the_other_capsule
  ttd:                       
    addi $t4, $t6, 4
    lw $t4, 0($t4)
    bne $t4, 0x000000, no_input
    # No collision
    j check_the_other_capsule
  ttw:
    addi $t4, $t6, -4
    lw $t4, 0($t4)
    bne $t4, 0x000000, no_input
    # No collision
    j check_the_other_capsule
  tts:
    addi $t4, $t6, 320
    lw $t4, 0($t4)
    bne $t4, 0x000000, bottom_or_on_top
    # No collision
    j check_the_other_capsule
       
  # When the second half of the capsule is at the right
  rr:
    # Check command A
    li $t4, 0x61
    beq $t3, $t4, rra
    # Check command D
    li $t4, 0x64
    beq $t3, $t4, rrd
    # Check command w
    li $t4, 0x77
    beq $t3, $t4, rrw
    # Check command s
    li $t4, 0x73
    beq $t3, $t4, lrbs
    # No collision
    j check_the_other_capsule
      
  rra:
    addi $t4, $t6, -8
    lw $t4, 0($t4)
    bne $t4, 0x000000, no_input
    # No collision
    j check_the_other_capsule  
      
  rrd:
    addi $t4, $t6, 4
    lw $t4, 0($t4)
    bne $t4, 0x000000, no_input
    # No collision
    j check_the_other_capsule
      
  rrw:
    addi $t4, $t6, -160
    lw $t4, 0($t4)
    bne $t4, 0x000000, no_input
    addi $t4, $t6, -164
    lw $t4, 0($t4)
    bne $t4, 0x000000, no_input
    # No collision
    j check_the_other_capsule

  lrbs:
    addi $t4, $t6, 160
    lw $t4, 0($t4)
    bne $t4, 0x000000, bottom_or_on_top
    # No collision
    j check_the_other_capsule
##############################################################################
# Handle the case: Check the other capsule
##############################################################################
check_the_other_capsule:
  # First add the counter
  addi $t9, $t9, 1
  # Then swith the current position to the other capsule's position
  beq $t8, $zero, o_t
  addi $t4, $zero, 1
  beq $t8, $t4, o_r
  addi $t4, $zero, 2
  beq $t8, $t4, o_b
  addi $t4, $zero, 3
  beq $t8, $t4, o_l
    
o_t:
  addi $t6, $t6, -160
  addi $t8, $zero, 2
  bne $t9, 2, collision
  jr $ra
o_r:
  addi $t6, $t6, 4
  addi $t8, $zero, 3
  bne $t9, 2, collision
  jr $ra
o_b:
  addi $t6, $t6, 160
  addi $t8, $zero, 0
  bne $t9, 2, collision
  jr $ra
o_l:
  addi $t6, $t6, -4
  addi $t8, $zero, 1
  bne $t9, 2, collision
  jr $ra
  
##############################################################################
# 2b. Update locations (capsules)
############################################################################## 
update_input_WASD:       
  li $t9, 0x77        
  beq $t3, $t9, respond_to_W   
  li $t9, 0x73         
  beq $t3, $t9, respond_to_S
  li $t9, 0x61         
  beq $t3, $t9, respond_to_A   
  li $t9, 0x64         
  beq $t3, $t9, respond_to_D

  # No need to update the t6 for input W
  respond_to_W:
    # 播放声音
    # 模拟声音播放：用 MIDI 音效
    li $v0, 31
    li $a0, 60       # pitch，中音C
    li $a1, 300      # duration，300ms
    li $a2, 10       # instrument
    li $a3, 100      # volume
    syscall
    
    add $t5, $zero, $zero  
    addi $t7, $zero, 1
    add $t4, $zero, $zero
    beq $t4, $t8, bottom_W
    addi $t4, $zero, 1
    beq $t4, $t8, left_W
    addi $t4, $zero, 2
    beq $t4, $t8, top_W
    addi $t4, $zero, 3
    beq $t4, $t8, right_W

  # Check the current status of the capsule: horizontally(being turned once), vertically(being turned twice) ...
  bottom_W:                 
    addi $t8, $zero, 4
    add $t9, $zero, 1
    jr $ra
  left_W:
    addi $t8, $zero, 160
    add $t9, $zero, 2
    jr $ra
  top_W:
    addi $t8, $zero, -4
    add $t9, $zero, 3
    jr $ra
  right_W:
    addi $t8, $zero, -160
    add $t9, $zero, 0
    jr $ra

  # Update the t6
  respond_to_A:
    # 模拟声音播放：用 MIDI 音效
    li $v0, 31
    li $a0, 60       # pitch，中音C
    li $a1, 300      # duration，300ms
    li $a2, 11      # instrument
    li $a3, 100      # volume
    syscall
    add $t5, $zero, $zero
    addi $t6, $t6, -4
    addi $t7, $zero, 1
    j ASD_check_check

  # Update the t6
  respond_to_S:
    # 模拟声音播放：用 MIDI 音效
    li $v0, 31
    li $a0, 60       # pitch，中音C
    li $a1, 300      # duration，300ms
    li $a2, 13      # instrument
    li $a3, 100      # volume
    syscall
    add $t5, $zero, $zero
    addi $t6, $t6, 160
    addi $t7, $zero, 1
    j ASD_check_check

  # Update the t6 
  respond_to_D:
    # 模拟声音播放：用 MIDI 音效
    li $v0, 31
    li $a0, 60       # pitch，中音C
    li $a1, 300      # duration，300ms
    li $a2, 12      # instrument
    li $a3, 100      # volume
    syscall
    add $t5, $zero, $zero
    addi $t6, $t6, 4
    addi $t7, $zero, 1
    j ASD_check_check

  # Check the current status of the capsule: horizontally(turned once), vertically(turned twice) ...
  ASD_check_check:
    add $t4, $zero, $zero
    beq $t4, $t8, bottom_ASD
    addi $t4, $zero, 1
    beq $t4, $t8, left_ASD
    addi $t4, $zero, 2
    beq $t4, $t8, top_ASD
    addi $t4, $zero, 3
    beq $t4, $t8, right_ASD

  # Determin the location of the other half of the capsule based on the status
  bottom_ASD:                 
    addi $t8, $zero, -160
    add $t9, $zero, 0
    jr $ra
  left_ASD:
    addi $t8, $zero, 4
    add $t9, $zero, 1
    jr $ra
  top_ASD:
    addi $t8, $zero, 160
    add $t9, $zero, 2
    jr $ra
  right_ASD:
    addi $t8, $zero, -4
    add $t9, $zero, 3
    jr $ra

##############################################################################
# 3. Draw the screen
##############################################################################  
redraw_capsule:    
  addi $sp, $sp, -4    
  sw   $ra, 0($sp)     
    
  add $t4, $zero, $t2
  add $t5, $zero, $zero
  addi $t7, $zero, 1
  jal drawing_start
  add $t4, $zero, $t1
  add $t5, $zero, $zero
  addi $t7, $zero, 1
  sub $t8, $zero, $t8
  jal drawing_start
  add $t8, $t9, $zero

  lw   $ra, 0($sp)     
  addi $sp, $sp, 4 
  jr $ra

##############################################################################
# 4. Sleep
############################################################################## 
sleep:
  li $v0, 32
  # 16 ms, 60hz
  li $a0, 16                    
  syscall
  jr $ra

##############################################################################
# 5. Go back to Step 1
############################################################################## 
j_back:
  j game_loop   
    
##############################################################################
# Handle the case: No keyboard input
##############################################################################
no_keyboard_input:
  respond_to_incorrect_input:
    add $t5, $zero, $zero  
    addi $t7, $zero, 1
    add $t4, $zero, $zero
    beq $t4, $t8, bottom_no
    addi $t4, $zero, 1
    beq $t4, $t8, left_no
    addi $t4, $zero, 2
    beq $t4, $t8, top_no
    addi $t4, $zero, 3
    beq $t4, $t8, right_no
    
  bottom_no:
    addi $t8, $zero, -160
    add $t9, $zero, 0
    jal redraw_capsule
    jal sleep
    j j_back
  left_no:
    addi $t8, $zero, 4
    add $t9, $zero, 1
    jal redraw_capsule
    jal sleep
    j j_back
  top_no:
    addi $t8, $zero, 160
    add $t9, $zero, 2
    jal redraw_capsule
    jal sleep
    j j_back
  right_no:
    addi $t8, $zero, -4
    add $t9, $zero, 3
    jal redraw_capsule
    jal sleep
    j j_back
##############################################################################
# Handle the case: Respond to q
##############################################################################
respond_to_Q:
  li $v0 , 10
  syscall

##############################################################################
# Handle the case: Respond to p
##############################################################################
respond_to_P:
  lw $t0, ADDR_DSPL
  add $a2, $t0, $zero
  li $t9, 8
  li $a3, 0x808080
  
vertically1:
  sw $a3, 0($a2)
  addi $a2, $a2, 160
  addi $t9, $t9, -1
  bgtz $t9, vertically1
  li $t9, 4
  addi $a2, $t0, 12
vertically2:
  sw $a3, 0($a2)
  addi $a2, $a2, 160
  addi $t9, $t9, -1
  bgtz $t9, vertically2
  add $a2, $t0, $zero
  li $t9, 4
horizontally1:
  sw $a3, 0($a2)
  addi $a2, $a2, 4
  addi $t9, $t9, -1
  bgtz $t9, horizontally1
  li $t9, 4
  addi $a2, $t0, 480
  li $t9, 4
horizontally2:
  sw $a3, 0($a2)
  addi $a2, $a2, 4
  addi $t9, $t9, -1
  bgtz $t9, horizontally2
  li $t9, 8
  li $a3, 0x000000
  add $a2, $t0, $zero
  
  lw $t0, ADDR_KBRD 
infinite_loop:
  # First check if there is an input or not
  lw $t9, 0($t0)
  # Check if the key is p
  beq $t9, 1, check_p
  # If not, keep looping
  j infinite_loop
  
check_p:
  lw $t3, 4($t0)
  # The input is p, resume
  beq $t3,0x70, resume
  # Keep looping
  j respond_to_P

resume:
  lw $t0, ADDR_DSPL
  add $a2, $t0, $zero
  li $t9, 8
  li $a3, 0x000000
  vertically_black1:
    sw $a3, 0($a2)
    addi $a2, $a2, 160
    addi $t9, $t9, -1
    bgtz $t9, vertically_black1
    li $t9, 4
    addi $a2, $t0, 12
  vertically_balck2:
    sw $a3, 0($a2)
    addi $a2, $a2, 160
    addi $t9, $t9, -1
    bgtz $t9, vertically_balck2
    add $a2, $t0, $zero
    li $t9, 4
  horizontally_black1:
    sw $a3, 0($a2)
    addi $a2, $a2, 4
    addi $t9, $t9, -1
    bgtz $t9, horizontally_black1
    li $t9, 4
    addi $a2, $t0, 480
    li $t9, 4
  horizontally_black2:
    sw $a3, 0($a2)
    addi $a2, $a2, 4
    addi $t9, $t9, -1
    bgtz $t9, horizontally_black2
  lw $t0, ADDR_KBRD 


  
  jr $ra
##############################################################################
# Handle the case: Capsule reach the bottom of the bootle or on top of another
##############################################################################
bottom_or_on_top:
    # First determin how many time collision is checked
    add $t4, $zero, $zero
    beq $t9, $t4, redraw_at_the_same_location
    j reverse_back_to_the_original_location

redraw_at_the_same_location:
  jal ASD_check_check
  jal redraw_capsule  
  jal reset_registers
  jal horiz_mark
  jal reset_registers
  jal vert_mark
  jal reset_registers
  jal clean_green_purple_white
  jal reset_registers
  jal check_game_over
  jal drop
  j restart

reverse_back_to_the_original_location:
    # Then swith the current position to the other capsule's position
    beq $t8, $zero, o_t1
    addi $t4, $zero, 1
    beq $t8, $t4, o_r1
    addi $t4, $zero, 2
    beq $t8, $t4, o_b1
    addi $t4, $zero, 3
    beq $t8, $t4, o_l1    
    
o_t1:
  addi $t6, $t6, -160
  addi $t8, $zero, 2
  jal ASD_check_check
  jal redraw_capsule
  j restart
o_r1:
  addi $t6, $t6, 4
  addi $t8, $zero, 3
  jal ASD_check_check
  jal redraw_capsule
  j restart
o_b1:
  addi $t6, $t6, 160
  addi $t8, $zero, 0
  jal ASD_check_check
  jal redraw_capsule
  j restart
o_l1:
  addi $t6, $t6, -4
  addi $t8, $zero, 1
  jal ASD_check_check
  jal redraw_capsule
  j restart

restart:
  # Initialize the game
  lw $t0, ADDR_DSPL         # Contain the base address for display
  li $t1, 0xff0000          # Colour red
  li $t2, 0xFFFF00          # Colour yellow
  li $t3, 0x0000ff          # Colour blue
  li $t4, 0x808080          # Colour Grey
  j start_again

#########################################################################################################################
# Handle the case: Mark sqaures horiziontally first
#########################################################################################################################
horiz_mark:
  addi $sp, $sp, -4    
  sw $ra, 0($sp)             
    
  lw $t0, ADDR_DSPL          
  addi $s6, $t0, 2132            # $s6 = pointer to row0
  addi $s7, $zero, 17            # $s7 = row counter (17 rows)

row_loop:
  addi $t1, $zero, 0             # Column counter
  addi $t2, $zero, 0             # Previous colour
  addi $t9, $zero, 0             # Number of same colours
  move $t6, $s6                  # Start location

scan_cols:
  addi $t3, $zero, 13
  beq $t1, $t3, end_row          # Next row
  lw $t4, 0($t6)                 # Current colour

  # Check if if it is red, blue, or yellow
  li $t3, 0xFF0000               # red
  beq $t4, $t3, red_blue_yellow
  li $t3, 0x0000FF               # blue
  beq $t4, $t3, red_blue_yellow
  li $t3, 0xFFFF00               # yellow
  beq $t4, $t3, red_blue_yellow

colour_black:
  # The square is colour black
  jal finalize_check
  addi $t9, $zero, 0                
  addi $t2, $zero, 0                
  j next_col

red_blue_yellow:
  beq $t2, $zero, found
  # If previous colour equal to current Color, plus 1
  beq $t2, $t4, same_color
  # Not the same colour
  jal finalize_check
  addi $t9,$zero, 1                
  move $t2, $t4              
  move $t5, $t6                   # Update t5 again
  j next_col

found:
  addi $t9, $zero, 1
  move $t2, $t4              
  move $t5, $t6                   # Store the start location for same colour
  j next_col

same_color:
  addi $t9, $t9, 1           
  # t5 stays the same, t6 keep moving
  j next_col

next_col:
  addi $t1, $t1, 1           
  addi $t6, $t6, 4           
  j scan_cols

end_row:
  # Final check for a run at row's end
  jal finalize_check
  # Move to next row
  addi $s6, $s6, 160
  addi $s7, $s7, -1
  bgtz $s7, row_loop
  j finish

############################################################
#  Handle the case: $t9 >= 4
############################################################1
finalize_check:
  li $t3, 4
  blt $t9, $t3, done_final   # if smaller than 4, do nothing

  # Purple for Red
  li $t3, 0xFF0000
  beq $t2, $t3, turn_purple     
  # Green for blue
  li $t3, 0x0000FF
  beq $t2, $t3, turn_green      
  # Yellow for white
  li $t3, 0xFFFF00
  beq $t2, $t3, turn_white      
    
turn_purple:
  li $t3, 0xFF00FF
  j mark_loop
turn_green:
  li $t3, 0x00FF00
  j mark_loop
turn_white:
  li $t3, 0xFFFFFF
  j mark_loop

# Mark all of them
mark_loop:
  sw $t3, 0($t5)           
  addi $t5, $t5, 4          
  addi $t9, $t9, -1
  bgtz $t9, mark_loop

done_final:
  jr $ra

finish:
  lw $ra, 0($sp)  
  addi $sp, $sp, 4
  jr $ra

###############################################################################
# Handle the case: Mark sqaures vertically 
###############################################################################
vert_mark:
  addi $sp, $sp, -4     
  sw $ra, 0($sp)
  lw $t0, ADDR_DSPL  
  addi $t8,$zero, 0  # Colum counter

vert_outer:
  addi $t2,$zero, 13
  beq $t8, $t2, vert_finish   
  # Compute pointer to top cell of column:
  # s6 = base + 2132 + (col * 4)
  addi $t3, $zero, 2132
  mul $t4, $t8, 4    
  add $s6, $t0, $t3
  add $s6, $s6, $t4  
  # Setup:
  addi $s7, $zero, 17        
  addi $t2,$zero, 0         # Previous Colour
  addi $t9,$zero, 0         
  # Use $t6 as the current address just like before
  move $t6, $s6

vert_row:
  beq $s7, $zero, vert_endcol   
  lw $t4, 0($t6)    
  # Check if it is red/purple
  li $a3, 0xFF0000
  beq $t4, $a3, vert_red_blue_yellow
  li $a3, 0xFF00FF
  beq $t4, $a3, vert_red_blue_yellow
  # Check if it is blue/green
  li $a3, 0x0000FF
  beq $t4, $a3, vert_red_blue_yellow
  li $a3, 0x00FF00
  beq $t4, $a3, vert_red_blue_yellow
  # Check if it is yellow/white
  li $a3, 0xFFFF00
  beq $t4, $a3, vert_red_blue_yellow
  li $a3, 0xFFFFFF
  beq $t4, $a3, vert_red_blue_yellow

# Colour black
colour_black_vertical:
  jal final_check_vertical
  addi $t9, $zero, 0
  addi $t2, $zero, 0
  j vert_next

vert_red_blue_yellow:
  # Normalize the current cell's color.
  li $t7, 0xFF0000
  beq $t4, $t7, norm_done
  li $t7, 0xFF00FF
  beq $t4, $t7, norm_done
  li $t7, 0x0000FF
  beq $t4, $t7, norm_done
  li $t7, 0x00FF00
  beq $t4, $t7, norm_done
  li $t7, 0xFFFF00
  beq $t4, $t7, norm_done
  li $t7, 0xFFFFFF
  beq $t4, $t7, norm_done
  
norm_done:
  beq $t2, $zero, vert_start

  # If current colour equal to the previous one
  beq $t2, $t4, vert_same_color

  # Not equal colour
  jal final_check_vertical
  addi $t9, $zero, 1
  move $t2, $t4      
  move $t5, $t6      # Update t5
  j vert_next

vert_start:
  addi $t9, $zero, 1
  move $t2, $t4
  move $t5, $t6
  j vert_next
  
vert_same_color:
  addi $t9, $t9, 1
  j vert_next

vert_next:
  addi $s7, $s7, -1    
  addi $t6, $t6, 160   
  j vert_row

vert_endcol:
  jal  final_check_vertical
  addi $t8, $t8, 1     
  j vert_outer

###############################################################################
# Handle the case: $t9 >= 4
###############################################################################
final_check_vertical:
  li $t3, 4
  blt $t9, $t3, done_final   # if smaller than 4, do nothing

  # Purple for Red
  li $t3, 0xFF0000
  beq $t2, $t3, vert_turn_purple     
  # Green for blue
  li $t3, 0x0000FF
  beq $t2, $t3, vert_turn_green      
  # Yellow for white
  li $t3, 0xFFFF00
  beq $t2, $t3, vert_turn_white 

vert_turn_purple:
  li $t3, 0xFF00FF
  j mark_loop_vert

vert_turn_green:
  li $t3, 0x00FF00
  j mark_loop_vert

vert_turn_white:
  li $t3, 0xFFFFFF
  j mark_loop_vert

mark_loop_vert:
  sw $t3, 0($t5)
  addi $t5, $t5, 160
  addi $t9, $t9, -1
  bgtz $t9, mark_loop_vert
  
done_final1:
  jr $ra

vert_finish:
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  jr $ra
    
###############################################################################
# Handle the case: Clean green or purple or white sqaure
###############################################################################
clean_green_purple_white:
    # 1) Standard subroutine prologue
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    # 2) Get base address + offset 2132
    lw $t0, ADDR_DSPL
    addi $s6, $t0, 2132       # s6 => pointer to row0 for this region

    li $s7, 17              # We'll scan 16 rows
row_loop1:
    li $t1, 0               # column index
    move $t6, $s6             # pointer to start of this row

col_loop:
    li $t2, 13
    beq  $t1, $t2, end_row1    # if col == 12 => done this row

    lw $t4, 0($t6)          # read current cell color

    # if color is green => turn black
    li $t3, 0x00FF00
    beq $t4, $t3, turn_black
    # if color is purple => turn black
    li $t3, 0xFF00FF
    beq $t4, $t3, turn_black
    # if color is white => turn black
    li $t3, 0xFFFFFF
    beq $t4, $t3, turn_black

    # else: do nothing special, move on
    j advance_col1

turn_black:
    li $t3, 0x000000        # black
    sw $t3, 0($t6)

    # virus map check
    la $t7, Virus_check_BitMap
    lw $t0, ADDR_DSPL
    sub $t5, $t6, $t0        # 计算偏移 offset = t6 - ADDR_DSPL
    add $t8, $t7, $t5        # t8 = Virus_check_BitMap + offset

    lb $t5, 0($t8)          # 获取该格子的 virus 标记
    bne $t5, 0 set_zero   
    

advance_col1:
    # move to next column
    addi $t1, $t1, 1
    addi $t6, $t6, 4          # next cell = +4 bytes
    j col_loop

end_row1:
    # move to next row => +160 bytes
    addi $s6, $s6, 160
    addi $s7, $s7, -1
    bgtz $s7, row_loop1

    # done scanning
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

set_zero:
    # la $t7, Virus_check_BitMap
    # sub $t5, $t6, $t0
    # add $t8, $t5, $t7
    li $t5, 0             # 标志 virus
    sb $t5, 0($t8)
###############################################################################
# Handle the case: Drop capsule that is in the air
###############################################################################
drop:
    addi $sp, $sp, -4       # Save return address
    sw $ra, 0($sp)

drop_loop:
    li $t0, 0             # Flag: 0 = no block moved; 1 = at least one block dropped

    # Scan rows from 
    li $t1, 16            
row_loop_drop:
    bltz $t1, done_rows_drop   # if row index < 0, finished this pass

    # For each row, scan columns 0..11.
    li $t2, 0             # Column index = 0
col_loop_drop:
    li $t3, 13
    beq $t2, $t3, next_row_drop  # if col == 13, move to next row

    # Compute address of current cell:
    #   address = ADDR_DSPL + 2132 + (row * 160) + (col * 4)
    lw $t6, ADDR_DSPL      # Load base address
    li $t7, 2132           # Offset for board region
    add $t4, $t6, $t7       # t4 = base + 2132
    mul $t8, $t1, 160       # Row offset = row * 160
    add $t4, $t4, $t8       # t4 = address of (row,0)1s
    mul $t8, $t2, 4         # Column offset = col * 4s
    add $t4, $t4, $t8       # t4 = address of current cell (row, col)

###################################
# virus check
###################################
    la $t7, Virus_check_BitMap
    sub $t5, $t4, $t6
    add $t5, $t5, $t7

    lb $t5, 0($t5)
    beq $t5, 1, skip_drop
    beq $t5, 2, skip_drop
    beq $t5, 3, skip_drop

        
    # Compute address of cell below: simply add 160 bytes.
    addi $t5, $t4, 160       # t5 = address of cell (row+1, col)

    # Load colors:
    lw $t9, 0($t4)         # t9 = current cell color
    lw $s0, 0($t5)         # s0 = color in cell below


    li $t3, 0x000000       # black constant
  
    # If current cell is black, skip dropping.
    beq $t9, $t3, skip_drop


    # If cell below is not black, cannot drop; skip.
    bne $s0, $t3, skip_drop

    # Otherwise, drop the block:
    sw $t9, 0($t5)         # set cell below to current color
    sw $t3, 0($t4)         # set current cell to black
    li $t0, 1              # mark that a block has moved

skip_drop:
    addi $t2, $t2, 1         # next column
    j col_loop_drop

next_row_drop:
    addi $t1, $t1, -1        # move to next row upward (decrement row index)
    j row_loop_drop

done_rows_drop:
    # End of one full pass over the board.
    beq $t0, $zero, drop_done   # if no block moved in this pass, exit drop.
    
    # Otherwise, wait 500 ms and repeat the drop loop.
    li $v0, 32            # syscall code for sleep
    li $a0, 500           # wait 500 ms (adjust if needed)
    syscall

    j drop_loop

drop_done:
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
###############################################################################
# Handle the case: Check game over
###############################################################################
check_game_over:
  lw $t0, ADDR_DSPL  
  addi $t0, $t0, 1996
  lw $t1, 0($t0)
  bne $t1, 0x000000, game_over1
  jr $ra
  
game_over1:
  jal draw_game_over
  check_again:
  lw $t0, ADDR_KBRD
  lw $t9, 0($t0)
  beq $t9, 1, check_input_space
  j check_again

check_input_space:
  lw $t9, 4($t0)
  beq $t9, 0x20, replay
  j check_again
  
replay:
  jal draw_black_screen
  j main

###############################################################################
# 从bitmap 到 copy
###############################################################################
bitmap_to_copy_loop:
lw $t0, ADDR_DSPL
#la $t9, COPY_BitMap
li $t2, 0 #counter初始值为0
add $t3, $t0, $t2 #bitmap 中的 格子
add $t4, $t9, $t2 #对应 copy中的 格子
lw $t5, 0($t3)  # 获取bitmap中的颜色
sw $t5, 0($t4)  # 存入copy中
beq $t2, 6400 bitmap_to_copy_loop_end
addi $t2, $t2, 4
j bitmap_to_copy_loop
bitmap_to_copy_loop_end:
  jr $ra

##############################################################################
# 从copy 到 bitmap
##############################################################################
copy_to_bitmap_loop:
lw $t0, ADDR_DSPL
#la $t9, COPY_BitMap
li $t2, 0 #counter初始值为0
add $t3, $t0, $t2 #bitmap 中的 格子
add $t4, $t9, $t2 #对应 copy中的 格子
lw $t5, 0($t4)  # 获取bitmap中的颜色
sw $t5, 0($t3)  # 存入copy中
beq $t2, 6400 copy_to_bitmap_loop_end
addi $t2, $t2, 4
j copy_to_bitmap_loop
copy_to_bitmap_loop_end:
  jr $ra

###############################################################################
# reset_registers:
###############################################################################
reset_registers:
  addi $v0, $t0, 0
  addi $v1, $t0, 0
  addi $a0, $t0, 0
  addi $a1, $t0, 0
  addi $a2, $t0, 0
  addi $a3, $t0, 0
  addi $t0, $t0, 0
  addi $t1, $t0, 0
  addi $t2, $t0, 0
  addi $t3, $t0, 0
  addi $t4, $t0, 0
  addi $t5, $t0, 0
  addi $t6, $t0, 0
  addi $t7, $t0, 0
  addi $t8, $t0, 0
  addi $t9, $t0, 0
  addi $s0, $t0, 0
  addi $s1, $t0, 0
  addi $s2, $t0, 0
  
  
  addi $s5, $t0, 0
  addi $s6, $t0, 0
  addi $s7, $t0, 0
  jr $ra


##############################################################################
# draw_dr_mario
##############################################################################

draw_dr_mario:
    # 保存 ra
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    lw $t0, ADDR_DSPL           # base display address: 0x10008000
    la $t1, dr_mario          # image data array

    li $t2, 14                  # row counter (14 rows)
    li $t3, 0                   # pixel index

    li $t4, 1072          # offset from display base
    add $t5, $t0, $t4            # $t5 = starting display address

draw_row_loop:
    li $t6, 11                  # col counter (11 columns)
    move $t7, $t5                 # $t7 = current row start

draw_col_loop:
    lw $t8, 0($t1)              # 读取当前像素颜色
    sw $t8, 0($t7)              # 写入到显示器位置
    addi $t1, $t1, 4              # 下一个像素（数据）
    addi $t7, $t7, 4              # 下一个显示器位置（右移 1 单位）
    addi $t3, $t3, 1              # 索引+1
    addi $t6, $t6, -1
    bgtz $t6, draw_col_loop

    # 下一行：往下移动 160 字节（整行）
    addi $t5, $t5, 160
    addi $t2, $t2, -1
    bgtz $t2, draw_row_loop

    # 恢复 ra 并返回
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
##############################################################################
# draw virus
##############################################################################
draw_virus:
    # 保存 ra
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    # 加载基础地址
    lw $t0, ADDR_DSPL           # base display address: 0x10008000
    la $t1, virus          # image data array

    li $t2, 10                 # row counter (10 rows)
    li $t3, 0                   # pixel index 

    li $t4, 2724         # offset from display base
    add $t5, $t0, $t4            # $t5 = starting display address

draw_row_loop1:
    li $t6, 10                 # col counter (10 columns)
    move $t7, $t5                 # $t7 = current row start

draw_col_loop1:
    lw $t8, 0($t1)              # 读取当前像素颜色
    sw $t8, 0($t7)              # 写入到显示器位置
    addi $t1, $t1, 4              # 下一个像素（数据）
    addi $t7, $t7, 4              # 下一个显示器位置（右移 1 单位）
    addi $t3, $t3, 1              # 索引+1
    addi $t6, $t6, -1
    bgtz $t6, draw_col_loop1

    # 下一行：往下移动 160 字节（整行）
    addi $t5, $t5, 160
    addi $t2, $t2, -1
    bgtz $t2, draw_row_loop1

    # 恢复 ra 并返回
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
##########################################
#update new gravity
##########################################
# update_gravity:
  
#   subi $a1, $a1, 6
#   sw $a1, 0($a0)
#   ble  $a1, 1, remain_a1

# remain_a1:
#   li $a1, 1
##############################################################################
# Handle the case: draw game over
##############################################################################

draw_game_over:
  li $v0, 31
    li $a0, 60       # pitch，中音C
    li $a1, 300    # duration，300ms
    li $a2, 14      # instrument
    li $a3, 100      # volume
    syscall
    lw $t0, ADDR_DSPL           # base display address: 0x10008000
    la $t1, game_over          # image data array

    li $t2, 40                  # row counter (14 rows)
    li $t3, 0                   # pixel index

    add $t5, $t0, $zero            # $t5 = starting display address

draw_row_loop2:
    li $t6, 40                  # col counter (11 columns)
    move $t7, $t5                 # $t7 = current row start

draw_col_loop2:
    lw $t8, 0($t1)              # 读取当前像素颜色
    sw $t8, 0($t7)              # 写入到显示器位置
    addi $t1, $t1, 4              # 下一个像素（数据）
    addi $t7, $t7, 4              # 下一个显示器位置（右移 1 单位）
    addi $t3, $t3, 1              # 索引+1
    addi $t6, $t6, -1
    bgtz $t6, draw_col_loop2

    # 下一行：往下移动 160 字节（整行）
    addi $t5, $t5, 160
    addi $t2, $t2, -1
    bgtz $t2, draw_row_loop2

    # 恢复 ra 并返回
    jr $ra
##############################################################################
# Handle the case: paint the whole screen black
##############################################################################
draw_black_screen:
    lw $t0, ADDR_DSPL           # base display address: 0x10008000
    la $t1, game_over           # image data array

    li $t2, 40                  # row counter (14 rows)    
    add $t5, $t0, $zero            # $t5 = starting display address

draw_row_loop3:
    li $t6, 40                  # col counter (11 columns)
    move $t7, $t5                 # $t7 = current row start

draw_col_loop3:
    li $t8, 0x000000              # 读取当前像素颜色
    sw $t8, 0($t7)              # 写入到显示器位置
    
    addi $t7, $t7, 4              # 下一个显示器位置（右移 1 单位）
    
    addi $t6, $t6, -1
    bgtz $t6, draw_col_loop3

    # 下一行：往下移动 160 字节（整行）
    addi $t5, $t5, 160
    addi $t2, $t2, -1
    bgtz $t2, draw_row_loop3

    # 恢复 ra 并返回
    jr $ra


##############################################################################
# Game loop
##############################################################################
game_loop:
  ################################
  #加速下落
  ################################
  la $s0, frame_counter   
  la $a0, gravity_interval
  lw $a1, 0($a0)
  la $a2, interval_counter
  lw $t9, 0($a2)
  
  lw $s1, 0($s0)             # $s1 = 当前帧数
  addi $s1, $s1, 1             # 帧数 +1
  sw $s1, 0($s0)             # 更新当前的帧数
  
  addi $t9, $t9, 1
  sw $t9, 0($a2)
  
  bne $t9, 150 no_update

##########################################
#update new gravity
##########################################
update_gravity:
  subi $a1, $a1, 6
  sw $a1, 0($a0)
  ble $a1, 1, remain_a1

remain_a1:
  li $a1, 1
  
 
no_update:
  # li   $s2, 30              # 每 30 帧自动下落
  div $s1, $a1
  mfhi $s2
  
  bne $s2, $zero, skip_gravity_drop
 

 #######
 #重力下落
  jal print_black             # 擦除当前胶囊
  li $t3, 0x73               # 模拟按下s
  jal collision              
  jal respond_to_S           
  jal redraw_capsule          

skip_gravity_drop:

  jal check_input
  jal check_key
  jal collision
  jal update_input_WASD
  jal redraw_capsule
  jal sleep
  j j_back
