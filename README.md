# Krzysztof Magosa's dotfiles

* Emacs configuration
  * nice appearance
  * git integration
  * auto completion
  * projectile, helm, fiplr
  * os x clipboard integration
  * syntax:
    * go
    * python
    * c/c++
    * ruby
    * php
    * apache
    * nginx
    * markdown
    * html, blade
    * scss
    * yaml
    * json
    * js
    * cmake
    * shell
    * puppet
    * jinja2
* Oh My Zsh
* tig + tig-rebase

## Usage
```bash
git clone --recursive https://github.com/krzysztof-magosa/dotfiles.git ~/.dotfiles  
bash ~/.dotfiles/install.sh
```

## Git
To prevent people from accidentally committing under my name I have personal
git options moved to separate file ~/.gitconfig-local. Don't forget to set your
details there :)

```
[user]
    name = "Your Name"
    email = "your.email@example.com"
```
