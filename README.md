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

## New versions

New versions arrive on their own:

1. Publishing a release of week-hp-macos runs `brew bump` here (`autobump.yml`),
   which also runs every day. It opens a pull request with the new `url` and
   `sha256`.
2. The `brew test-bot` workflow builds the bottles on macOS 15 (Apple Silicon
   and Intel).
3. When its checks pass, the `brew pr-pull` workflow (`publish.yml`) uploads
   the bottles to a release of this repository, adds them to the formula,
   pushes the result to `main` and deletes the pull request branch.

The pull request is opened with the `HOMEBREW_TAP_TOKEN` secret, a
fine-grained personal access token for this repository (Actions, Contents and
Pull requests: read and write). With `GITHUB_TOKEN` its tests would wait for
an approval. week-hp-macos has the same secret to start `autobump.yml`.

For any other change to a formula, open a pull request by hand. When its
checks pass, run `gh workflow run publish.yml -f pull_request=<number>` (or
**brew pr-pull** in the Actions tab) to publish its bottles.
