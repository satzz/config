#read settings of fink
source /sw/bin/init.sh

export PATH=$HOME/bin:/opt/local/bin:$PATH:/usr/local/lib/gcc-lib:/usr/local/bin:/usr/local/mysql/bin
export HOSTNAME=hatena-nokonpyuta
#������˲���Keychain��¹Ԥ������˴ط��ʤ���30ʬ��ssh-agent����λ����褦�ˤʤ�
keychain --timeout 1 ~/.ssh/id_dsa  # ��̩��
source ~/.keychain/$HOSTNAME-sh
# based by http://devel.aquahill.net/zsh/zshoptions

# ʣ���� zsh ��Ʊ���˻Ȥ����ʤ� history �ե�����˾�񤭤����ɲä���
setopt append_history

# ���ꤷ�����ޥ��̾���ʤ����ǥ��쥯�ȥ�̾�Ȱ��פ������ cd ����
setopt auto_cd

# �䴰���䤬ʣ��������ˡ�����ɽ������
setopt auto_list

# �䴰������Tab, Ctrl+I) ��Ϣ�Ǥ�������ǽ���䴰�����ư���䴰����
setopt auto_menu

# ���å����б��ʤɤ�ưŪ���䴰����
setopt auto_param_keys

# �ǥ��쥯�ȥ�̾���䴰�������� / ��ưŪ���ղä��������䴰��������
setopt auto_param_slash

# �Ǹ夬�ǥ��쥯�ȥ�̾�ǽ���äƤ����������� / ��ưŪ�˼�����
#setopt auto_remove_slash

# �����ڥ����Υץ�����Ʊ�����ޥ��̾��¹Ԥ������ϥꥸ�塼�ह��
setopt auto_resume

# �ӡ��ײ����Ĥ餵�ʤ��褦�ˤ���
setopt NO_beep

# {a-c} �� a b c ��Ÿ�����뵡ǽ��Ȥ���褦�ˤ���
setopt brace_ccl

# �������ޥ�ɤ� echo �� BSD �ߴ��ˤ���
#setopt bsd_echo

# ����ܥ�å���󥯤ϼ��Τ��ɤ��褦�ˤʤ�
#setopt chase_links

# ��¸�Υե�������񤭤��ʤ��褦�ˤ���
#setopt clobber

# ���ޥ�ɤΥ��ڥ�����å��򤹤�
setopt correct

# ���ޥ�ɥ饤�����ƤΥ��ڥ�����å��򤹤�
#setopt correct_all

# =command �� command �Υѥ�̾��Ÿ������
setopt equals

# �ե�����̾�� #, ~, ^ �� 3 ʸ��������ɽ���Ȥ��ư���
setopt extended_glob

# zsh �γ��ϡ���λ�����ҥ��ȥ�ե�����˽񤭹���
#setopt extended_history

# Ctrl+S/Ctrl+Q �ˤ��ե������Ȥ�ʤ��褦�ˤ���
setopt NO_flow_control

# �ƥ��ޥ�ɤ��¹Ԥ����Ȥ��˥ѥ���ϥå���������
#setopt hash_cmds

# ľ����Ʊ�����ޥ�ɥ饤��ϥҥ��ȥ���ɲä��ʤ�
setopt hist_ignore_dups

# ���ޥ�ɥ饤�����Ƭ�����ڡ����ǻϤޤ���ҥ��ȥ���ɲä��ʤ�
setopt hist_ignore_space

# �ҥ��ȥ��ƤӽФ��Ƥ���¹Ԥ���֤˰�ö�Խ��Ǥ�����֤ˤʤ�
setopt hist_verify

# �����뤬��λ���Ƥ�΢����֤� HUP �����ʥ������ʤ��褦�ˤ���
setopt NO_hup

# Ctrl+D �ǤϽ�λ���ʤ��褦�ˤʤ��exit, logout �ʤɤ�Ȥ���
setopt ignore_eof

# ���ޥ�ɥ饤��Ǥ� # �ʹߤ򥳥��Ȥȸ��ʤ�
setopt interactive_comments

# auto_list ���䴰��������ǡ�ls -F �Τ褦�˥ե�����μ��̤�ޡ���ɽ��
setopt list_types

# �������ޥ�� jobs �ν��Ϥ�ǥե���Ȥ� jobs -l �ˤ���
setopt long_list_jobs

# ���ޥ�ɥ饤��ΰ����� --prefix=/usr �ʤɤ� = �ʹߤǤ��䴰�Ǥ���
setopt magic_equal_subst

# �᡼�륹�ס��� $MAIL ���ɤޤ�Ƥ������˥󥰤�ɽ������
#setopt mail_warning

# �ե�����̾��Ÿ���ǥǥ��쥯�ȥ�˥ޥå�������������� / ���ղä���
setopt mark_dirs

# �䴰���䤬ʣ�������������ɽ�� (auto_list) �����������˺ǽ�θ�����䴰����
#setopt menu_complete

# ʣ���Υ�����쥯�Ȥ�ѥ��פʤɡ�ɬ�פ˱����� tee �� cat �ε�ǽ���Ȥ���
setopt multios

# �ե�����̾��Ÿ���ǡ������ǤϤʤ�����Ū�˥����Ȥ����褦�ˤʤ�
setopt numeric_glob_sort

# ���ޥ��̾�� / ���ޤޤ�Ƥ���Ȥ� PATH ��Υ��֥ǥ��쥯�ȥ��õ��
#setopt path_dirs

# 8 �ӥå��ܤ��̤��褦�ˤʤꡢ���ܸ�Υե�����̾�ʤɤ򸫤��褦�ˤʤ�
setopt print_eightbit

# ����ͤ� 0 �ʳ��ξ�罪λ�����ɤ�ɽ������
#setopt print_exit_value

# �ǥ��쥯�ȥꥹ���å���Ʊ���ǥ��쥯�ȥ���ɲä��ʤ��褦�ˤʤ�
#setopt pushd_ignore_dups

# pushd ������ʤ��Ǽ¹Ԥ������ pushd $HOME �ȸ��ʤ����
#setopt pushd_to_home

# rm * �ʤɤκݡ����������ƤΥե������ä����ɤ����γ�ǧ���ʤ��褦�ˤʤ�
#setopt rm_star_silent

# rm_star_silent �εդǡ�10 �ô�ȿ�����ʤ��ʤꡢƬ����ޤ����֤�Ϳ������
#setopt rm_star_wait

# for, repeat, select, if, function �ʤɤǴ�άʸˡ���Ȥ���褦�ˤʤ�
setopt short_loops

# �ǥե���Ȥ�ʣ���ԥ��ޥ�ɥ饤���Խ��ǤϤʤ��������Խ��⡼�ɤˤʤ�
#setopt single_line_zle

# ���ޥ�ɥ饤�󤬤ɤΤ褦��Ÿ������¹Ԥ��줿����ɽ������褦�ˤʤ�
#setopt xtrace

# ����Ȥ�
setopt prompt_subst

# ������Υץ������Ȥ������ͭ
setopt share_history

# history (fc -l) ���ޥ�ɤ�ҥ��ȥ�ꥹ�Ȥ����������
setopt hist_no_store

# ʸ���������˲��ԥ����ɤ�̵�����Ǥ�ɽ������
unsetopt promptcr

#���ԥڤλ�rprompt����ɽ������
setopt transient_rprompt

# cd -[tab] ��pushd
setopt autopushd

autoload -U compinit
compinit
PROMPT="%/%% "
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: " 
#��ʸ����ʸ��̵�뤷���䴰
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

