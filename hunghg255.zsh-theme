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

SPACESHIP_NODE_DEFAULT_VERSION="${SPACESHIP_NODE_DEFAULT_VERSION:=""}"

function _exists() {
  command -v $1 > /dev/null 2>&1
}

function node_version() {
  # Show NODE status only for JS-specific folders
  [[ -f package.json || -d node_modules || -n *.js(#qN) ]] || return

  local node_version

  if _exists nvm; then
    node_version=$(nvm current 2>/dev/null)
    [[ $node_version == "system" || $node_version == "node" ]] && return
  elif _exists node; then
    node_version=$(node -v)
    [[ $node_version == $SPACESHIP_NODE_DEFAULT_VERSION ]] && return
  else
    return
  fi

  echo "$node_version"
}

# preexec() {
#   timer=$(($(print -P %D{%s%6.})/1000))
# }

# precmd() {
#   if [ $timer ]; then
#     now=$(($(print -P %D{%s%6.})/1000))
#     elapsed=$(($now-$timer))
#     export ZSH_THEME_GIT_PROMPT_CLEAN="%F{228}} execute={%F{197}${elapsed}ms%F{228}} />"
#     unset timer
#     return
#   fi
#   export ZSH_THEME_GIT_PROMPT_CLEAN="%F{228}} execute={%F{197}0ms%F{228}} />"
# }

preexec() {
  timer=$(print -P %D{%s%3.})
}

precmd() {
  timeprompt=""
  if [ $timer ]; then
    now=$(print -P %D{%s%3.})
    local d_ms=$(($now - $timer))
    local d_s=$((d_ms / 1000))
    local ms=$((d_ms % 1000))
    local s=$((d_s % 60))
    local m=$(((d_s / 60) % 60))
    local h=$((d_s / 3600))

    if   ((h > 0)); then timeprompt=${h}h${m}m${s}s
    elif ((m > 0)); then timeprompt=${m}m${s}.$(printf $(($ms / 100)))s # 1m12.3s
    elif ((s > 9)); then timeprompt=${s}.$(printf %02d $(($ms / 10)))s # 12.34s
    elif ((s > 0)); then timeprompt=${s}.$(printf %03d $ms)s # 1.234s
    else timeprompt=${ms}ms
    fi
    export ZSH_THEME_GIT_PROMPT_CLEAN="%F{228}} execute={%F{197}${timeprompt}%F{228}} />"
    unset timer
    return
  fi
  export ZSH_THEME_GIT_PROMPT_CLEAN="%F{228}} execute={%F{197}0ms%F{228}} />"
}

ZSH_THEME_GIT_PROMPT_PREFIX="%F{228} <$(random_emoji) branch={%F{197}"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{228}} execute={%F{197}0ms%F{228}} />"

ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}} execute={%F{197}0ms%F{228}} /> %{$fg[yellow]%}"

PROMPT="%F{36}╭─[⏰ %D{%f/%m/%y} %* | %F{40}⬢ $(node_version)%F{36}] 📝"
PROMPT+='%F{159}%c%{$reset_color%}%F{202}$(package_version)% $(git_prompt_info)
%F{36}╰─$ '


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
BRed='\033[1;31m'
echo "${BRed}\u2588\u2588\u2557  \u2588\u2588\u2557\u2588\u2588\u2557   \u2588\u2588\u2557\u2588\u2588\u2588\u2557   \u2588\u2588\u2557 \u2588\u2588\u2588\u2588\u2588\u2588\u2557 \r\n\u2588\u2588\u2551  \u2588\u2588\u2551\u2588\u2588\u2551   \u2588\u2588\u2551\u2588\u2588\u2588\u2588\u2557  \u2588\u2588\u2551\u2588\u2588\u2554\u2550\u2550\u2550\u2550\u255D \r\n\u2588\u2588\u2588\u2588\u2588\u2588\u2588\u2551\u2588\u2588\u2551   \u2588\u2588\u2551\u2588\u2588\u2554\u2588\u2588\u2557 \u2588\u2588\u2551\u2588\u2588\u2551  \u2588\u2588\u2588\u2557\r\n\u2588\u2588\u2554\u2550\u2550\u2588\u2588\u2551\u2588\u2588\u2551   \u2588\u2588\u2551\u2588\u2588\u2551\u255A\u2588\u2588\u2557\u2588\u2588\u2551\u2588\u2588\u2551   \u2588\u2588\u2551\r\n\u2588\u2588\u2551  \u2588\u2588\u2551\u255A\u2588\u2588\u2588\u2588\u2588\u2588\u2554\u255D\u2588\u2588\u2551 \u255A\u2588\u2588\u2588\u2588\u2551\u255A\u2588\u2588\u2588\u2588\u2588\u2588\u2554\u255D\r\n\u255A\u2550\u255D  \u255A\u2550\u255D \u255A\u2550\u2550\u2550\u2550\u2550\u255D \u255A\u2550\u255D  \u255A\u2550\u2550\u2550\u255D \u255A\u2550\u2550\u2550\u2550\u2550\u255D \r"
