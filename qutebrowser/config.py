# base16-qutebrowser (https://github.com/theova/base16-qutebrowser)
# Base16 qutebrowser template by theova
# Gruvbox dark, hard scheme by Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)


#  base00 = "#1d2021"
base00 = "#282828"
base01 = "#3c3836"
base02 = "#504945"
base03 = "#665c54"
base04 = "#bdae93"
base05 = "#d5c4a1"
base06 = "#ebdbb2"
base07 = "#F5F5F5"
base08 = "#fb4934"
base09 = "#fe8019"
base0A = "#fabd2f"
base0B = "#b8bb26"
base0C = "#8ec07c"
base0D = "#83a598"
base0E = "#d3869b"
base0F = "#d65d0e"

# set qutebrowser colors

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
c.colors.completion.fg = base05

# Background color of the completion widget for odd rows.
c.colors.completion.odd.bg = base00

# Background color of the completion widget for even rows.
c.colors.completion.even.bg = base00

# Foreground color of completion widget category headers.
c.colors.completion.category.fg = base0A

# Background color of the completion widget category headers.
c.colors.completion.category.bg = base00

# Top border color of the completion widget category headers.
c.colors.completion.category.border.top = base01

# Bottom border color of the completion widget category headers.
c.colors.completion.category.border.bottom = base01

# Foreground color of the selected completion item.
c.colors.completion.item.selected.fg = base01

# Background color of the selected completion item.
c.colors.completion.item.selected.bg = base0A

# Top border color of the selected completion item.
c.colors.completion.item.selected.border.top = base0A

# Bottom border color of the selected completion item.
c.colors.completion.item.selected.border.bottom = base0A

# Foreground color of the matched text in the selected completion item.
c.colors.completion.item.selected.match.fg = base08

# Foreground color of the matched text in the completion.
c.colors.completion.match.fg = base0B

# Background color of disabled items in the context menu.
c.colors.contextmenu.disabled.bg = base01

# Foreground color of disabled items in the context menu.
c.colors.contextmenu.disabled.fg = base04

# Color of the scrollbar handle in the completion view.
c.colors.completion.scrollbar.fg = base05

# Color of the scrollbar in the completion view.
c.colors.completion.scrollbar.bg = base00

# Background color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.bg = base00

# Foreground color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.fg =  base05

# Background color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.bg = base0A

#Foreground color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.fg = base01

# Background color for the download bar.
c.colors.downloads.bar.bg = base00

# Color gradient start for download text.
c.colors.downloads.start.fg = base00

# Color gradient start for download backgrounds.
c.colors.downloads.start.bg = base0D

# Color gradient end for download text.
c.colors.downloads.stop.fg = base00

# Color gradient stop for download backgrounds.
c.colors.downloads.stop.bg = base0C

# Foreground color for downloads with errors.
c.colors.downloads.error.fg = base08

# Font color for hints.
c.colors.hints.fg = base00

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
c.colors.hints.bg = base0A

# Font color for the matched part of hints.
c.colors.hints.match.fg = base05

# Text color for the keyhint widget.
c.colors.keyhint.fg = base05

# Highlight color for keys to complete the current keychain.
c.colors.keyhint.suffix.fg = base05

# Background color of the keyhint widget.
c.colors.keyhint.bg = base00

# Foreground color of an error message.
c.colors.messages.error.fg = base00

# Background color of an error message.
c.colors.messages.error.bg = base08

# Border color of an error message.
c.colors.messages.error.border = base08

# Foreground color of a warning message.
c.colors.messages.warning.fg = base00

# Background color of a warning message.
c.colors.messages.warning.bg = base0E

# Border color of a warning message.
c.colors.messages.warning.border = base0E

# Foreground color of an info message.
c.colors.messages.info.fg = base05

# Background color of an info message.
c.colors.messages.info.bg = base00

# Border color of an info message.
c.colors.messages.info.border = base00

# Foreground color for prompts.
c.colors.prompts.fg = base05

# Border used around UI elements in prompts.
c.colors.prompts.border = base00

# Background color for prompts.
c.colors.prompts.bg = base00

# Background color for the selected item in filename prompts.
c.colors.prompts.selected.bg = base0A

# Foreground color of the statusbar.
c.colors.statusbar.normal.fg = base0B

# Background color of the statusbar.
c.colors.statusbar.normal.bg = base00

# Foreground color of the statusbar in insert mode.
c.colors.statusbar.insert.fg = base00

# Background color of the statusbar in insert mode.
c.colors.statusbar.insert.bg = '#b8bb26'

# Foreground color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.fg = base00

# Background color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.bg = base0F

# Foreground color of the statusbar in private browsing mode.
c.colors.statusbar.private.fg = base00

# Background color of the statusbar in private browsing mode.
c.colors.statusbar.private.bg = base01

# Foreground color of the statusbar in command mode.
c.colors.statusbar.command.fg = base05

# Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = base00

# Foreground color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.fg = base05

# Background color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.bg = base00

# Foreground color of the statusbar in caret mode.
c.colors.statusbar.caret.fg = base00

# Background color of the statusbar in caret mode.
c.colors.statusbar.caret.bg = base0A

# Foreground color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.fg = base00

# Background color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.bg = base0A

# Background color of the progress bar.
c.colors.statusbar.progress.bg = base0A

