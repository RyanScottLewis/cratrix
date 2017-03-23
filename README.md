# Cratrix

Matrix-like terminal text scrolling using Crystal and Termbox.

## Installation

To build and install to the filesystem, `cd` into the project directory and run:

```sh
rake install
```

To only build, just run:

```sh
rake build
```

### Termbox

Since Termbox is a dependency, you must first install it.

#### OSX/macOS

You can install Termbox using Homebrew:

```sh
brew install termbox
```

### ArchLinux

You can install Termbox using `yaourt`:

```sh
yaourt -S termbox-git
```

### Script

Otherwise, Termbox can be installed with the following script:

```sh
#!/bin/bash

# Install C version of nsf/termbox

# Clone termbox-c
git clone https://github.com/nsf/termbox lib-termbox

# cd to it
cd "lib-termbox"

# Configure and build
./waf configure --prefix=/usr/local
./waf

# Install (in /usr/local/lib)
sudo ./waf install --destdir=/
```

## Usage

Simply run the following from the command-line:

```sh
cratrix
```

## Contributing

1. Fork it ( https://github.com/RyanScottLewis/cratrix/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [Ryan Scott Lewis](https://github.com/RyanScottLewis) - creator, maintainer
