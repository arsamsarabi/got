# got

An opinionated cli tool for assisting with git related activities 🤓

## Prerequisites

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [brew](https://brew.sh/)

## Installation

>❗️Important
> `got` has only been developed and tested on MacOS. If you are using a different OS, please let me know if you face any issues.

1. Clone this repo
2. Open a terminal at the root of this project and run `make`:

```shell
  make -s
```

> If you added an alias don't forget to source the `dotfile`:

```shell
  source ~/{SOME_PATH}/.zshrc
```

## Usage

In your github repository run `got`:

```shell
  got
```

### available operations

- Create a new branch
- Commit changes
- Rebase with main
- and more..

## Demo

### Create a new branch

<img src="./assets/new_branch.gif" width="500px" />

### Commit changes

<img src="./assets/commit.gif" width="500px" />

## Feature suggestions

If you have any feature suggestion, do let me know. You can open an issue in the GitHub repo or drop me an email.

## Roadmap

- Create a Homebrew formula for this app
- Enable emojis in commit messages
  - Control the emoji using an environment variable
- Add option flags to enable/disable certain features
- Add `gh` cli integration
