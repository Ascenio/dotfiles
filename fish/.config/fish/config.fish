set fish_greeting

if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

if status is-interactive
    keychain --eval --quiet -Q | source
    fish_add_path ~/.platformio/penv/bin
    fish_add_path ~/.local/bin
    fish_add_path ~/dev/Android/platform-tools
    fish_add_path ~/dev/flutter/bin/
    export MANPAGER='nvim +Man!'
    export EDITOR='nvim'
    export CHROME_EXECUTABLE=$(which chromium)
end

function tmp
	cd (mktemp -d)
end

function dartscaffold 
	tmp
	dart create hello
	code hello
end

function scaffold 
	tmp
	flutter create hello
	code hello
end
