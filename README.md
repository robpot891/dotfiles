# Daniel Imms' dotfiles

My dotfiles for Linux and Windows.

![](terminal.png)

## Dependencies

Node.js is the primary dependency, here are some helper scripts:

```bash
# For nodejs stable
./install_node

# For nodejs LTS
./install_node lts
```

## Installing/syncing environment

```bash
npm install
node cli.js install
source ~/.bash_profile
```

### On Ubuntu

```bash
./scripts/bootstrap.sh
```

## Installing a single module

```bash
node cli.js install <module>
```

## Acknowledgements

- [Nicolas Gallagher](https://github.com/necolas) - [Bash prompt script](https://github.com/necolas/dotfiles)
- [Ron Waldon](https://github.com/jokeyrhyme) - [Font install script](https://github.com/jokeyrhyme/dotfiles)
