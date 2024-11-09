color=$(xcolor) && echo -n "$color" | xclip -selection clipboard && notify-send "Color copied to clipboard" "$color"
