EMOJI=(💩 🐦 🚀 🐞 🎨 🍕 🐭 👽 ☕️ 🔬 💀 🐷 🐼 🐶 🐸 🐧 🐳 🍔 🍣 🍻 🔮 💰 💎 💾 💜 🍪 🌞 🌍 🐌 🐓 🍄 🦄 🌈)

function random_emoji {
  echo -n "$EMOJI[$RANDOM%$#EMOJI+1]"
}

function package_version() {
  if [ -f ./package.json ]; then
    VERSION=(""$(grep '"version"' ./package.json | head -n 1 | awk -F'"' '{print $4}'))

    if [[ -n $VERSION ]]; then
      echo "@$VERSION"
    fi
  fi
}

preexec() {
  timer=${timer:-$SECONDS}
}
BRed='\033[1;31m'
precmd() {
  if [ $timer ]; then
    timer_show=$(echo "scale=1; $SECONDS-$timer" | bc)
    echo "${BRed}>>> Execution time: ${timer_show}s\n"
    unset timer
  fi
}

PROMPT="%F{36}╭─[⏰ %D{%f/%m/%y} | %*] 📝"
PROMPT+='%F{159}%c%{$reset_color%}%F{202}$(package_version)% $(git_prompt_info)
%F{36}╰─$ '

# RPROMPT='[%*]'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{228} <$(random_emoji) branch={%F{197}"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{228}} />"

ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}} /> %{$fg[yellow]%}"

# for COLOR in {0..255}
# do
#     for STYLE in "38;5"
#     do
#         TAG="\033[${STYLE};${COLOR}m"
#         STR="${COLOR}"
#         echo -ne "${TAG}${STR}"
#     done
#     echo
# done
