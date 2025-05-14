hyprshot -m region -s -o ~/.cache/ -f text.png
tesseract ~/.cache/text.png - -l eng+rus | wl-copy
