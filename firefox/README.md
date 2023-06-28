# Firefox setup

### Install

- Install Firefox

```
sudo pacman -S firefox pipewire-jack
```

### Sign in

- Sign in to Firefox

- Sign in to containers (enable sync)

- Wait until settings & plugin sync

- Terminate Firefox

### Containers

- Copy `containers.json` to `~/.mozilla/firefox/<user_profile>

- **NOTE**: Do not edit the values in `containers.json` manually.

### Preferences [ArkenFox]

- Clone the [ArkenFox repository](https://github.com/arkenfox/user.js)

- Terminate Firefox

- Copy `updater.sh`, `user.js` and `user-overrides.js` to `~/.mozilla/firefox/<user_profile>/`

```
cp updater.sh user.js user-overrides.js ~/.mozilla/firefox/<user_profile>/
```

- Run 'updater.sh'

```
./updater.sh
```
