from libqtile.config import Key, Group
from libqtile.command import lazy
from .keys import keys, mod

groups = []
groups.append(Group("WWW"))
groups.append(Group("TERM", spawn="alacritty"))
groups.append(Group("DOCS"))
groups.append(Group("ETC"))
groups.append(Group("KPXC", spawn="keepassxc"))

for i, group in enumerate(groups):
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod],
            str(i + 1),
            lazy.group[group.name].toscreen(),
            desc="Switch to group {}".format(group.name)),
        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"],
            str(i + 1),
            lazy.window.togroup(group.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(group.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])
