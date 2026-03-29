# magebox

Oh-My-Zsh plugin for [magebox](https://magebox.dev/) — a modern development environment for Magento 2 and MageOS.

Provides aliases, a cache-flush helper, prompt status indicator, and cached tab completion for the `magebox` CLI.

## Installation

### Oh-My-Zsh

1. Clone into your custom plugins directory:

   ```sh
   git clone https://github.com/jcombee/ohmyzsh-magebox.git \
     ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/magebox
   ```

2. Add `magebox` to your plugin list in `~/.zshrc`:

   ```zsh
   plugins=(... magebox)
   ```

3. Restart your shell or run `source ~/.zshrc`.

> **Note:** [magebox](https://magebox.dev/) must be installed for the plugin to activate.

## Aliases

### Core

| Alias  | Command              |
|--------|----------------------|
| `mb`   | `magebox`            |
| `mbs`  | `magebox start`      |
| `mbst` | `magebox stop`       |
| `mbrs` | `magebox restart`    |
| `mbss` | `magebox status`     |
| `mbsh` | `magebox shell`      |
| `mbo`  | `magebox open`       |
| `mbl`  | `magebox list`       |
| `mbck` | `magebox check`      |
| `mbn`  | `magebox new`        |
| `mbsu` | `magebox self-update`|

### Database

| Alias   | Command                |
|---------|------------------------|
| `mbd`   | `magebox db`           |
| `mbdi`  | `magebox db import`    |
| `mbde`  | `magebox db export`    |
| `mbds`  | `magebox db shell`     |
| `mbdr`  | `magebox db reset`     |
| `mbdsn` | `magebox db snapshot`  |
| `mbdt`  | `magebox db top`       |

### Logs

| Alias    | Command              |
|----------|----------------------|
| `mblog`  | `magebox logs`       |
| `mblogf` | `magebox logs -f`    |
| `mblogp` | `magebox logs php`   |
| `mblogn` | `magebox logs nginx` |
| `mblogm` | `magebox logs mysql` |

### Testing

| Alias   | Command                   |
|---------|---------------------------|
| `mbt`   | `magebox test`            |
| `mbtu`  | `magebox test unit`       |
| `mbti`  | `magebox test integration`|
| `mbtcs` | `magebox test phpcs`      |
| `mbtst` | `magebox test phpstan`    |
| `mbta`  | `magebox test all`        |

### PHP

| Alias   | Command               |
|---------|-----------------------|
| `mbphp` | `magebox php`         |
| `mbei`  | `magebox ext install`  |
| `mbel`  | `magebox ext list`     |

### Xdebug

| Alias    | Command                |
|----------|------------------------|
| `mbxon`  | `magebox xdebug on`    |
| `mbxoff` | `magebox xdebug off`   |
| `mbxs`   | `magebox xdebug status`|

### Varnish

| Alias  | Command                   |
|--------|---------------------------|
| `mbv`  | `magebox varnish`         |
| `mbve` | `magebox varnish enable`  |
| `mbvd` | `magebox varnish disable` |
| `mbvf` | `magebox varnish flush`   |
| `mbvs` | `magebox varnish status`  |

### Redis

| Alias   | Command              |
|---------|----------------------|
| `mbrf`  | `magebox redis flush` |
| `mbri`  | `magebox redis info`  |
| `mbrsh` | `magebox redis shell` |

### SSL / Domain

| Alias   | Command                |
|---------|------------------------|
| `mbssl` | `magebox ssl generate` |
| `mbda`  | `magebox domain add`   |
| `mbdl`  | `magebox domain list`  |

### Config

| Alias   | Command              |
|---------|----------------------|
| `mbcf`  | `magebox config show` |
| `mbcfs` | `magebox config set`  |

### Sync

| Alias     | Command        |
|-----------|----------------|
| `mbsync`  | `magebox sync` |
| `mbfetch` | `magebox fetch`|

## Functions

| Function              | Description                                              |
|-----------------------|----------------------------------------------------------|
| `mbflush`             | Flush all caches — Redis, Varnish (if enabled), and Magento `cache:flush` |
| `magebox_prompt_info` | Prompt segment showing running/stopped status |

## Prompt Status

The plugin exposes a `magebox_prompt_info` function that shows the current magebox project status in your prompt. When you `cd` into a magebox project (or any subdirectory up to 5 levels deep), it displays:

- **Green** — `mb:(▶)`
- **Red** — `mb:(■)`
- **Hidden** — not inside a magebox project

### Setup

Add `$(magebox_prompt_info)` to your `PROMPT` or `RPROMPT`. For example, with the default robbyrussell theme, add to your `~/.zshrc` after oh-my-zsh is sourced:

```zsh
PROMPT+=' $(magebox_prompt_info)'
```

Or use it in `RPROMPT` to keep it on the right side:

```zsh
RPROMPT='$(magebox_prompt_info)'
```

The detection is file-based (checks for `.magebox.yaml` and PHP-FPM sockets) so it adds no noticeable latency to your prompt.

## Tab Completion

The plugin automatically caches the output of `magebox completion zsh` and refreshes it in the background on each shell startup. No manual setup needed.

## Requirements

- [Oh-My-Zsh](https://ohmyz.sh/)
- [magebox](https://magebox.dev/) installed and in your `$PATH`

## License

MIT
