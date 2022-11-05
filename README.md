# got

An opinionated cli tool for assisting with git related activities 🤓

## Prerequisites

You need to have `Go` and `Gum` installed on your mac.

```shell
brew install go gum
```

## Installation

1. Clone this repo or download the `got.sh` file and place it in your `$PATH`.

   > On mac: `/usr/local/bin`

2. Make it executable:

```shell
chmod +x got.sh
```

3. Add an alias to your `.bashrc` or `.zshrc` file:

```shell
alias got="got.sh"
```

4. Source your `.bashrc` or `.zshrc` file:

```shell
source ~/.bashrc
```

## Usage

```shell
got
```

### Demos

#### Create a new branch

![]('./../assets/new_branch.gif')

#### Commit changes

![]('./../assets/commit.gif')

## Feature suggestions

If you have any feature suggestion, do let me know. You can open an issue in the GitHub repo or drop me an email.

## Roadmap

- create a Homebrew formula for this app
- Enable emojis in commit messages
  - control the emoji using an environment variable
- ..
