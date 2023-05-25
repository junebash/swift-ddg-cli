# ddg-cli

A DuckDuckGo CLI written in Swift.

## Requirements

- macOS (probably won't get around to supporting other platforms)
- Swift

## Install

If you have [`just`](https://github.com/casey/just) installed:

```bash
[clone repo]
cd [git repo path]
just install [desired $PATH directory]
```

e.g.,

```bash
git clone https://github.com/junebash/swift-ddg-cli
cd swift-ddg-cli
just install ~/my_path
```

If you don't provide a PATH, it will install to `~/.bin/` by default

---

If you don't have `just installed`,

1. `cd` into git repo directory
2. `swift build`
3. Find `ddg` binary somewhere in `.build` folder
4. Move binary somewhere in shell path
5. Call `ddg [query]`

## Usage

`ddg Swift programming language -g`

Note that `-` replaces `!` for DuckDuckGo bang operators.
