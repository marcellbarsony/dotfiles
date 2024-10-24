# Firefox setup

## Install

Install dependencies

```sh
sudo pacman -S firefox pipewire-jack
```

## Sign in

1. Sign in to Firefox

2. Sign in to Containers & enable sync

3. Wait until settings & plugin sync

4. **Terminate Firefox**

## Containers

- Overwrite `containers.json` at `~/.mozilla/firefox/<user_profile>`

- Add the Site List from `containers-site-list.js`

## Preferences

### ArkenFox

1. Clone the [ArkenFox repository](https://github.com/arkenfox/user.js)

2. Copy `updater.sh`, `user.js` and `user-overrides.js` to `~/.mozilla/firefox/<user_profile>/`

```
cp updater.sh user.js user-overrides.js ~/.mozilla/firefox/<user_profile>/
```

3. Run `updater.sh`

```sh
./updater.sh
```

### BetterFox

1. Download BetterFox's [user.js](https://github.com/yokoffing/Betterfox/blob/main/user.js)

2. Copy `user.js` to `~/.mozilla/firefox/<user_profile>/`

3. Add the overrides from `user-overrides.js`

## Custom CSS

- Copy the `chrome/` directory under `~/.mozilla/firefox/<user_profile>/`

## Colors

- If not automatically synced, import the custom color theme from `colors/` via `https://color.firefox.com/`
- Load Add-on via `about:debugging#/runtime/this-firefox` by clicking `Load Temporary Add-on...`

## Extensions

Add extension config:
- uBlock Origin
- Tab Session Manager
- FoxyProxy
