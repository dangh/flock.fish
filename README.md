# flock.fish
pure fish flock(1)

## Installation

```sh
fisher install dangh/flock.fish
```

## Usage

```sh
# acquire lock and execute command
flock lockfile echo 'lockfile acquired'

# unlock
flock -u lockfile
```

## Disclamation

This is a pure fish implementation of lock file copied from https://stackoverflow.com/questions/185451/quick-and-dirty-way-to-ensure-only-one-instance-of-a-shell-script-is-running-at/327991#327991 with the api of [discoteq/flock](https://github.com/discoteq/flock). It only support exclusive locks.
