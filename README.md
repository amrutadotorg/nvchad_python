# install 
sudo apt update
sudo apt install build-essential

curl -LsSf https://astral.sh/ruff/install.sh | sh

# install nvim al2
https://gorm.dev/install-neovim-on-amazon-linux-2

# install npm
https://nodejs.org/en/download/package-manager
or `sudo yum install nodejs npm`


# install pyright
`npm install -g pyright`

# NvChad and Custom Configuration Setup

## clean and backup
```bash
mv ~/.config/nvim ~/.config/nvim_back_$(date +%Y%m%d%H%M%S)
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
```

## Clone NvChad newest
```bash
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
nvim -c "TSInstall python"
```
## install via shell script
`git clone https://github.com/amrutadotorg/nvchad_python.git`

Make it executable: `chmod +x install_nvchad_python.sh`

Run it: `./install_nvchad_python.sh`

## install manually
```
git clone https://github.com/amrutadotorg/nvchad_python
cd nvchad_python
cp -av * ~/.config/nvim/lua/
cd configs
cp -av * ~/.config/nvim/lua/configs/
cd ../plugins/
cp -av * ~/.config/nvim/lua/plugins/
```
in your project do:
```pip install ruff-lsp```
