#!/usr/bin/python

from PIL import ImageColor
import sys, getopt

red_f   = .2126
green_f = .7152
blue_f  = .0722

def _luminance(v):
    v /= 255
    return v / 12.92 if v <= .03928 else ((v+.055) / 1.055)**2.4

def luminance(color):
    (r,g,b) = map(_luminance, ImageColor.getcolor(color, "RGB"))
    return red_f * r + green_f * g + blue_f * b

def main() -> int:
    if len(sys.argv) < 3: return 1

    [_,color1,color2] = sys.argv

    lum1 = luminance(color1)
    lum2 = luminance(color2)
    l1 = lum1 if lum1 > lum2 else lum2
    l2 = lum2 if lum1 > lum2 else lum1
    cr = (l1+.05) / (l2+.05)


    print(color1, lum1)
    print(color2, lum2)
    print("Contrast Ratio", cr)

    return 0

if __name__ == '__main__':
    sys.exit(main())

