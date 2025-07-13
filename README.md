
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
cd yay
makepkg -si
cd ..
rm -rf yay
```
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
```bash
reboot
```
```bash
sudo pacman -S zsh-completions
```
```bash
yay -S zsh-autosuggestions
```
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
```
```bash
git clone https://github.com/ivarjt/dotfiles.git
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
```bash
p10k configure
```
```bash
source ~/.zshrc
```
