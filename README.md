# ljh-sh/homebrew-cli

Custom Homebrew tap for [`ljh-sh`](https://github.com/ljh-sh) CLI tools.

## Formulae

| Formula | Source | Description |
|---------|--------|-------------|
| `macli`     | [`ljh-sh/macli`](https://github.com/ljh-sh/macli)         | macOS system tools CLI — only what shell / Python can't do |
| `maclisten` | [`ljh-sh/maclisten`](https://github.com/ljh-sh/maclisten) | Lightweight macOS ASR CLI |
| `roff`      | [`ljh-sh/roff`](https://github.com/ljh-sh/roff)           | Skillful man page to JSON / Markdown converter |

## Install

Homebrew auto-taps when you use the `user/tap/formula` shorthand, so a separate `brew tap` is optional:

```sh
brew install ljh-sh/cli/macli
brew install ljh-sh/cli/maclisten
brew install ljh-sh/cli/roff
```

If Homebrew 6 asks you to trust the tap first:

```sh
brew trust ljh-sh/cli
```

## Update

```sh
brew update
brew upgrade ljh-sh/cli/macli
brew upgrade ljh-sh/cli/maclisten
brew upgrade ljh-sh/cli/roff
```

## Code signature

`macli` and `maclisten` ship with ad-hoc signatures (not Apple Developer IDs). Each formula removes the quarantine attribute in `post_install` so Gatekeeper doesn't prompt on first run. If you still see a warning:

```sh
xattr -dr com.apple.quarantine "$(brew --prefix)/bin/macli"
xattr -dr com.apple.quarantine "$(brew --prefix)/bin/maclisten"
```

## Formulae details

Each formula in this tap packages a single upstream CLI project. Pick the one that fits your workflow.

### macli

[Homepage](https://github.com/ljh-sh/macli) · [Docs](https://ljh-sh.github.io/macli)

A minimal macOS system-tools CLI for shell scripts and AI agents. It talks directly to native Apple frameworks (SMC, IOKit, EventKit, etc.) and prints structured JSON/TSV, so you don't have to parse `ioreg` or `osascript` output.

- Read CPU/GPU temperatures, display brightness, GPU info.
- Stream sensor samples (`macli monitor`) into awk or jq.
- Export calendars and reminders as JSON.
- One ~400 KB Swift binary, no Python runtime, no GUI.

```sh
brew install ljh-sh/cli/macli
```

Quick start:

```sh
macli smc temp            # CPU/GPU temps
macli monitor --count 10  # stream 10 sensor samples
macli cal ls              # list calendars as JSON
```

### maclisten

[Homepage](https://github.com/ljh-sh/maclisten) · [Docs](https://ljh-sh.github.io/maclisten)

A lightweight macOS ASR (automatic speech recognition) CLI built on `Speech`, `AVFoundation`, and `AppKit`. Useful for transcribing files or microphone input from the terminal, with compact JSON output.

- Transcribe audio files with `maclisten file <path>`.
- Record and transcribe microphone input with `maclisten mic`.
- Continuous listening mode `maclisten watch` with optional keyword filter.
- Save recorded microphone audio to WAV (16 kHz, 16-bit, mono) with `--output`.
- Runs on-device when available; respects macOS speech/microphone TCC permissions.

```sh
brew install ljh-sh/cli/maclisten
```

Quick start:

```sh
maclisten mic --locale zh-CN --partial          # live mic transcription
maclisten watch --keyword "hey mac" --output out.wav
maclisten file meeting.m4a --locale en-US
```

### roff

[Homepage](https://github.com/ljh-sh/roff) · [crates.io](https://crates.io/crates/roff-cli)

A skillful `roff`/`mdoc` to JSON / Markdown converter. Handy for documentation pipelines, LLM context windows, or reading man pages without a pager.

- Convert man pages to structured JSON or readable Markdown.
- Expand `.so` includes, benchmark parser throughput.
- Cross-platform Rust binary; also installable via `cargo install roff-cli`.

```sh
brew install ljh-sh/cli/roff
```

Quick start:

```sh
roff tojson file.1    # structured JSON
roff tomd file.1      # readable Markdown
roff view --meta ls   # progressive disclosure view
```

## License

Each formula follows the license of its upstream project.
