if status is-interactive
# Commands to run in interactive sessions can go here
	set -U fish_greeting

	set -x EDITOR nvim
	set XDG_CONFIG_HOME ~/config

	alias ls="lsd"
	alias ll="lsd -la"

	alias ..="cd .."
	alias ...="cd ../.."

	alias cls="clear"

	alias grep="grep --color=auto"

	alias vi=nvim

	abbr -a pci "sudo pacman -S" # install
	abbr -a pcu "sudo pacman -Syu" # update sys


	abbr -a pcq "pacman -Qs" # search in local repo
	abbr -a pcs "pacman -Ss" # search in remote repo

	abbr -a pcr "sudo pacman -Rns" # remove pkg, config and its unused deps
	abbr -a pcrc "sudo pacman -Rnsc" # prev + pkg dep on it

	abbr -a pccc "sudo pacman -Sc" # clear old cache
	abbr -a pccca "sudo pacman -Scc" # clear all cache
	abbr -a pcru "sudo pacman -Rns \$(pacman -Qtdq)" # clear unused deps

	function su
	   command su --shell=/usr/bin/fish $argv
	end
end
