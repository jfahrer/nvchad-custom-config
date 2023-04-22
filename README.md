# NVChad custom config

Install:
```bash
# Delete existing config
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

# Install NVChad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

cd ~/.config/nvim/lua
git clone https://github.com/jfahrer/nvchad-custom-config custom  && nvim
```
