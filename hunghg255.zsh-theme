EMOJI=(💩 🐦 🚀 🐞 🎨 🍕 🐭 👽 ☕️ 🔬 💀 🐷 🐼 🐶 🐸 🐧 🐳 🍔 🍣 🍻 🔮 💰 💎 💾 💜 🍪 🌞 🌍 🐌 🐓 🍄 🦄 🌈)
NEWLINE=$'\n'
function random_emoji {
  echo -n "$EMOJI[$RANDOM%$#EMOJI+1]"
}

function package_version() {
  if [ -f ./package.json ]; then
    echo "@"$(grep '"version"' ./package.json | head -n 1 | awk -F'"' '{print $4}')
  fi
}

PROMPT="%F{118}╭─ %(?:%{$fg_bold[green]%}$(random_emoji):%{$fg_bold[red]%}$(random_emoji)) "
PROMPT+='%F{159}%c%{$reset_color%}%F{202}$(package_version)% $(git_prompt_info)
%F{118}╰─$ '

RPROMPT='[%*]'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{228} <$(random_emoji) branch={%F{197}"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{228}} />"

ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}} /> %{$fg[yellow]%}"

# Generate Color

# for COLOR in {0..255}
# do
#     for STYLE in "38;5"
#     do
#         TAG="\033[${STYLE};${COLOR}m"
#         STR="${COLOR}"
#         echo -ne "${TAG}${STR}${NONE}  "
#     done
#     echo
# done
