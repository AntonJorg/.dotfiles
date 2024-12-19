from libqtile.config import DropDown, Key, Group, ScratchPad
from libqtile.lazy import lazy
from .keys import keys, mod

DROPDOWN_POSITION = {"x": 0.05, "y": 0.05, "width": 0.9, "height": 0.9}

groups = [
    Group("WWW"),
    Group("CODE"),
    Group("TERM"),
    Group("DOCS"),
    Group("ETC"),
    Group("KPXC", spawn="keepassxc"),
    ScratchPad(
        "0",
        [
            DropDown(
                "chatgpt",
                "surf -z 1.4 https://chat.openai.com",
                opacity=0.8,
                **DROPDOWN_POSITION,
            ),
            DropDown(
                "thunderbird",
                "thunderbird",
                on_focus_lost_hide=False,
                **DROPDOWN_POSITION,
            ),
        ],
    ),
]

keys.append(
    Key(
        [mod],
        "n",
        lazy.group["0"].dropdown_toggle("chatgpt"),
        desc="Toggle ChatGPT overlay.",
    )
)

keys.append(
    Key(
        [mod],
        "m",
        lazy.group["0"].dropdown_toggle("thunderbird"),
        desc="Toggle Thunderbird overlay.",
    )
)

for i, group in enumerate(groups):
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                str(i + 1),
                lazy.group[group.name].toscreen(),
                desc="Switch to group {}".format(group.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            # Key([mod, "shift"],
            #    str(i + 1),
            #    lazy.window.togroup(group.name, switch_group=True),
            #    desc="Switch to & move focused window to group {}".format(group.name)),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            Key(
                [mod, "shift"],
                str(i + 1),
                lazy.window.togroup(group.name),
                desc="move focused window to group {}".format(group.name),
            ),
        ]
    )
