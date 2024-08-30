# Default programs
$env.BROWSER = "Firefox"
$env.EDITOR = "nvim"
$env.TERMINAL = "alacritty"
$env.VISUAL = "nvim"
$env.WM = "qtile"

# Language
$env.LANG = en_US.UTF-8
$env.LC_CTYPE = en_US.UTF-8

# XDG
$env.XDG_APP_HOME = "$HOME/.local/share/applications"
$env.XDG_BIN_HOME = "$HOME/.local/bin"
$env.XDG_CACHE_HOME = "$HOME/.cache"
$env.XDG_CONFIG_HOME = "$HOME/.config"
$env.XDG_DATA_DIRS = "/usr/local/share:/usr/share"
$env.XDG_DATA_HOME = "$HOME/.local/share"
$env.XDG_FONT_HOME = "$HOME/.local/share/fonts"
$env.XDG_ICON_HOME = "$HOME/.local/share/icons"
$env.XDG_STATE_HOME = "$HOME/.local/state"

# Paths
$env.GNUPGHOME = "$XDG_DATA_HOME/gnupg"
$env.HISTFILE = "$XDG_STATE_HOME/zsh/history"
$env.NPM_CONFIG_USERCONFIG = "$XDG_CONFIG_HOME/npm/npmrc"
$env.ZDOTDIR = "$HOME/.config/zsh/"
$env.XINITRC = "$HOME/.config/x11/"
$env.QT_QPA_PLATFORMTHEME = "qt5ct"

# Java
$env._JAVA_OPTIONS = "-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java"

# Ruby
$env.GEM_HOME = "$(ruby -e 'puts Gem.user_dir')"

# Rust
$env.CARGO_HOME = "$XDG_DATA_HOME/cargo"
$env.RUST_BACKTRACE = 1
$env.RUSTUP_HOME = "$XDG_DATA_HOME/rustup"

# Starship
$env.STARSHIP_CONFIG = "$XDG_CONFIG_HOME/starship/config.toml"
$env.STARSHIP_CACHE = "$XDG_CONFIG_HOME/starship"

# SSH
$env.SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/ssh-agent.socket"

# Sudo
$env.SUDO_PROMPT = "$(tput bold setaf 4)[sudo]$(tput sgr0) password for %p: "

# Prompt [Starship]
$env.STARSHIP_SHELL = "nu"

def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

def create_right_prompt [] {
    starship prompt --right --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = { || create_right_prompt }
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""
$env.PROMPT_MULTILINE_INDICATOR = ""

# $env.TRANSIENT_PROMPT_COMMAND = {|| "🚀 " }
# $env.TRANSIENT_PROMPT_INDICATOR = {|| "" }
# $env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = {|| "" }
# $env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = {|| "" }
# $env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = {|| "" }
# $env.TRANSIENT_PROMPT_COMMAND_RIGHT = {|| "" }

$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts')
]

$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins')
]

# Path
$env.PATH = ($env.PATH | split row (char esep) | prepend '/usr/lib/python3.10/site-packages:$PATH')
$env.PATH = ($env.PATH | split row (char esep) | prepend '$HOME/.local/bin:$PATH')
$env.PATH = ($env.PATH | split row (char esep) | prepend '$HOME/.local/share/cargo/bin:$PATH')
#$env.PATH = ($env.PATH | split row (char esep) | prepend '$PATH:GEM_HOME/bin')
