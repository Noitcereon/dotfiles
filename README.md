# dotfiles

This is a repository for managing configuration files across systems with the [Chezmoi](https://www.chezmoi.io) tool.

## Usage

To initialize the configuration on a new machine run either of the following commands:

> Note: in the below command `Noitcereon` is my GitHub Username.

1. For interacting with GitHub using HTTPS (no setup to download, but Personal Access Token needed for edits)
    ```
    sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply Noitcereon
    ```
2. For interacting with GitHub with SSH (requires [SSH key setup](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)):
    ```
    sh -c "$(curl -fsLS get.chezmoi.io)" -- init --ssh --apply Noitcereon
    ```

This will install Chezmoi and initialize the configuration based on this dotfiles repository. You will be prompted to select 1 of 2 profiles 'w' for work or 'p' for personal (this sets up chezmoi config file under `~/.config/chezmoi/chezmoi.toml`(which is also editable via `chezmoi edit-config`)

### Common commands

`chezmoi add $FILE` adds $FILE from your home directory to the source directory.

`chezmoi edit $FILE` opens your editor with the file in the source directory that corresponds to $FILE.

`chezmoi status` gives a quick summary of what files would change if you ran chezmoi apply.

`chezmoi diff` shows the changes that chezmoi apply would make to your home directory.

`chezmoi apply` updates your dotfiles from the source directory.

`chezmoi edit --apply $FILE` is like chezmoi edit $FILE but also runs chezmoi apply $FILE afterwards.

`chezmoi cd` opens a subshell in the source directory.

`chezmoi update` pulls the latest changes from your remote repo and runs chezmoi apply.

> Note: Use normal git commands to add, commit, and push changes to your remote repo. (in the directory you're in after using `chezmoi cd`)

For more information see the Chezmoi documentation: <https://www.chezmoi.io/user-guide/command-overview/>


## Maintainer

- Thomas 'Noitcereon' Andersen
