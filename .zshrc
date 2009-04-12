source ~/.device.sh
[ -e "${HOME}/.ssh/agent-env" ] && . "${HOME}/.ssh/agent-env"
# Git branch on RPROMPT
# refs: http://www.jukie.net/~bart/blog/zsh-git-branch2
# refs: http://d.hatena.ne.jp/cooldaemon/20080516/1210909583
function git_branch() {
local branch

if test -z $(git rev-parse --git-dir 2> /dev/null); then
branch='---'
else
branch="${$(git symbolic-ref HEAD 2> /dev/null)#refs/heads/}"
fi

echo -n "($branch)"
}
RPROMPT='$(git_branch)'


export PATH=$HOME/.gem/ruby/1.8/bin:$HOME/bin:/opt/local/bin:$PATH:/usr/local/lib/gcc-lib:/usr/local/bin:/usr/local/mysql/bin
#�����֒�⒤˒�����Keychain����Ԓ����������˒�ؒ����ʒ�����30�ʬ���ssh-agent�������λ�����뒤蒤���˒�ʒ��
# keychain --timeout 1 ~/.ssh/id_dsa  # ���̩���
# source ~/.keychain/$HOSTNAME-sh
# based by http://devel.aquahill.net/zsh/zshoptions

export EDITOR="vi"

