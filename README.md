
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
sudo pacman -S zsh stow fzf hyprpaper hyprlock waybar wofi git eza bat jq wl-clipboard ttf-font-awesome ttf-jetbrains-mono-nerd
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
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
```

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```
```bash
exec zsh
p10k configure
```
```bash
git clone https://github.com/ivarjt/dotfiles.git
```
```bash
rm ~/.zshrc
cd dotfiles
stow zsh
source ~/.zshrc
```
``` bash
cd ~/.config
rm -rf kitty
rm -rf hypr
cd ..
cd dotfiles
stow config
```

