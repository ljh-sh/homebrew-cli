# homebrew-macli

Custom Homebrew tap for [`macli`](https://github.com/ljh-sh/macli) — macOS system tools CLI.

## Install

```sh
brew tap ljh-sh/macli
brew install macli
```

Or one-liner:

```sh
brew install ljh-sh/macli/macli
```

## What is macli?

**macli 只做 Python / shell 做不到的事** —— HID/IOKit 私有 API、反向工程协议、高频轮询、跨进程批量调用。

不是"所有 macOS 工具的合集"。能做的事归到对应层：

| 层 | 工具 | 范围 |
|---|------|------|
| Shell / Python 脚本 | [`x-bash/mac`](https://github.com/x-bash/mac) | subprocess + CLI + PyObjC + osascript 能搞定的 |
| **原生二进制** | **[`macli`](https://github.com/ljh-sh/macli)** | 私有框架、HID/IOKit/kext 通信、反向工程协议、高频轮询 |

## Subcommands

- `smc` — Apple Silicon SMC sensors (HID)
- `smc86` — Intel SMC sensors (legacy, sunset track)
- `monitor` — Streaming TSV monitor (single process, all metric sources)
- `cal` / `event` / `reminder` / `aka` — EventKit
- `notify` / `speak` / `speech` — notifications / TTS / speech recognition

## Quick start

```sh
# Sample temperatures
macli smc temp --tsv | head -5

# Stream metrics at 1Hz to awk
macli monitor --metrics smc_temp | awk -F'\t' 'NR>1 {sum+=$2; n++} END {print "avg:", sum/n}'

# All sensors as JSON
macli smc all
```

## Code signature

macli is **ad-hoc signed** (not Apple Developer ID). The Formula's `post_install` removes the quarantine attribute so Gatekeeper doesn't prompt on first run.

If you still see a Gatekeeper warning, run manually:

```sh
xattr -dr com.apple.quarantine "$(brew --prefix)/bin/macli"
```

## Update

Formula is synced automatically on each new macli release via [brew-tap-sync.yml](https://github.com/ljh-sh/macli/blob/main/.github/workflows/brew-tap-sync.yml) workflow.

Manual update:

```sh
brew update
brew upgrade macli
```

## License

MIT — same as [macli](https://github.com/ljh-sh/macli/blob/main/LICENSE.txt).
