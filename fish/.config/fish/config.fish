if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

if status is-interactive
    eval $(ssh-agent -c) >/dev/null
    ssh-add ~/.ssh/github &>/dev/null
    fish_add_path $HOME/.platformio/penv/bin
    fish_add_path $HOME/.local/bin
    fish_add_path $HOME/dev/Android/platform-tools
    export MANPAGER='nvim +Man!'
    export EDITOR='nvim'
    export CHROME_EXECUTABLE=$(which chromium)
end

function dartscaffold 
	cd (mktemp -d)
	dart create hello
	code hello
end

function scaffold 
	cd (mktemp -d)
	flutter create hello
	code hello
end
