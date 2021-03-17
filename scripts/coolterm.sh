#!/bin/bash

sudo apt install -y build-essential qmlscene qt5-qmake qt5-default qtdeclarative5-dev qml-module-qtquick-controls qml-module-qtgraphicaleffects qml-module-qtquick-dialogs qml-module-qtquick-localstorage qml-module-qtquick-window2 qml-module-qt-labs-settings qml-module-qt-labs-folderlistmodel

cd

git clone --recursive https://github.com/Swordfish90/cool-retro-term 

# Compile
cd cool-retro-term 
qmake 
make -j8 

cp -rf qmltermwidget/src/qmldir qmltermwidget/lib/kb-layouts qmltermwidget/lib/color-schemes qmltermwidget/src/QMLTermScrollbar.qml qmltermwidget/QMLTermWidget
