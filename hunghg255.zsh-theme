EMOJI=(💩 🐦 🚀 🐞 🎨 🍕 🐭 👽 ☕️ 🔬 💀 🐷 🐼 🐶 🐸 🐧 🐳 🍔 🍣 🍻 🔮 💰 💎 💾 💜 🍪 🌞 🌍 🐌 🐓 🍄 )

function random_emoji {
  echo -n "$EMOJI[$RANDOM%$#EMOJI+1]"
}

function package_version() {
  if [ -f ./package.json ]; then
    echo "@"$(grep '"version"' ./package.json | head -n 1 | awk -F'"' '{print $4}')
  fi
}

PROMPT="%(?:%{$fg_bold[green]%}$(random_emoji):%{$fg_bold[red]%}$(random_emoji)) "
PROMPT+='%{$fg[cyan]%}%c%{$reset_color%}%{$fg[green]%}$(package_version)% $(git_prompt_info) '
RPROMPT='[%*]'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}<$(random_emoji) branch={%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}} /> %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}} />"
