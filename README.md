# Dotfiles

Everyone has their own setup for their dotfiles. Here is my setup.


## Installation

Before installing scripts, you will be asked `This may overwrite existing files in your home directory. Are you sure? (y/n)`. Confirm whether or not you want to overwrite existing files.

```bash
sh bootstrap.sh
```

To install the scripts without first asking to overwrite files

```bash
sh bootstrap.sh --force
```

or

```bash
sh bootstrap.sh -f
```

# Git Configuration

## .gitconfig.local

```bash
touch ~/.gitconfig.local
```

It is *not* a good idea to commit this file to any repository.

```
[user]

  name = Your Name
  email = your@email.com

[github]

  user = your_username
  token = your_token

[bitbucket]

  user = your_username
  token = your_token
```


## Git CLI

If you know for a fact once you you run `sh bootstrap.sh` to set this up and you will *never* run it again. Maybe you don't need a `~/.gitconfig.local` file.

Set your name

```bash
git config --global user.name "John Doe"
```

Set your email address

```bash
git config --global user.email "me@example.com"
```

Github user and token can be se using `user` or `github`

```bash
git config --global user.user "username"
git config --global github.user "username"
```

> If you ever decide to run `sh bootstrap.sh` again, you'll have to run these commands again. Otherwise, you need a `~/.gitconfig.local` file.


## ngrok

Set an `authtoken`:

```bash
ngrok authtoken 1234567890abcdefghijklmnopqrstuvwxyzABCDEFG
```

> If you ever decide to run `sh bootstrap.sh` again, you will lose the `authtoken`. You will have to run the command again.

To start a new service running on port `3000`:
```bash
ngrok http 3000
```


## Contributing

1. Fork it ( https://github.com/dfreerksen/dotfiles/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
