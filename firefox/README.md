# Firefox setup

### Install

Install dependencies

```sh
sudo pacman -S firefox pipewire-jack
```

### Sign in

1. Sign in to Firefox

2. Sign in to Containers & enable sync

3. Wait until settings & plugin sync

4. **Terminate Firefox**

### Containers

- Copy `containers.json` to `~/.mozilla/firefox/<user_profile>`

### Custom CSS

- Copy `chrome/` to `~/.mozilla/firefox/<user_profile>`

### Preferences [ArkenFox]

- Clone the [ArkenFox repository](https://github.com/arkenfox/user.js)

- Copy `updater.sh`, `user.js` and `user-overrides.js` to `~/.mozilla/firefox/<user_profile>/`

```
cp updater.sh user.js user-overrides.js ~/.mozilla/firefox/<user_profile>/
```

- Run 'updater.sh'

```sh
./updater.sh
```
