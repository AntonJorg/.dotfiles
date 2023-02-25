import os
from libqtile import bar
from libqtile.config import Screen
from .keys import terminal
from .widgets import *
from .colors import nord

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(padding=3, linewidth=0, background=nord[0]),
                widget.Image(
                    filename="~/.config/qtile/eos-c.png",
                    margin=3,
                    background=nord[0],
                    mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn("rofi -show combi")
                    },
                ),
                widget.Sep(padding=4, linewidth=0, background=nord[0]),
                widget.GroupBox(
                    highlight_method="line",
                    this_screen_border=nord[8],
                    this_current_screen_border=nord[8],
                    active=nord[6],
                    inactive=nord[3],
                    background=nord[0],
                ),
                widget.TextBox(text="", padding=0, fontsize=28, foreground=nord[0]),
                widget.Prompt(),
                widget.Spacer(length=5),
                widget.WindowName(foreground=nord[8], fmt="{}"),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox(text="", padding=0, fontsize=28, foreground=nord[0]),
                widget.CurrentLayoutIcon(scale=0.75, background=nord[0]),
                widget.CheckUpdates(
                    update_interval=1800,
                    distro="Arch_yay",
                    display_format="{updates} Updates",
                    foreground="#ffffff",
                    mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn(terminal + " -e yay -Syu")
                    },
                    background=nord[0],
                ),
                widget.Systray(icon_size=20, background=nord[0]),
                widget.TextBox(
                    text="",
                    padding=0,
                    fontsize=28,
                    foreground=nord[0],
                ),
                widget.TextBox(text="", padding=0, fontsize=28, foreground=nord[0]),
                MyVolume(
                    fontsize=16,
                    font="Font Awesome 5 Free",
                    foreground=nord[8],
                    background=nord[0],
                    mouse_callbacks={"Button1": lambda: qtile.cmd_spawn("pavucontrol")},
                ),
                widget.TextBox(
                    text="",
                    padding=0,
                    fontsize=28,
                    foreground=nord[0],
                ),
                widget.TextBox(text="", padding=0, fontsize=28, foreground=nord[0]),
                widget.Battery(
                    format="{char} {percent:2.0%} {hour:d}:{min:02d} {watt:.2f} W",
                    background=nord[0],
                    foreground=nord[8],
                    charge_char="⚡",
                    discharge_char="",
                    full_char="=",
                    update_interval=10,
                    low_percentage=0.15,
                    low_background=nord[11],
                    low_foreground=nord[0]
                ),
                widget.TextBox(
                    text="",
                    padding=0,
                    fontsize=28,
                    foreground=nord[0],
                ),
                widget.TextBox(text="", padding=0, fontsize=28, foreground=nord[0]),
                widget.Clock(
                    format=" %a %d-%m-%Y %H:%M ",
                    background=nord[0],
                    foreground=nord[8],
                ),
                widget.TextBox(
                    text="",
                    padding=0,
                    fontsize=28,
                    foreground=nord[0],
                ),
                widget.TextBox(
                    text="",
                    mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn(
                            os.path.expanduser("~/.config/rofi/powermenu.sh")
                        )
                    },
                    foreground=nord[8],
                ),
            ],
            30,  # height in px
            background=nord[1],  # background color
        ),
    ),
]
