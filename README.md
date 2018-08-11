# dfreerksen/dotfiles

dotfiles. See [usage](./USAGE.md)

## Requirements

* Mac (never been tested on anything else)

## Installation

Before installing scripts, you will be asked `This may overwrite existing files in your home directory. Are you sure? (y/n)`. Confirm whether or not you want to overwrite existing files.

```
$ sh setup.sh
```

To install the scripts without first asking to overwrite files

```
$ sh setup.sh --force
```

or

```
$ sh setup.sh -f
```

## Setup

### Xcode

```
$ sudo xcodebuild -license
```

### NPM

Global NPM packages

```
$ npm install gulp-cli -g
$ npm install standard -g
```

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

### .aliases.local

Create a `~/.aliases.local` file

```
$ touch ~/.aliases.local
```

Add the following into the file

```
alias t="open -a Tower"
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
