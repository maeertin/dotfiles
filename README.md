# Martin's dotfiles

## Setup

### aliases and functions

- [`.aliases`](./.aliases) and [`.functions`](./.functions)

So many goodies.

### The "readline config" (`.inputrc`)

Basically it makes typing into the prompt amazing.

- tab like crazy for autocompletion that doesnt suck. tab all the things. srsly.
- no more <tab><tab> that says "Display all 1745 possibilities? (y or n)" YAY
- type `cat <uparrow>` to see your previous `cat`s and use them.
- case insensitivity.
- tab all the livelong day.

### [.gitconfig](./gitconfig)

- err'body gotta have their aliases. I'm no different.

### Moving around in folders (`z`, `...`, `cdf`)

`z` helps you jump around to whatever folder. It uses actual real magic to determine where you should jump to. Seperately there's some `...` aliases to shorten `cd ../..` and `..`, `....` etc. Then, if you have a folder open in Finder, `cdf` will bring you to it.

```sh
z dotfiles
z blog
....      # drop back equivalent to cd ../../..
z public
cdf       # cd to whatever's up in Finder
```

`z` learns only once its installed so you'll have to cd around for a bit to get it taught.
Lastly, I use `open .` to open Finder from this path. (That's just available normally.)

## overview of files

#### shell environment

- `.aliases`, `.bash_profile`, `.bash_prompt`, `.bashrc`, `.exports`, `.functions`

#### manual run

- `setup-a-new-machine.sh` - random apps i need installed
- `symlink-setup.sh` - sets up symlinks for all dotfiles and vim config.
- `.macos` - run on a fresh mac os setup
- `brew.sh` & `brew-cask.sh` - homebrew initialization

#### git, brah

- `.gitconfig`
- `.gitignore`

### `.extra` for your private configuration

There will be items that don't belong to be committed to a git repo, because either 1) it shoudn't be the same across your machines or 2) it shouldn't be in a git repo. Kick it off like this:

`touch ~/.extra && $EDITOR $_`

I have some EXPORTS, my PATH construction, and a few aliases for ssh'ing into my servers in there.

### Sensible OS X defaults in `.macos`

[Mathias's](https://github.com/mathiasbynens/dotfiles/) repo is the canonical for this.

### `~/bin`

One-off binaries that aren't via an npm global or homebrew. [git open](https://github.com/paulirish/git-open), `subl` for Sublime Text, and some other git utilities.
