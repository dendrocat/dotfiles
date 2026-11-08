if status is-interactive
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

	abbr -a i "sudo pacman -S" # install
	abbr -a u "sudo pacman -Syu" # update sys

	abbr -a q "pacman -Qs" # search in installed pkgs
	abbr -a s "pacman -Ss" # search in remote repo

	abbr -a r	"sudo pacman -Rns" # remove pkg, config and its unused deps
	abbr -a rc	"sudo pacman -Rnsc" # prev + pkg dep on it
	abbr -a ru	"sudo pacman -Rns \$(pacman -Qtdq)" # clear unused deps

	abbr -a cc	"sudo pacman -Sc" # clear old cache
	abbr -a cca "sudo pacman -Scc" # clear all cache

	set --universal tide_git_icon 

	function su
		command su --shell=/usr/bin/fish $argv
	end

	alias y=yazi

	function yc
		set tmp (mktemp -t "yazi.cwd.XXXXXX")
		command yazi $argv --cwd-file="$tmp"
		if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
			cd -- "$cwd"
		end
		rm -f -- "$tmp"
	end

	zoxide init fish | source
end
