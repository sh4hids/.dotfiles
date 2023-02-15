#!/usr/bin/env zx

try {
  console.log(chalk.green("Switching to a fresh copy"));

  await $`mv $HOME/.dotfiles/nvim/* $HOME/.dotfiles/nvim_backup`;
  await $`mkdir $HOME/.dotfiles/nvim`;

  await $`mv $HOME/.local/share/nvim/* $HOME/.local/share/nvim_backup`;
  await $`mkdir $HOME/.local/share/nvim`;
} catch (e) {
  console.log(chalk.red(e));
}
