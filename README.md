# shellconfig

## Install

### Copy Files into root dir 
```
cp zshrc ~/.zshrc
cp bash_profile ~/.bash_profile
cp -r shell ~/.shell
```
### Load Dependencies
```
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.shell/zsh/zsh-autosuggestions
git clone https://github.com/olivierverdier/zsh-git-prompt.git ~/.shell/zsh/zsh-git-prompt

mkdir ~/.shell/zsh/zsh-git-completion
cd ~/.shell/zsh/zsh-git-completion
curl -o git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o _git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
```
