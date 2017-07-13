=================================================
Git - Windows
=================================================

### Configurer Git
    set PATH=C:\Program Files\Git\bin

### V�rifier les r�glages
    git config --list

### Configurer le nom d'utilisateur
    git config --global user.name "Gerard KESSE"

### Configurer l'adresse email
git config --global user.email tiakagerard@hotmail.com

### Configurer l��diteur de texte
git config --global core.editor "'C:/Program Files (x86)/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"

-------------------------------------------------

Git - ReadyDev
=================================================

# V�rifier les r�glages
git config --list

# Configurer le nom d'utilisateur
git config --global user.name "Gerard KESSE"

# Configurer l'adresse email
git config --global user.email tiakagerard@hotmail.com

# Configurer l��diteur de texte
git config --global core.editor nano

# Initialiser un d�p�t Git
git init

# Configurer les patrons de noms de fichiers � ignorer
echo "" >> .gitignore

# Ajouter un dep�t distant
git remote add origin https://github.com/gkesse/ReadyDev.git

# Suivre tous les fichiers non suivis
git add --all

# Valider les modifications
git commit -m "Initial Commit"
git commit -am "Initial Commit"

# Pousser une branche sur un serveur distant
git push -u origin master
----------
gkesse
git46RDv

# Afficher l'�tat d'un d�p�t Git
git status

# Afficher les serveurs distants
git remote
git remote -v

#================================================
# Git - ReadyDB
#================================================

# V�rifier les r�glages
git config --list

# Configurer le nom d'utilisateur
git config --global user.name "Gerard KESSE"

# Configurer l'adresse email
git config --global user.email tiakagerard@hotmail.com

# Configurer l��diteur de texte
git config --global core.editor nano

# Initialiser un d�p�t Git
git init

# Ajouter un dep�t distant
git remote add origin https://github.com/gkesse/ReadyDB.git

# R�cup�rer les donn�es d'un d�p�t distant
git fetch origin

# fusionner la branche courante avec une branche distante
git merge origin/master

# Suivre tous les fichiers non suivis
git add --all

# Valider les modifications
git commit -m "Initial Commit"
git commit -am "Initial Commit"

# Pousser une branche sur un serveur distant
git push -u origin master
----------
gkesse
git46RDv

# Afficher l'�tat d'un d�p�t Git
git status

# Afficher les serveurs distants
git remote
git remote -v

# Afficher la liste des branches courantes
git branch
git branch -v

#------------------------------------------------
# Supprimer un fichier ou un r�pertoire suivi
git rm -r win\bin
git rm -r win\build
git rm win\Makefile*
git rm win\*user
----------
git rm -r unix/bin
git rm -r unix/build
git rm unix/Makefile*
git rm unix/*user

#================================================
# Git - ReadyDoc
#================================================

# V�rifier les r�glages
git config --list

# Configurer le nom d'utilisateur
git config --global user.name "Gerard KESSE"

# Configurer l'adresse email
git config --global user.email tiakagerard@hotmail.com

# Configurer l��diteur de texte
git config --global core.editor nano

# Initialiser un d�p�t Git
git init

# Ajouter un dep�t distant
git remote add origin https://github.com/gkesse/ReadyDoc.git

# Suivre tous les fichiers non suivis
git add --all

# Valider les modifications
git commit -m "Initial Commit"
git commit -am "Initial Commit"

# Pousser une branche sur un serveur distant
git push -u origin master
----------
gkesse
git46RDv

# Afficher l'�tat d'un d�p�t Git
git status

# Afficher les serveurs distants
git remote
git remote -v
