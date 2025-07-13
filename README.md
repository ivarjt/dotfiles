
# 🧩 ivarjt's Dotfiles

My personal dotfiles for Arch Linux with Hyprland.

## 🖥️ Environment

- **OS**: Arch Linux  
- **WM**: Hyprland  
- **Shell**: Zsh  
- **Terminal**: Kitty  
- **Status Bars**: Waybar  

## 📦 Setup

```bash
sudo pacman -Syu
```

```bash
sudo pacman -S zsh stow fzf hyprpaper hyprlock waybar wofi git jq wl-clipboard ttf-font-awesome ttf-jetbrains-mono-nerd
```
```bash
git clone https://aur.archlinux.org/yay.git
```
```bash
sh -c "$(curl -fsSL [https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh](https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh))"  
```
```bash
git clone [https://github.com/zsh-users/zsh-completions](https://github.com/zsh-users/zsh-completions) \  
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions  
```
```bash
git clone [https://github.com/zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) \  
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions  
```
```bash
git clone --depth=1 [https://github.com/romkatv/powerlevel10k.git](https://github.com/romkatv/powerlevel10k.git) \  
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k  
```
```bash
p10k configure
```
```bash
git clone [https://github.com/ivarjt/dotfiles.git](https://github.com/ivarjt/dotfiles.git)  
```
```bash
cd dotfiles  
```
```bash
stow .
```
```bash
source ~/.zshrc
```
