import os
from libqtile import qtile, bar
from libqtile.config import Screen
from .keys import terminal
from .widgets import *
from .colors import colors

battery_widgets = [
    widget.TextBox(text="", padding=0, fontsize=28, foreground=colors.bg_dark),
    widget.Battery(
        format="{char} {percent:2.0%} {hour:d}:{min:02d} {watt:.2f} W",
        background=colors.bg_dark,
        foreground=colors.main,
        charge_char="⚡",
        discharge_char="",
        full_char="=",
        update_interval=10,
        low_percentage=0.15,
        low_background=colors.error,
        low_foreground=colors.bg_dark
    ),
    widget.TextBox(
        text="",
        padding=0,
        fontsize=28,
        foreground=colors.bg_dark,
    )
] if os.path.isfile("/sys/class/power_supply/BAT1/status") else []


kb_map = KeyboardMap()


screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(padding=3, linewidth=0, background=colors.bg_dark),
                # widget.Image(
                #     filename="~/.config/qtile/eos-c.png",
                #     margin=3,
                #     background=colors.bg_dark,
                #     mouse_callbacks={
                #         "Button1": lambda: qtile.cmd_spawn("rofi -show combi")
                #     },
                #),
                widget.Sep(padding=4, linewidth=0, background=colors.bg_dark),
                widget.GroupBox(
                    background=colors.bg_dark,
                    highlight_method="line",
                    this_screen_border=colors.main,
                    this_current_screen_border=colors.main,
                    active=colors.main,
                    inactive=colors.light
                ),
                widget.TextBox(text="", padding=0, fontsize=28, foreground=colors.bg_dark),
                widget.Prompt(),
                widget.Spacer(length=5),
                widget.WindowName(foreground=colors.main, fmt="{}"),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox(text="", padding=0, fontsize=28, foreground=colors.bg_dark),
                KeyboardMap(
                    foreground=colors.main,
                    background=colors.bg_dark
                ),
                widget.TextBox(
                    text="",
                    padding=0,
                    fontsize=28,
                    foreground=colors.bg_dark,
                ),
                widget.TextBox(text="", padding=0, fontsize=28, foreground=colors.bg_dark),
                widget.CheckUpdates(
                    update_interval=1800,
                    distro="Arch_yay",
                    display_format="{updates} Updates",
                    foreground="#ffffff",
                    mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn(terminal + " -e yay -Syu")
                    },
                    background=colors.bg_dark
                ),
                widget.CurrentLayoutIcon(scale=0.75, background=colors.bg_dark),
                widget.Systray(icon_size=20, background=colors.bg_dark),
                widget.TextBox(
                    text="",
                    padding=0,
                    fontsize=28,
                    foreground=colors.bg_dark,
                ),
                *battery_widgets,
                widget.TextBox(text="", padding=0, fontsize=28, foreground=colors.bg_dark),
                MyVolume(
                    fontsize=16,
                    font="Font Awesome 5 Free",
                    foreground=colors.main,
                    background=colors.bg_dark,
                    mouse_callbacks={"Button1": lambda: qtile.cmd_spawn("pavucontrol")},
                ),
                widget.TextBox(
                    text="",
                    padding=0,
                    fontsize=28,
                    foreground=colors.bg_dark,
                ),
                widget.TextBox(text="", padding=0, fontsize=28, foreground=colors.bg_dark),
                widget.Clock(
                    format=" %a %d-%m-%Y %H:%M ",
                    foreground=colors.main,
                    background=colors.bg_dark
                ),
                widget.TextBox(
                    text="",
                    padding=0,
                    fontsize=28,
                    foreground=colors.bg_dark,
                ),
                widget.TextBox(
                    text="",
                    mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn(
                            os.path.expanduser("~/.config/rofi/powermenu.sh")
                        )
                    },
                    foreground=colors.main,
                ),
            ],
            30,  # height in px
            background=colors.bg_light,  # background color
        ),
    ),
]