# Default foreground color of the URL in the statusbar.
c.colors.statusbar.url.fg = base05

# Foreground color of the URL in the statusbar on error.
c.colors.statusbar.url.error.fg = base08

# Foreground color of the URL in the statusbar for hovered links.
c.colors.statusbar.url.hover.fg = base05

# Foreground color of the URL in the statusbar on successful load
# (http).
c.colors.statusbar.url.success.http.fg = base05

# Foreground color of the URL in the statusbar on successful load
# (https).
c.colors.statusbar.url.success.https.fg = base05

# Foreground color of the URL in the statusbar when there's a warning.
c.colors.statusbar.url.warn.fg = base0E

# Background color of the tab bar.
c.colors.tabs.bar.bg = base00

# Color gradient start for the tab indicator.
c.colors.tabs.indicator.start = base0D

# Color gradient end for the tab indicator.
c.colors.tabs.indicator.stop = base0C

# Color for the tab indicator on errors.
c.colors.tabs.indicator.error = base08

# Foreground color of unselected odd tabs.
c.colors.tabs.odd.fg = base05

# Background color of unselected odd tabs.
c.colors.tabs.odd.bg = base00

# Foreground color of unselected even tabs.
c.colors.tabs.even.fg = base05

# Background color of unselected even tabs.
c.colors.tabs.even.bg = base00

# Background color of pinned unselected even tabs.
c.colors.tabs.pinned.even.bg = base0C

# Foreground color of pinned unselected even tabs.
c.colors.tabs.pinned.even.fg = base07

# Background color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.bg = base0B

# Foreground color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.fg = base07

# Background color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.bg = base05

# Foreground color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.fg = base00

# Background color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.bg = base05

# Foreground color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.fg = base0E

# Foreground color of selected odd tabs.
c.colors.tabs.selected.odd.fg = base05

# Background color of selected odd tabs.
c.colors.tabs.selected.odd.bg = base02

# Foreground color of selected even tabs.
c.colors.tabs.selected.even.fg = base05

# Background color of selected even tabs.
c.colors.tabs.selected.even.bg = base02

# Background color for webpages if unset (or empty to use the theme's
# color).
# c.colors.webpage.bg = base00

# ---------------------------------------------------------------

c.fonts.default_family = 'Monospace'
c.fonts.default_size = '16pt'

#  c.content.user_stylesheets = 'colors.css'

#  c.url.default_page = 'https://www.google.com/search?hl=en'
c.url.default_page = "about:blank"
c.url.start_pages = 'https://www.google.com/search?hl=en'

c.url.searchengines = {
        'DEFAULT': 'https://www.google.com/search?hl=en&q={}',
        'gg': 'https://www.google.com/search?hl=en&q={}',
        'yt': 'https://www.youtube.com/results?search_query={}',
        'st': 'https://stackoverflow.com/search?q={}',
        'aw': 'https://wiki.archlinux.org/?search={}',
        'docker': 'https://hub.docker.com/search?q={}&type=image',
}

c.completion.height = '35%'
c.completion.shrink = True
c.completion.scrollbar.padding = 0
c.completion.scrollbar.width = 0

c.tabs.show = "never"
c.tabs.favicons.scale = 0.8
c.tabs.last_close = 'close'
c.tabs.mousewheel_switching = False
c.tabs.title.format = '{audio}{index}:{current_title}'

#  c.content.user_stylesheets = 'darkmode.css'


c.auto_save.session = True
c.downloads.location.directory = "~/Downloads"
c.downloads.location.prompt = False
c.editor.command = ["alacritty", "-e", "nvim {}"]
c.hints.chars = "1234567890"
c.input.insert_mode.auto_leave = True
#  c.input.insert_mode.auto_load = True


# --------------------------------------
# Bindings
# --------------------------------------
config.bind("gi", "hint inputs")

# Tools
config.bind(",t", "devtools bottom")
config.bind(",s", "view-source")
config.bind(",!", "config-source")
config.bind(",.", "set content.user_stylesheets darkmode.css")
config.bind(",,", "set content.user_stylesheets default.css")

# Downloads
config.bind("<Space>dd", "download-open")
config.bind("<Space>dc", "download-cancel")
config.bind("<Space>dC", "download-clear")

# Messages
config.bind("<Space>mm", "messages")
config.bind("<Space>mc", "clear-messages")

# Windows
config.bind("<Space>wo", "window-only")

# Tabs
config.bind("<Space>to", "tab-only")
config.bind("<Space>tp", "tab-pin")
config.bind("<Space>tc", "tab-clone")

config.bind('<Ctrl-v>', 'leave-mode', mode='passthrough')


#  config.bind("<Meta-w>", "tab-close", mode="normal")
#  config.unbind("-")
#  config.unbind("=")
#  config.bind("z+", "zoom-in")
#  config.bind("z-", "zoom-out")
#  config.bind("zz", "zoom")
#
#  config.unbind("O")
#  config.unbind("T")
#  config.unbind("th")
#  config.unbind("tl")
#  config.bind("O", "set-cmd-text :open {url:pretty}")
#  config.bind("T", "set-cmd-text :open -t {url:pretty}")
#  config.bind("t", "set-cmd-text -s :open -t")
# --------------------------------------
