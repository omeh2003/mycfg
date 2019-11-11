apt update && apt upgrade -y
pkg install curl wget git micro openssl openssl-dev ncurses-utils -y
pkg install fakeroot
apt install zsh micro wget curl
sh -c "$(curl -fsSL https://github.com/Cabbagec/termux-ohmyzsh/raw/master/install.sh)"
git clone https://github.com/Bhai4You/Termux-Banner
cd Termux-Banner/zsh || exit
chmod +x requirement.sh t-ban.sh
bash requirement.sh
bash t-ban.sh
chsh -s zsh
cd ~ || exit
cd .oh-my-zsh/plugins || exit
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting
pkg install curl
pkg install git
pkg install python
cd ~|| exit
git clone https://github.com/thehackingsage/hacktronian.git
cd hacktronian || exit
chmod +x hacktronian.py
python2 hacktronian.py
cd ~ || exit
"" > .zshrc
cat <<EOF > .zshrc
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

plugins=(
  git
  web-search
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
autoload -U compinit && compinit
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'w
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run.

zstyle ':completion:*' insert-tab false        # Автокомплит для первого символа

HISTFILE=~/.zhistory
## Число команд, сохраняемых в HISTFILE
SAVEHIST=5000
## Чucлo команд, coxpaняeмыx в сеансе
HISTSIZE=5000
DIRSTACKSIZE=20
# Опции истории команд
#Добавляет в историю время выполнения команды.
setopt extended_history
alias history='fc -il 1'

#История становится общей между всеми сессиями / терминалами.
setopt share_history

# Дополнение файла истрии
setopt  APPEND_HISTORY

#Добавить команду в историю не после выполнения а перед
setopt INC_APPEND_HISTORY

# Игнopupoвaть вce пoвтopeнuя команд
setopt  HIST_IGNORE_ALL_DUPS

# Удалять из файл истории пустые строки
setopt  HIST_REDUCE_BLANKS

# команды «history» и «fc» в историю заноситься не будут
setopt HIST_NO_STORE

# если набрали путь к директории без комманды CD, то перейти
setopt AUTO_CD

#Сообщать при изменении статуса фонового задания
setopt NOTIFY

#Перемещение стрелочками по выбору
#setopt menucomplete
#zstyle ':completion:*' menu select=1 _complete _ignored _approximate

#Вести себя как в BASH
#setopt AUTO_MENU BASH_AUTO_LIST

# исправлять неверно набранные комманды
setopt CORRECT_ALL
# вопрос на автокоррекцию
SPROMPT='zsh: Заменить '\''%R'\'' на '\''%r'\'' ? [Yes/No/Abort/Edit] '


#Можно вводить комментарии начинающиеся с #.
setopt interactive_comments

autoload -U compinit promptinit
compinit
promptinit;
#Дополняем спрятанные .файлы:
_comp_options+=(globdots)

# экранируем спецсимволы в url, например &amp;, ?, ~ и так далее
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# Включение поддержки выражений вроде «{1-3}» или «{a-d}» — они будут разворачиваться
# в «1 2 3» и «a b c d» соответственно
setopt BRACECCL

# После перехода в директорию вызываем ls.
function lcd() {cd "$1" && ls}
EOF

~/.termux/colors.sh
~/.termux/fonts.sh
pkg install php
git clone https://github.com/Ranginang67/DarkFly-Tool
cd DarkFly-Tool || exit
chmod +x install.py
python2 install.py
cd ~|| exit
apt install axel
axel https://github.com/Hax4us/Tmux-Bunch/releases/download/v2.7/Tmux-Bunch-2.7.tar.gz
tar -xf Tmux-Bunch-2.7.tar.gz
cd Tmux-Bunch || exit
bash setup
pkg install micro python python2
pip install bpython ipython
exit
exit
