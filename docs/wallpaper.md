# Auto-Switch Desktop Wallpaper with System Theme (macOS)

This sets up a live listener that changes your desktop wallpaper the instant
macOS switches between Light and Dark mode.

## Overview

- **[dark-notify](https://github.com/cormacrelf/dark-notify)** listens for
  the system's theme-change notification and runs a command when it fires.
- A small shell script picks the right wallpaper image based on the current
  mode.
- **launchd** keeps the listener running in the background and starts it
  automatically at login.

## 1. Install dark-notify

```bash
brew install cormacrelf/tap/dark-notify
```

This is a separate Homebrew tap, so plain `brew install dark-notify` will
not work.

Confirm the install path:

```bash
which dark-notify
```

Note this path — you'll need it in step 4. It's usually one of:

- Apple Silicon: `/opt/homebrew/bin/dark-notify`
- Intel: `/usr/local/bin/dark-notify`

## 2. Prepare your wallpapers

Save a light and a dark image somewhere permanent, e.g.:

```
~/.dotfiles/assets/wallpapers/light.png
~/.dotfiles/assets/wallpapers/dark.jpg
```

## 3. Add the wallpaper-switch script

Save this as `~/.dotfiles/scripts/toggle-wallpaper.sh`:

```bash
#!/bin/bash

# Read the current system appearance
mode=$(defaults read -g AppleInterfaceStyle 2>/dev/null)

if [ "$mode" == "Dark" ]; then
  wallpaper="$HOME/.dotfiles/assets/wallpapers/dark.jpg"
else
  wallpaper="$HOME/.dotfiles/assets/wallpapers/light.png"
fi

osascript -e "tell application \"System Events\" to set picture of every desktop to \"$wallpaper\""
```

Make it executable:

```bash
chmod +x ~/.dotfiles/scripts/toggle-wallpaper.sh
```

Re-run `chmod +x` after any fresh clone of your dotfiles repo — cloning
does not reliably preserve the executable bit.

## 4. Create the launchd agent

Save this as `~/.dotfiles/launchagents/com.user.darknotify.plist`
(or wherever you keep versioned dotfiles config):

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
  "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>com.user.darknotify</string>

  <key>ProgramArguments</key>
  <array>
    <!-- Replace with your `which dark-notify` output if different -->
    <string>/opt/homebrew/bin/dark-notify</string>
    <string>-c</string>
    <string>/Users/YOUR_USERNAME/.dotfiles/scripts/toggle-wallpaper.sh</string>
  </array>

  <key>RunAtLoad</key>
  <true/>

  <key>KeepAlive</key>
  <true/>

  <key>StandardOutPath</key>
  <string>/tmp/dark-notify.log</string>

  <key>StandardErrorPath</key>
  <string>/tmp/dark-notify.error.log</string>
</dict>
</plist>
```

Before moving on:

- Replace `YOUR_USERNAME` with your actual username (`~` is not expanded
  inside a launchd plist).
- Replace the `dark-notify` path if `which dark-notify` returned something
  different in step 1.

## 5. Symlink the plist into LaunchAgents

```bash
mkdir -p ~/Library/LaunchAgents
ln -s ~/.dotfiles/launchagents/com.user.darknotify.plist \
  ~/Library/LaunchAgents/com.user.darknotify.plist
```

Symlinking (rather than copying) keeps the plist version-controlled with
the rest of your dotfiles while still working exactly like a direct copy —
launchd follows the symlink fine.

`~/Library/LaunchAgents` is for per-user services that start at login.
This is distinct from `/Library/LaunchDaemons`, which is for system-wide
services that run even when no one is logged in.

## 6. Load and test

```bash
launchctl load ~/Library/LaunchAgents/com.user.darknotify.plist
```

This starts the listener immediately and registers it to run at every
future login.

Toggle Light/Dark mode in **System Settings > Appearance** and confirm
the wallpaper switches. If it doesn't fire, check the logs:

```bash
cat /tmp/dark-notify.error.log
```

## Managing the service

Stop the listener:

```bash
launchctl unload ~/Library/LaunchAgents/com.user.darknotify.plist
```

After editing the script or the plist, reload it for changes to take
effect:

```bash
launchctl unload ~/Library/LaunchAgents/com.user.darknotify.plist
launchctl load ~/Library/LaunchAgents/com.user.darknotify.plist
```

## Notes

- `dark-notify` was chosen over the older `bouk/dark-mode-notify`, which is
  no longer maintained. `dark-notify` is still actively used and
  recommended as of mid-2025.
- The wallpaper script targets every display and every Space. If you use
  multiple displays with different wallpapers per display, the script
  needs to be adjusted.
