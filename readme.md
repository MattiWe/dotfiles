###Usage

1. Clone this repo
2. ```git submodule update --init --recursive```
3. symlink everything

4. Install the core softwares:
    ```
    ~$ sudo apt install terminator zsh golang
    ~$ go get -u github.com/justjanne/powerline-go
    ```

5. ```git clone https://github.com/zsh-users/antigen.git ~/opt/antigen```
6. Update powerline fonts
    ```
    ~$ git clone https://github.com/powerline/fonts.git --depth=1
    ~$ cd fonts
    ~$ ./install.sh
    ~$ cd ..
    ~$ rm -rf fonts
    ```
7. ```chsh -s $(which zsh)```


If using i3, also install conky

