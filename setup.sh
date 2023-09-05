#!/bin/bash
#
# Cheking and install dependencies
# #####

# COLORS
#
C_RED='\033[0;31m'
NC='\033[0m'
# #####

declare -A depPack;
depPack[/bin/zsh]=zsh
depPack[/bin/nvim]=neovim

declare -A depAddons;
depAddons[~/.oh-my-zsh/oh-my-zsh.sh]=oh-my-zsh
depAddons[~/.fzf/install]=fzf
depAddons[~/.config/nvim/adsfa]=nvchad


echo -e "Checking dependencies..."

DEPS=''
for f in ${!depPack[@]}
do
    if [ ! -f $f ];then
        if [ $DEPS ]; then DEPS+=', '; fi

        case ${depPack[$f]} in
            *)
                DEPS+="${depPack[$f]}"
                DEPK=1
                ;;
        esac
    fi
done

if [[ $DEPK -eq 1 ]]; then
        echo -e "...packages ${C_RED}$DEPS${NC} not founded, can't continue."
        # echo -e $DEPS
        exit
fi

ADOS=''
ADOK=0
for h in ${!depAddons[@]}
do
    if [ ! -f $h ]; then
        read -p "${depAddons[$h]} not founded, do you want to download now [Y/n]? " ANSWER
        ANSWER="${ANSWER:-y}"
            
        if [ $ANSWER == "y" ] || [ $ANSWER == "Y" ]; then
            case ${depAddons[$h]} in
                oh-my-zsh)
                    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
                    ;;
                fzf)
                    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
                    ~/.fzf/install
                    ;;
                nvchad)
                    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
                    ;;
                *)
                    ;;
            esac
        else
            if [ $ADOS ]; then 
                ADOS+=', '
            fi

            ADOS+="${depAddons[$h]}"
            ADOK=1
        fi
    fi
done

if [[ $ADOK -eq 1 ]]; then
        echo -e "...addons ${C_RED}$ADOS${NC} not installed."
        exit
fi

exit
