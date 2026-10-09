# cmaldonadowilson/tap

Homebrew formulae from [cmaldonadowilson](https://github.com/cmaldonadowilson).

## Week HP

[Week HP for macOS](https://github.com/cmaldonadowilson/week-hp-macos): a retro
health bar in the menu bar that fills up from Monday to Friday.

```bash
brew install cmaldonadowilson/tap/week-hp
brew services start week-hp   # open it now and at every login
```

It is built from source, so the Command Line Tools are needed
(`xcode-select --install`), as for most of Homebrew.

To remove it:

```bash
brew services stop week-hp
brew uninstall week-hp
brew untap cmaldonadowilson/tap
```
