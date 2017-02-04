# dfreerksen/dotfiles

dotfiles

## Installation

Before installing scripts, you will be asked `This may overwrite existing files in your home directory. Are you sure? (y/n)`. Confirm whether or not you want to overwrite existing files.

```bash
sh setup.sh
```

To install the scripts without first asking to overwrite files

```bash
sh setup.sh --force
```

or

```bash
sh setup.sh -f
```

## Git Configuration

#### .gitconfig.local

```bash
touch ~/.gitconfig.local
```

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

## Contributing

1. Fork it ( https://github.com/dfreerksen/dotfiles/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
