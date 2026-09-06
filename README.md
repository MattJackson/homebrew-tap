# homebrew-tap

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

Homebrew tap for [@MattJackson](https://github.com/MattJackson)'s tools. Formulae
here are updated automatically by each project's release workflow.

## Usage

```sh
brew tap MattJackson/tap
brew install <formula>
```

…or install directly without tapping first:

```sh
brew install MattJackson/tap/<formula>
```

## Formulae

| Formula | Description | Platforms | Project |
| --- | --- | --- | --- |
| `fwext` | Generic firmware extractor: any vendor download in → raw firmware `.bin` + JSON label out | macOS (arm64/Intel), Linux | [firmware-extractor](https://github.com/MattJackson/firmware-extractor) |
| `claude-usage` | Claude Max usage across accounts from the menu bar, with instant switch and auto-swap | macOS | [claude-usage](https://github.com/MattJackson/claude-usage) |

```sh
brew install MattJackson/tap/fwext
brew install MattJackson/tap/claude-usage
```

Upgrades come through Homebrew: `brew upgrade <formula>`.

## License

MIT © Matthew Jackson. See [LICENSE](LICENSE).
