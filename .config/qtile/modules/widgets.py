import subprocess
from libqtile import widget
from libqtile.log_utils import logger

colors = [
    ["#282c34", "#282c34"],  # panel background
    ["#3d3f4b", "#434758"],  # background for current screen tab
    ["#ffffff", "#ffffff"],  # font color for group names
    ["#ff5555", "#ff5555"],  # border line color for current tab
    [
        "#74438f",
        "#74438f",
    ],  # border line color for 'other tabs' and color for 'odd widgets'
    ["#4f76c7", "#4f76c7"],  # color for the 'even widgets'
    ["#e1acff", "#e1acff"],  # window name
    ["#ecbbfb", "#ecbbfb"],  # backbround for inactive screens
]


widget_defaults = dict(
    font="Cantarell",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()


class MyVolume(widget.Volume):
    def _configure(self, qtile, bar):
        super()._configure(qtile, bar)
        self.device = "pulse"
        self.volume = self.get_volume()
        if self.volume <= 0:
            self.text = " X"
        else:
            self.text = f"  {self.volume:d}"
        # drawing here crashes Wayland

    def _update_drawer(self, wob=False):
        if self.volume <= 0:
            self.text = " X"
        else:
            self.text = f"  {self.volume:d}"
        self.draw()

        if wob:
            with open(self.wob, "a") as f:
                f.write(str(self.volume) + "\n")


class KeyboardMap(widget.TextBox):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.text = "DK"
        self.add_callbacks({"Button1": self.switch})
        self.switch()

    def _configure(self, qtile, bar):
        super()._configure(qtile, bar)

    def switch(self):
        self.text = "US" if self.text == "DK" else "DK"
        subprocess.run(["setxkbmap", self.text.lower()])
        self.draw()
