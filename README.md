# install nvim al2
https://gorm.dev/install-neovim-on-amazon-linux-2
```bash
sudo yum install nodejs npm
```
# NvChad and Custom Configuration Setup

## clean and backup
```bash
mv ~/.config/nvim ~/.config/nvim_back_$(date +%Y%m%d%H%M%S)
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
```

## Clone NvChad 2.0 + dreamsofcode
```bash
git clone -b v2.0 https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
git clone git@github.com:dreamsofcode-io/neovim-python.git ~/.config/nvim/lua/custom
mkdir -p ~/.config/mypy && echo -e "[mypy]\nignore_missing_imports = True" > ~/.config/mypy/config
```
## Clone NvChad newest
```bash
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
nvim -c "TSInstall python"
```
## install via shell script
```
Make it executable: chmod +x install_nvchad_python.sh
Run it: ./install_nvchad_python.sh
```
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
