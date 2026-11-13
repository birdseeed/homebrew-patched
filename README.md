# Homebrew tap for Patched

[Patched](https://patched.im) is a free, open source Mac app updater. Source: [birdseeed/patched](https://github.com/birdseeed/patched).

```sh
brew trust birdseeed/patched
brew install --cask birdseeed/patched/patched
```

Homebrew only loads casks from taps you have chosen to trust, so the first command is needed once.

Patched needs a Mac with Apple silicon and macOS 13 or later. Releases are signed with a Developer ID (Team ID `Y9352JY7U8`) and notarised by Apple. Patched updates itself when you choose Update in its menu, so the cask is marked `auto_updates`; `brew upgrade --greedy` also works.

The cask installs the `patched` command-line tool as well. `brew uninstall --cask patched` removes the app and the command-line tool but keeps Patched's data, including its rollback backups (the previous version of each app it has updated). `brew uninstall --zap --cask patched` also deletes that data: the catalogue, journals, rollback backups, caches, preferences, logs and the optional scheduled check. If you want to keep the backups, copy `~/Library/Application Support/Patched/Updater/backups` somewhere first. Afterwards, remove Patched from System Settings > General > Login Items if it is still listed, and run `brew untap birdseeed/patched` to remove the tap.
