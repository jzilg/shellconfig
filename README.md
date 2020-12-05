# shellconfig

## Install

### Clone and go into dir
```
git clone https://github.com/jzilg/shellconfig.git
cd shellconfig
```
### Copy Files into root dir 
```
cp zshrc ~/.zshrc
cp bash_profile ~/.bash_profile
cp -r shell ~/.shell
```
### Load Dependencies (for zsh only)
```
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.shell/zsh/zsh-autosuggestions

mkdir ~/.shell/zsh/zsh-git-completion
cd ~/.shell/zsh/zsh-git-completion
curl -o git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o _git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
```
