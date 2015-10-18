# Подготовка библиотек питона

С помощью `pip` установите следующие пакеты

```terminal
$ pip install pyflakes pep8 pylint ipython
```

# Сборка vim из исходников для Debian

Если у вас установлен vim, наберите в терминале

```terminal
$ vim --version
```

и посмотрите что выводит: `-python` или `+python`. Если `+python` то смело переходите на пункт "Применение конфига".

Если выводит `-python` или у вас не установлен vim, то вам надо собрать vim из исходников, иначе не все плагины будут работать корректно. Я буду собирать vim с поддержкой не только питона, но и других некоторых языков. Делаю я так, потому что я брал инстукцию [отсюда](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source), и я не знаю что будет, если я поменяю эти опции. Лучше я не буду рисковать, но если вы знаете что делаете, то можете собрать с другими опциями. Итак приступим.

1) Устанавливаем нужные пакеты

```terminal
$ sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial checkinstall
```

2) Удаляем старые версии vim

```terminal
$ sudo apt-get remove vim vim-runtime gvim vim-tiny vim-common vim-gui-common
```

3) Клонируем с удаленного репозитория

```terminal
$ hg clone https://code.google.com/p/vim/
```

4) Собираем и устанавливаем vim

```terminal
$ cd vim
$ ./configure --with-features=huge --enable-multibyte --enable-rubyinterp --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config --enable-perlinterp --enable-luainterp --enable-gui=gtk2 --enable-cscope --prefix=/usr
$ make VIMRUNTIMEDIR=/usr/share/vim/vim74
$ sudo checkinstall
```

5) Устанавливаем этот vim в качестве редактора по умолчанию с помощью update-alternatives

```terminal
$ sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
$ sudo update-alternatives --set editor /usr/bin/vim
$ sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
$ sudo update-alternatives --set vi /usr/bin/vim
```

6) Удерживаем пакет vim от обновления. Для этого добавим в конец файла `/etc/apt/preferences` следующую запись

```
Package: vim
Pin: version 7.3.*
Pin-Priority: -10
```

и обновим индекс пакетов

```terminal
$ sudo apt-get update
```

# Применение конфига

1) Скопируйте репозиторий в папку `~/dotvim`

```terminal
$ git clone https://github.com/iTeam91/dotvim.git ~/dotvim
```

2) Обновите [Vundle](https://github.com/gmarik/Vundle.vim)

```terminal
$ git clone https://github.com/gmarik/Vundle.vim.git ~/dotvim/bundle/Vundle.vim
```

3) Сделайте символические ссылки

```terminal
$ ln -s ~/dotvim ~/.vim
$ ln -s ~/dotvim/vimrc ~/.vimrc
```

4) Запустите vim со следующими опциями

```terminal
$ vim +PluginInstall +qall
```

Выйдет предупреждение, игнорируйте его нажав `Enter`. Начнется установка плагинов, после чего vim автоматически закроется. Все готово.

