#!/usr/bin/env zx

try {
  console.log(chalk.green("Restoring backup"));

  await $`mv $HOME/.dotfiles/nvim_backup/* $HOME/.dotfiles/nvim`;
  await $`mv $HOME/.local/share/nvim_backup/* $HOME/.local/share/nvim`;
} catch (e) {
  console.log(chalk.red(e));
}