# http://d.hatena.ne.jp/amt/20070423/MyPerlLikeMatch
my_perl_like_match() { # perl ����������ɽ�����ޒ�Ò��
    if [ $# -ne 2 ] 		# ��������Β�����������Ò��
	then echo "Usage:: \t% $0 'RegExp' value\t# RegExp need quotation."
	    echo "Example:: \t% $0 '/^FOO$/i' foo"
    fi
    local pattern=$1
    local value=$2

    if echo $value | perl -nle "exit(1) unless ${pattern}" &> /dev/null 
	then return 0 
    else return 1
    fi
}

# call API in outputz.com by zsh
# http://cucumber.g.hatena.ne.jp/tomisima/20081203/1228235994
preexec() {
    local command=${1}
    if [ $command ]; then
        if my_perl_like_match '/^ls/', $command; then
		    uri=http://ls.localhost/
        elif my_perl_like_match '/^vi/', $command; then
		    uri=http://vi.localhost/
        elif my_perl_like_match '/^echo/', $command; then
		    uri=http://echo.localhost/
        elif my_perl_like_match '/^top/', $command; then
		    uri=http://top.localhost/
        elif my_perl_like_match '/^ps/', $command; then
		    uri=http://ps.localhost/
        elif my_perl_like_match '/^(ptex|platex|dvi2ps|xdvi)/', $command; then
		    uri=http://tex.localhost/
        elif my_perl_like_match '/^ping/', $command; then
		    uri=http://ping.localhost/
        elif my_perl_like_match '/^ssh/', $command; then
		    uri=http://ssh.localhost/
        elif my_perl_like_match '/^sh/', $command; then
		    uri=http://sh.localhost/
        elif my_perl_like_match '/^bash/', $command; then
		    uri=http://bash.localhost/
        elif my_perl_like_match '/^cat/', $command; then
		    uri=http://cat.localhost/
        elif my_perl_like_match '/^less/', $command; then
		    uri=http://less.localhost/
        elif my_perl_like_match '/^head/', $command; then
		    uri=http://head.localhost/
        elif my_perl_like_match '/^tail/', $command; then
		    uri=http://tail.localhost/
        elif my_perl_like_match '/^more/', $command; then
		    uri=http://more.localhost/
        elif my_perl_like_match '/^source/', $command; then
		    uri=http://source.localhost/
        elif my_perl_like_match '/^(perl|cpan|prove)/', $command; then
		    uri=http://perl.localhost/
        elif my_perl_like_match '/^python/', $command; then
		    uri=http://python.localhost/
        elif my_perl_like_match '/^sed/', $command; then
		    uri=http://sed.localhost/
        elif my_perl_like_match '/^awk/', $command; then
		    uri=http://awk.localhost/
        elif my_perl_like_match '/^(gcc|gdb)/', $command; then
		    uri=http://c.localhost/
        elif my_perl_like_match '/^(ruby|rails|gem|rake)/', $command; then
		    uri=http://ruby.localhost/
        elif my_perl_like_match '/^gnuplot/', $command; then
		    uri=http://gnuplot.localhost/
        elif my_perl_like_match '/^wget/', $command; then
		    uri=http://wget.localhost/
        elif my_perl_like_match '/^touch/', $command; then
		    uri=http://touch.localhost/
        elif my_perl_like_match '/^mkdir/', $command; then
		    uri=http://mkdir.localhost/
        elif my_perl_like_match '/^rmdir/', $command; then
		    uri=http://rmdir.localhost/
        elif my_perl_like_match '/^rm/', $command; then
		    uri=http://rm.localhost/
        elif my_perl_like_match '/^mv/', $command; then
		    uri=http:/mv.localhost/
        elif my_perl_like_match '/^cp/', $command; then
		    uri=http:/cp.localhost/
        elif my_perl_like_match '/^cd/', $command; then
		    uri=http://cd.localhost/
        elif my_perl_like_match '/^sudo/', $command; then
		    uri=http://sudo.localhost/
        elif my_perl_like_match '/^which/', $command; then
		    uri=http://which.localhost/
        elif my_perl_like_match '/^where/', $command; then
		    uri=http://where.localhost/
        elif my_perl_like_match '/^kill/', $command; then
		    uri=http://kill.localhost/
        elif my_perl_like_match '/^mysql/', $command; then
		    uri=http://mysql.localhost/
        elif my_perl_like_match '/^git/', $command; then
		    uri=http://git.localhost/
        elif my_perl_like_match '/^tig/', $command; then
		    uri=http://tig.localhost/
        elif my_perl_like_match '/^termtter/', $command; then
		    uri=http://termtter.localhost/
        else
		    uri=http://zsh.localhost/
        fi

        key=`ruby -rubygems -e 'require "pit";print Pit.get("outputz.com")["key"]'`
        curl -s http://outputz.com/api/post -F key=${key} -F uri=${uri} -F size=${#1} >/dev/null
    fi
}



# �ʣ������ zsh ���Ʊ�����˒�Ȓ�������ʒ�� history ��Ւ�������뒤˒�咽񒤭��������ɒ�Ò�����
setopt append_history

# ��ؒ�꒤���������ޒ��ɒ̾�����ʒ�������ǒ����쒥���Ȓ��̾��Ȓ���ג�������쒹� cd ������
setopt auto_cd

# ��䒴������䒤��ʣ��������뒻���˒��������ɽ���������
setopt auto_list

# ��䒴����������Tab, Ctrl+I) ���Ϣ��ǒ����뒤������ǒ�璤˒�䒴������䒤򒼫�ư��ǒ�䒴�������
setopt auto_menu

# �����Ò����Β�В����ʒ�ɒ�򒼫�ư�Ū��˒�䒴�������
setopt auto_param_keys

# ��ǒ����쒥���Ȓ��̾��Β�䒴���ǒ�������� / ��򒼫�ư�Ū��˒�Ւ�Ò����������Β�䒴���˒��������
setopt auto_param_slash

# ��ǒ�咤���ǒ����쒥���Ȓ��̾��ǒ����Ò�ƒ����뒾쒹��������� / ��򒼫�ư�Ū��˒�蒤꒽����
#setopt auto_remove_slash

# ��������ڒ��ɒ�撤Β�ג�풥������ȒƱ��������ޒ��ɒ̾����Ԓ�������쒹璤ϒ�꒥���咡����������
setopt auto_resume

# ��Ӓ����ג������Ē�钤���ʒ����蒤���˒�����
setopt NO_beep

# {a-c} ��� a b c ��˒Ÿ��������뒵��ǽ���Ȓ����뒤蒤���˒�����
setopt brace_ccl

# ����������ޒ��ɒ�� echo ��� BSD ��ߒ����˒�����
#setopt bsd_echo

# ������ܒ�꒥Ò����꒥󒥯��ϒ��Β���ɒ����蒤���˒�ʒ��
#setopt chase_links

# ����¸��Β�Ւ�������뒤�咽񒤭�����ʒ����蒤���˒�����
#setopt clobber

# �����ޒ��ɒ�Β����ڒ�뒥������Ò����򒤹���
setopt correct

# �����ޒ��ɒ�钥��������ƒ�Β����ڒ�뒥������Ò����򒤹���
#setopt correct_all

# =command ��� command ��Β�ђ���̾��˒Ÿ���������
setopt equals

# ��Ւ��������̾��� #, ~, ^ ��� 3 �ʸ������������ɽ�����Ȓ����ƒ�����
setopt extended_glob

# zsh ��Β����ϒ������λ������Ғ����Ȓ�꒥Ւ�������뒤˒�񒤭������
#setopt extended_history

# Ctrl+S/Ctrl+Q ��˒�蒤뒥Ւ�풡������撤�Ȓ�ʒ����蒤���˒�����
setopt NO_flow_control

# ��ƒ����ޒ��ɒ�����Ԓ����쒤뒤Ȓ����˒�ђ�����ϒ�Ò����咤˒����쒤�
#setopt hash_cmds

# �ľ�����ȒƱ��������ޒ��ɒ�钥����ϒ�Ғ����Ȓ�꒤˒�ɒ�Ò����ʒ��
setopt hist_ignore_dups

# �����ޒ��ɒ�钥����Β��Ƭ��������ڒ�������ǒ�ϒ�ޒ�뒾쒹璥Ғ����Ȓ�꒤˒�ɒ�Ò����ʒ��
setopt hist_ignore_space

# ��Ғ����Ȓ�꒤�ƒ�Ӓ�В����ƒ����钼�Ԓ����뒴֒�˒��ö��Ԓ����ǒ����뒾���֒�˒�ʒ��
setopt hist_verify

# ��������뒤�����λ�����ƒ��΢�����璥֒�� HUP ��������ʒ�뒤�����钤ʒ����蒤���˒�����
setopt NO_hup

# Ctrl+D ��ǒ�ϒ���λ�����ʒ����蒤���˒�ʒ�뒡�exit, logout ��ʒ�ɒ��Ȓ�����
setopt ignore_eof

# �����ޒ��ɒ�钥����ǒ�� # ��ʒ�ߒ�򒥳��ᒥ�Ȓ�Ȓ����ʒ��
setopt interactive_comments

# auto_list ��Β�䒴������䒰�����ǒ��ls -F ��Β�蒤���˒�Ւ�������뒤Β���̒��ޒ������ɽ���
setopt list_types

# ����������ޒ��� jobs ��Β�В�ϒ��ǒ�Ւ����뒥Ȓ�� jobs -l ��˒�����
setopt long_list_jobs

# �����ޒ��ɒ�钥����Β�������� --prefix=/usr ��ʒ�ɒ�� = ��ʒ�ߒ�ǒ���䒴���ǒ�����
setopt magic_equal_subst

# ��ᒡ���뒥���ג����� $MAIL �����ɒ�ޒ�쒤ƒ�������钥���˒�󒥰���ɽ���������
#setopt mail_warning

# ��Ւ��������̾��ΒŸ�����ǒ�ǒ����쒥���Ȓ�꒤˒�ޒ�Ò����������쒹��������� / ����Ւ�Ò�����
setopt mark_dirs

# ��䒴������䒤��ʣ��������뒻����������ɽ��� (auto_list) �����������������˒�ǒ�钤Β����䒤��䒴�������
#setopt menu_complete

# �ʣ�����Β�꒥������쒥���Ȓ�䒥ђ����ג�ʒ�ɒ���ɬ��ג�˒�������� tee ��� cat ��Β���ǽ�����Ȓ�쒤�
setopt multios

# ��Ւ��������̾��ΒŸ�����ǒ��������璤ǒ�ϒ�ʒ�������͒Ū��˒�������Ȓ����쒤뒤蒤���˒�ʒ��
setopt numeric_glob_sort

# �����ޒ��ɒ̾��� / �����ޒ�ޒ�쒤ƒ����뒤Ȓ�� PATH ��撤Β����֒�ǒ����쒥���Ȓ�꒤�õ���
#setopt path_dirs

# 8 ��Ӓ�Ò�Ȓ�ܒ���̒����蒤���˒�ʒ�꒡������ܒ�쒤Β�Ւ��������̾��ʒ�ɒ�򒸫��쒤뒤蒤���˒�ʒ��
setopt print_eightbit

# ��ᒤ��͒�� 0 ��ʒ����Β�쒹璽��λ��������ɒ��ɽ���������
#setopt print_exit_value

# ��ǒ����쒥���Ȓ�꒥������Ò����˒Ʊ�����ǒ����쒥���Ȓ�꒤��ɒ�Ò����ʒ����蒤���˒�ʒ��
#setopt pushd_ignore_dups

# pushd ���������ʒ����ǒ��Ԓ�������쒹� pushd $HOME ��Ȓ����ʒ����쒤�
#setopt pushd_to_home

# rm * ��ʒ�ɒ�Β�ݒ����ܒ����˒����ƒ�Β�Ւ�������뒤�Ò����ƒ�ɒ�������Β�Βǧ�����ʒ����蒤���˒�ʒ��
#setopt rm_star_silent

# rm_star_silent ��Β�Ւ�ǒ��10 ��Ò�֒ȿ��������ʒ����ʒ�꒡��Ƭ����䒤ޒ�������֒���Ϳ�����钤쒤�
#setopt rm_star_wait

# for, repeat, select, if, function ��ʒ�ɒ�ǒ�ʒά�ʸ�ˡ�����Ȓ����뒤蒤���˒�ʒ��
setopt short_loops

# ��ǒ�Ւ����뒥Ȓ�Βʣ�����Ԓ����ޒ��ɒ�钥�����Ԓ����ǒ�ϒ�ʒ����������Ԓ�Ԓ����⒡���ɒ�˒�ʒ��
#setopt single_line_zle

# �����ޒ��ɒ�钥���󒤬��ɒ�Β�蒤���˒Ÿ��������쒼�Ԓ����쒤�������ɽ��������뒤蒤���˒�ʒ��
#setopt xtrace

# ������Ȓ��
setopt prompt_subst

# ��������뒤Β�ג�풥���������Ȓ�˒�����򒶦�ͭ
setopt share_history

# history (fc -l) �����ޒ��ɒ��Ғ����Ȓ�꒥꒥���Ȓ����钼蒤꒽�������
setopt hist_no_store

# �ʸ�������������˒����Ԓ�������ɒ���̵�����쒹璤ǒ��ɽ���������
unsetopt promptcr

#�����Ԓ�ڒ�Β��rprompt�����ɽ���������
setopt transient_rprompt

# cd -[tab] ���pushd
setopt autopushd

autoload -U compinit
compinit
PROMPT="%/%% "
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: " 
#���ʸ�������ʸ����̵��뒤���ƒ�䒴�
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no beep sound when complete list displayed
#
setopt nolistbeep

## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes 
#   to end of it)
#
bindkey -e

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8

## Default shell configuration
#
# set prompt
#
case ${UID} in
0)
    PROMPT="%B%{[31m%}%/#%{[m%}%b "
    PROMPT2="%B%{[31m%}%_#%{[m%}%b "
    SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
*)
    PROMPT="%{[31m%}%/%%%{[m%} "
    PROMPT2="%{[31m%}%_%%%{[m%} "
    SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

