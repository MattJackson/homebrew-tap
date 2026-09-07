# homebrew-tap

[![Sponsor](https://img.shields.io/badge/Sponsor-%E2%9D%A4-ea4aaa?logo=github-sponsors)](https://github.com/sponsors/MattJackson)

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
| `usagio` | Every AI coding CLI's usage from the menu bar, instant switch, auto-swap (renamed from `claude-usage`) | macOS | [usagio](https://github.com/MattJackson/usagio) |
| `claude-usage` (deprecated) | Deprecated alias — installs `usagio` transitively | macOS | [usagio](https://github.com/MattJackson/usagio) |

```sh
brew install MattJackson/tap/fwext
brew install MattJackson/tap/usagio
```

Upgrades come through Homebrew: `brew upgrade <formula>`.

## License

MIT © Matthew Jackson. See [LICENSE](LICENSE).
