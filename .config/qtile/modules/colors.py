from dataclasses import dataclass


@dataclass
class ColorScheme:
    bg_light: str
    bg_dark: str
    main: str
    error: str
    light: str


gruvbox = ColorScheme(
    bg_light="#282828",
    bg_dark="#1d2021",
    main="#98971a",
    error="#cc241d",
    light="#504945"
)

# set colors to desired color scheme
colors = gruvbox
