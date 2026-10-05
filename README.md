# mah3uz/tap

A [Homebrew](https://brew.sh) tap for two programs: insensical and quarry.

You don't need to add the tap first. Naming it in the install line is enough:

```sh
brew install --cask mah3uz/tap/insensical
brew install mah3uz/tap/quarry
```

## What's here

| | What it is | Install |
|---|---|---|
| [insensical](https://insensical.com) | A terminal multiplexer with a native window, for running many terminals and coding agents and knowing which one needs you | `brew install --cask mah3uz/tap/insensical` |
| [quarry](https://quarry.asmechanics.com) | A fast SQL client and TUI for PostgreSQL, MySQL / MariaDB and SQLite | `brew install mah3uz/tap/quarry` |

### insensical

A cask, for macOS 13 and later on Apple silicon. It installs `insensical.app`, puts
the `isc` command on your `PATH`, and adds completions for bash, zsh and fish.

The app isn't signed with an Apple Developer ID or notarised. macOS won't open a
downloaded app like that until its quarantine flag is cleared, and the cask clears it
for you, so there's nothing to type after installing.

If you installed an early copy with `brew tap mah3uz/insensical …`, that tap is gone.
Remove it and install from here:

```sh
brew untap mah3uz/insensical
brew install --cask mah3uz/tap/insensical
```

### quarry

A formula, for macOS and for Linux with Homebrew. On macOS 15 on Apple silicon it
installs a prebuilt bottle. Anywhere else Homebrew builds it from source, which needs
Rust and takes a few minutes; Homebrew installs Rust for the build itself.

It installs the `quarry` command and its shell completions.

## Updating and removing

```sh
brew update
brew upgrade --cask insensical
brew upgrade quarry
```

```sh
brew uninstall --cask insensical
brew uninstall quarry
```

## Something wrong?

A problem with one of the programs belongs with that program: see its site above.
A problem with installing it from this tap can be reported
[here](https://github.com/mah3uz/homebrew-tap/issues).
