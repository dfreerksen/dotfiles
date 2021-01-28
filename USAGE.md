# Usage

Usage. Because I have a bad memory.

Various global settings get set for; `.editorconfig`, `.gemrc`, `.gitignore`, `.railsrc`, `.rspec`, `.rubocop.yml`

## Shell Shortcuts

| Command | Description            |
|---------|------------------------|
| `c`     | Shortcut for `clear`   |
| `h`     | Shortcut for `history` |
| `sc`    | Source `~/.zshrc`      |

## Change Directory

| Command | Description                   |
|---------|-------------------------------|
| `..`    | Shortcut for `cd ..`          |
| `...`   | Shortcut for `cd ../..`       |
| `....`  | Shortcut for `cd ../../..`    |

## Shell Overwrites

| Command          | Description                                  |
|------------------|----------------------------------------------|
| `ping [OPTIONS]` | Overwrite `ping` with `ping -c 20 [OPTIONS]` |

## Shell Extensions

| Command            | Description                                           |
|--------------------|-------------------------------------------------------|
| `ls`               | Color output for `ls`                                 |
| `ll`               | List all files in long format, including hidden files |
| `o`                | Open current directory in Finder                      |
| `o [DIRECTORY]`    | Open `[DIRECTORY]` directory in Finder                |
| `cpwd`             | Copy current path to clipboard                        |
| `mkcd [DIRECTORY]` | Create a new directory and enter it                   |

## Homebrew

| Command | Description                                        |
|---------|----------------------------------------------------|
| `brewup` | Update Homebrew, upgrade packages and run cleanup |

## NPM

| Command | Description                                     |
|---------|-------------------------------------------------|
| `npmup` | Update NPM, update all outdated global packages |

## Version Managers

### NVM

| Command | Description                                         |
|---------------------|-----------------------------------------|
| `nvm current`       | Current version of Node                 |
| `nvm install x.y.z` | Install version of Node                 |
| `nvm use x.y`       | Use version of Node                     |
| `nvm use`           | Use version of Node defined in `.nvmrc` |
| `nvm ls`            | List installed versions of Node         |
| `nvm ls-remote`     | List available versions of Node         |

> NOTE: Use with `.nvmrc` file

### Rbenv

| Command | Description                                    |
|------------------------|---------------------------------|
| `rbenv version`        | Current version of Ruby         |
| `rbenv install x.y.z`  | Install version of Ruby         |
| `rbenv global x.y.z`   | Use version of Ruby globally    |
| `rbenv versions`       | List installed versions of Ruby |
| `rbenv install --list` | List available versions of Ruby |

> NOTE: Use with `.ruby-version` file

## Code Editors

> NOTE: Default `vim` command is overwritten to use NeoVim

| Command           | Description                            |
|-------------------|----------------------------------------|
| `a`               | Open current directory in Atom         |
| `a [DIRECTORY]`   | Open [DIRECTORY] in Atom               |
| `a [FILE]`        | Open [FILE] in Atom                    |
| `s`               | Open current directory in Sublime Text |
| `s [DIRECTORY]`   | Open [DIRECTORY] in Sublime Text       |
| `s [FILE]`        | Open [FILE] in Sublime Text            |

## Docker

| Command | Description                   |
|---------|-------------------------------|
| `dc`    | Shortcut for `docker-compose` |

## Ruby

| Command | Description                   |
|---------|-------------------------------|
| `be`    | Shortcut for `bundle exec`    |
| `bi`    | Shortcut for `bundle install` |

## Atom

| Command            | Description           |
|--------------------|-----------------------|
| `Shift + Ctrl + M` | Open Markdown Preview |

## tail

Outputs the last 10 lines of [FILE], and continue to monitor it for updates. Example `tail -f ~/logs/production.log`

```
$ tail -f [FILE]
````

Outputs the last 50 lines of the file [FILE]. Example `tail -n 50 ~/logs/production.log`

```
$ tail -n 50 [FILE]
````

## ngrok

Useful commands for [`ngrok`](https://ngrok.com/)

Secure public URL for port [PORT] web server. Example `ngrok http 80`

```
$ ngrok http [PORT]
```

Port [PORT] available at [SUBDOMAIN].ngrok.io. Example `ngrok http -subdomain=baz 8080`

```
$ ngrok http -subdomain=[SUBDOMAIN] [PORT]
```

Tunnel to [HOST]:[PORT] instead of localhost. Example `ngrok http foo.dev:80`

```
$ ngrok http [HOST]:[PORT]
```

TLS traffic for [HOSTNAME] to port [PORT]. Example `ngrok tls -hostname=foo.com 443`

```
$ ngrok tls -hostname=[HOSTNAME] [PORT]
```
