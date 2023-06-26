# Firefox setup

### Install

- Install Firefox

```
sudo pacman -S firefox pipewire-jack
```

### 1.Sign in

- Sign in to Firefox

- Sign in to containers (enable sync)

- Terminate Firefox

### 2. Preferences

- Append `preferences.js` to `~/.mozilla/firefox/<user_profile>/prefs.js`

### 3. Hardening [ArkenFox]

- Clone the [ArkenFox repository](https://github.com/arkenfox/user.js)

- Terminate Firefox

- Copy `updater.sh`, `user.js` and `user-overrides.js` to `~/.config/mozilla/firefox/<user_profile>/`

```
cp updater.sh user.js user-overrides.js ~/.config/mozills/<user_profile>/
```

- Run 'updater.sh'

```
updater.sh
```
