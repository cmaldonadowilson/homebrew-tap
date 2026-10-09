# cmaldonadowilson/tap

Homebrew formulae from [cmaldonadowilson](https://github.com/cmaldonadowilson).

## Week HP

[Week HP for macOS](https://github.com/cmaldonadowilson/week-hp-macos): a retro
health bar in the menu bar that fills up from Monday to Friday.

```bash
brew install cmaldonadowilson/tap/week-hp
brew services start week-hp   # open it now and at every login
```

On macOS 15 or later it installs a prebuilt bottle. On macOS 13 and 14 it is
built from source, which needs the Command Line Tools (`xcode-select --install`).

To remove it:

```bash
brew services stop week-hp
brew uninstall week-hp
brew untap cmaldonadowilson/tap
```

## Publishing bottles

1. Open a pull request that changes the formula, e.g. a new `url` and `sha256`.
   The `brew test-bot` workflow builds the bottles on macOS 15 (Apple Silicon
   and Intel).
2. When its checks pass, run the `brew pr-pull` workflow with the pull request
   number, from the Actions tab or with
   `gh workflow run publish.yml -f pull_request=<number>`.
   It uploads the bottles to a release of this repository, adds them to the
   formula and pushes the result to `main`.
