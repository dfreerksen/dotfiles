# Usage

Usage. Because I have a bad memory.

## Shell Shortcuts

| Command | Description            |
|---------|------------------------|
| `c`     | Shortcut for `clear`   |
| `h`     | Shortcut for `history` |

## Shell Extensions

| Command   | Description                    |
|-----------|--------------------------------|
| `cpwd`    | Copy current path to clipboard |

## Shell Overwrites

| Command               | Description                                               |
|-----------------------|-----------------------------------------------------------|
| `mkdir [DIRECTORY]`   | Overwrite `mkdir [DIRECTORY]` with `mkdir -p [DIRECTORY]` |
| `ping [DOMAIN OR IP]` | Overwrite `ping` with `ping -c 20`                        |

## Listing Directories

| Command | Description                                           |
|---------|-------------------------------------------------------|
| `ls`    | Color output for `ls`                                 |
| `l`     | List all files in long format, excluding hidden files |
| `ll`    | List all files in long format, including hidden files |
| `ld`    | List only directories                                 |

## Change Directory

| Command | Description                   |
|---------|-------------------------------|
| `..`    | Shortcut for `cd ..`          |
| `...`   | Shortcut for `cd ../..`       |
| `....`  | Shortcut for `cd ../../..`    |
| `.....` | Shortcut for `cd ../../../..` |

## Bundler

| Command | Description                   |
|---------|-------------------------------|
| `b`     | Shortcut for `bundle`         |
| `be`    | Shortcut for `bundle exec`    |
| `bi`    | Shortcut for `bundle install` |

## Finder Helpers

| Command     | Description                                                          |
|-------------|----------------------------------------------------------------------|
| `showall`   | Show hidden files in Finder                                          |
| `hideall`   | Hide hidden files in Finder                                          |
| `spoton`    | Enable Spotlight                                                     |
| `spotoff`   | Disable Spotlight                                                    |
| `lscleanup` | Clean up LaunchServices to remove duplicates in the “Open With” menu |

## Finder Navigation

| Command | Description                   |
|---------|-------------------------------|
| `dl`    | Shortcut for `cd ~/Downloads` |
| `dt`    | Shortcut for `cd ~/Desktop`   |

## Finder Open

| Command         | Description                               |
|-----------------|-------------------------------------------|
| `o`             | Open current directory in Finder          |
| `o [DIRECTORY]` | Open `~/my_directory` directory in Finder |

## General Helpers

| Command            | Description                         |
|--------------------|-------------------------------------|
| `reload`           | Re-source `~/.bash_profile`         |
| `mkcd [DIRECTORY]` | Create a new directory and enter it |
| `ip`               | Echo external IP                    |
| `localip`          | Echo internal IP                    |
| `path`             | Pretty print $PATH                  |

## Update Applications and Libraries

| Command  | Description                                                  |
|----------|--------------------------------------------------------------|
| `appup`  | Update OS X software from the App Store                      |
| `brewup` | Update Homebrew, upgrade packages and run cleanup            |
| `caskup` | Update Cask applications and run cleanup                     |
| `npmup`  | Update NPM, update all outdated global packages (Gulp, etc.) |
| `sysup`  | Update App Store software, Homebrew, Cask, and NPM.          |

## Code Editor

| Command           | Description                            |
|-------------------|----------------------------------------|
| `e`               | Open in default editor (NeoVim)        |
| `v`               | Open in default visualeditor (NeoVim)  |
| `vim`             | Open current directory in NeoVim       |
| `vim [DIRECTORY]` | Open [DIRECTORY] in NeoVim             |
| `vim [FILE]`      | Open [FILE] in NeoVim                  |
| `a`               | Open current directory in Atom         |
| `a [DIRECTORY]`   | Open [DIRECTORY] in Atom               |
| `a [FILE]`        | Open [FILE] in Atom                    |
| `s`               | Open current directory in Sublime Text |
| `s [DIRECTORY]`   | Open [DIRECTORY] in Sublime Text       |
| `s [FILE]`        | Open [FILE] in Sublime Text            |

> NOTE: Use NeoVim instead of Vim. `nvim` has been overwritten to `vim`

## Helpful Commands

| Command             | Description                                                                 |
|---------------------|-----------------------------------------------------------------------------|
| `tail -f [FILE]`    | Outputs the last 10 lines of [FILE], and continue to monitor it for updates |
| `tail -n 50 [FILE]` | Outputs the last 50 lines of the file [FILE]                                |
