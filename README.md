# Homebrew tap for Patched

[Patched](https://patched.im) is a free, open source Mac app updater. Source: [birdseeed/patched](https://github.com/birdseeed/patched).

```sh
brew install --cask birdseeed/patched/patched
```

Patched needs a Mac with Apple silicon and macOS 13 or later. Releases are signed with a Developer ID (Team ID `Y9352JY7U8`) and notarised by Apple. Patched updates itself when you choose Update in its menu, so the cask is marked `auto_updates`; `brew upgrade --greedy` also works.

The cask installs the `patched` command-line tool as well. `brew uninstall --zap --cask patched` also removes Patched's catalogue, journals, backups and caches.
