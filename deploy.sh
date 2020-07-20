#! /bin/bash

git add -A
git commit -m 'edit contents'
git push origin master

ssh jaedsada.me << EOF
    sudo git -C ~/thnovice.me/init/ pull origin master
EOF