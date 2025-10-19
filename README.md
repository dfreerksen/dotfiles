# dfreerksen/dotfiles

dotfiles. See [usage](./USAGE.md)

## Requirements

* Mac (never been tested on anything else)

## Installation

Initial setup

```
$ make setup
```

## Updating

```
$ make update
```

## Setup

### .gitconfig.local

Create a `~/.gitconfig.local` file

```
$ touch ~/.gitconfig.local
```

Add the following into the file

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

## SSH

```
$ ssh-keygen -t rsa
$ ssh-add ~/.ssh/id_rsa
```

## Contributing

1.  Fork it ([https://github.com/dfreerksen/dotfiles/fork](https://github.com/dfreerksen/dotfiles/fork))
2.  Create your feature branch (`git checkout -b my-new-feature`)
3.  Commit your changes (`git commit -am 'Add some feature'`)
4.  Push to the branch (`git push origin my-new-feature`)
5.  Create a new Pull Request
