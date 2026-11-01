# dotfiles

This is a repository for managing configuration files and a base set up of applications, so setting up a new machine is as quick and painless as possible.

This is achieved via the tool [Chezmoi](https://www.chezmoi.io).

## Install

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

## Usage

There are multiple ways to manage the files managed by Chezmoi. My preferred approach is to edit directly in the Git repository and use standard Git commands to pull and push files.

You can navigate to the Git repository Chezmoi uses thorugh the following command: `chezmoi cd`. This opens a subshell in the source directory.

An alternative is to use Chezmoi to edit. See below for common Chezmoi commands.

### Common commands

`chezmoi add $FILE` adds $FILE from your home directory to the source directory.

`chezmoi edit $FILE` opens your editor with the file in the source directory that corresponds to $FILE.

`chezmoi status` gives a quick summary of what files would change if you ran chezmoi apply.

`chezmoi diff` shows the changes that chezmoi apply would make to your home directory.

`chezmoi apply` updates your dotfiles from the source directory.

`chezmoi edit --apply $FILE` is like chezmoi edit $FILE but also runs chezmoi apply $FILE afterwards.

`chezmoi update` pulls the latest changes from your remote repo and runs `chezmoi apply`.

`chezmoi edit-config` edits Chezmoi's machine specific config file (`~/.config/chezmoi/chezmoi.toml`)

`chezmoi execute-template < <path-to-template>` A way of testing templates. Shows how the template would look after being filled in (can be a bit hard to use, when you need to give it parameters to fill in)

`chezmoi purge --binary` Uninstalls Chezmoi, including its binary file. It does not touch already applied configuration.

For more information see the Chezmoi documentation: <https://www.chezmoi.io/user-guide/command-overview/>


## Maintainer

- Thomas 'Noitcereon' Andersen
