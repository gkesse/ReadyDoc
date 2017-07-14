#================================================
# D�marrage rapide - Installation de Git
#================================================

# installer les outils basiques de Git sur Linux
sudo -i

apt-get update
apt-get upgrade

apt-get install git-all

# definir la langue
export LANG=fr_FR.UTF-8

#------------------------------------------------
# installer les d�pendances
apt-get install libcurl4-gnutls-dev 
apt-get install libexpat1-dev 
apt-get install gettext
apt-get install libz-dev 
apt-get install libssl-dev    

# compiler et installer
tar -zxf git-1.9.1.tar.gz
cd git-1.9.1
make configure
./configure --prefix=/usr
make all doc info
sudo make install install-doc install-html install-info

# obtenir Git par Git lui-m�me pour les mises � jour
git clone git://git.kernel.org/pub/scm/git/git.git

#================================================
# D�marrage rapide - Param�trage � la premi�re utilisation de Git
#================================================

# renseigner votre nom et votre adresse de courriel
git config --global user.name "Kernelly Blavatsky"
git config --global user.email kernelly.blavatsky@outlook.fr

#------------------------------------------------
# configurer l��diteur de texte
git config --global core.editor nano

#------------------------------------------------
# v�rifier vos r�glages
git config --list

# v�rifier la valeur effective d�un param�tre particulier
git config <param�tre>

git config user.name

#================================================
# D�marrage rapide - Obtenir de l�aide
#================================================

# obtenir les pages de manuel pour toutes les commandes de Git
git help <commande>
git <commande> --help
man git-<commande>

# obtenir la page de manuel pour la commande config
git help config

#================================================
# Les bases de Git - D�marrer un d�p�t Git
#================================================

# Initialisation d�un d�p�t Git dans un r�pertoire existant
git init

# suivre un nouveau fichier
git add *.c
git add LICENSE

# Valider vos modifications
git commit -m 'initial project version'

#------------------------------------------------
# Cloner un d�p�t existant
git clone [url]

# cloner la biblioth�que logicielle Git appel�e libgit2
git clone https://github.com/libgit2/libgit2

# cloner le d�p�t dans un r�pertoire nomm� diff�remment
git clone https://github.com/libgit2/libgit2 monlibgit2

#================================================
# Les bases de Git - Enregistrer des modifications dans le d�p�t
#================================================

# V�rifier l��tat des fichiers
git status

# ajouter un nouveau fichier au projet 
echo 'Mon Projet' > LISEZMOI

# suivre un nouveau fichier
git add LISEZMOI

# apporter encore une petite modification au fichier
nano CONTRIBUTING.md

# prendre en compte l��tat actuel de la copie de travail
git add CONTRIBUTING.md

# voir les modifications de fa�on plus compacte
git status -s

#------------------------------------------------
# �num�rer les patrons de noms de fichiers � ignorer
.gitignore

# visualiser un fichier
cat .gitignore

# ignorer tout fichier se terminant en .o ou .a
*.[oa]

# ignorer tous les fichiers se terminant par un tilde (~)
*~

# r�gles de construction des patrons
->  les lignes vides ou commen�ant par # sont ignor�es ;
->  les patrons standards de fichiers sont utilisables ;
->  si le patron se termine par une barre oblique (/), 
il indique un r�pertoire ;
->  un patron commen�ant par un point d�exclamation (!)
indique des fichiers � inclure malgr� les autres r�gles.

# Les patrons standards de fichiers
->  (*) correspond � un ou plusieurs caract�res
->  [abc] correspond � un des trois caract�res list�s
->  (?) correspond � un unique caract�re
->  ([0-9]) correspond � un caract�re dans l�intervalle
->  a/**/z correspond donc � a/z, a/b/z, a/b/c/z etc...

# pas de fichier .a
*.a

# mais suivre lib.a malgr� la r�gle pr�c�dente
!lib.a

# ignorer uniquement le fichier TODO � la racine du projet
/TODO

# ignorer tous les fichiers dans le r�pertoire build
build/

# ignorer doc/notes.txt, mais pas doc/server/arch.txt
doc/*.txt

# ignorer tous les fichiers .txt sous le r�pertoire doc/
doc/**/*.txt

#------------------------------------------------
# visualiser ce qui a �t� modifi� mais pas encore index�
git diff

# comparer les fichiers index�s et le dernier instantan�
git diff --staged

# visualiser ce qui a �t� index� jusqu�� maintenant
git diff --cached

#------------------------------------------------
# Valider vos modifications
git commit

# sp�cifier votre message de validation 
git commit -m "Story 182: Fix benchmarks for speed"

# placer automatiquement tout fichier d�j� en suivi de version
# dans la zone d�index avant de r�aliser la validation
git commit -a -m 'added new benchmarks'

#------------------------------------------------
# effacez simplement le fichier dans votre copie de travail
rm PROJECTS.md

# l�effacement du fichier est index�
git rm PROJECTS.md

# abandonner le suivi de version d�un fichier
git rm --cached LISEZMOI

# sp�cifier des noms de fichiers ou de r�pertoires, 
# ou des patrons de fichiers
git rm log/\*.log

# �liminer tous les fichiers se terminant par ~
git rm \*~

#------------------------------------------------
# renommer un fichier
git mv nom_origine nom_cible

git mv LISEZMOI.txt LISEZMOI

#================================================
# Les bases de Git - Visualiser l�historique des validations
#================================================

# �num�rer en ordre chronologique invers� les commits r�alis�s
git log

# montrer les diff�rences introduites entre chaque validation
# limiter la sortie de la commande aux deux entr�es les plus r�centes
git log -p -2

# visualiser des statistiques r�sum�es pour chaque commit
git log --stat    

# afficher chaque commit sur une seule ligne
git log --pretty=oneline

# d�crire pr�cis�ment le format de sortie
git log --pretty=format:"%h - %an, %ar : %s"

# ajouter un joli graphe en caract�res ASCII
# pour d�crire l�historique des branches et fusions
git log --pretty=format:"%h %s" --graph

#------------------------------------------------
# affiche la liste des commits des deux derni�res semaines
git log --since=2.weeks

# trouver la derni�re validation qui a ajout� ou retir�
# une r�f�rence � une fonction sp�cifique
git log -Snom_de_fonction

# visualiser quels commits modifiant les fichiers de test 
# dans l�historique du code source de Git ont �t� valid�s 
# par Junio Hamano
git log --pretty="%h - %s" --author=gitster \
--since="2008-10-01" --before="2008-11-01" \
--no-merges -- t/

#================================================
# Les bases de Git - Annuler des actions
#================================================

# rectifier le message de validation
git commit --amend

# d�sindexer un fichier
git reset HEAD CONTRIBUTING.md

# annuler des modifications
git checkout -- CONTRIBUTING.md

#------------------------------------------------
# R�initialiser un fichier modifi�
git checkout -- GAnnuler.c

#================================================
# Les bases de Git - Travailler avec des d�p�ts distants
#================================================

# visualiser les serveurs distants
git remote    

# nom par d�faut que Git donne au serveur � partir 
# duquel vous avez clon�
origin

# montrer l�URL que Git a stock�e pour chaque nom court
git remote -v

# ajouter un nouveau d�p�t distant Git comme nom court
git remote add [nomcourt] [url]

git remote add pb https://github.com/paulboone/ticgit

# r�cup�rer toute l�information que Paul a mais que vous 
# ne souhaitez pas l�avoir encore dans votre branche
git fetch pb

#------------------------------------------------
# obtenir les donn�es des d�p�ts distants
git fetch [remote-name]

# r�cup�rer tout ajout qui a �t� pouss� vers ce d�p�t 
# depuis que vous l�avez clon�
git fetch origin

#------------------------------------------------
# Pousser son travail sur un d�p�t distant
git push [nom-distant] [nom-de-branche]

# pousser votre travail vers le serveur amont
git push origin master

#------------------------------------------------
# Inspecter un d�p�t distant
git remote show [nom-distant]

# donner la liste des URL pour le d�p�t distant ainsi que 
# la liste des branches distantes suivies
git remote show origin

# renommer des d�p�ts distants
git remote rename pb paul

# retirer un d�p�t distant
git remote rm paul

#================================================
# Les bases de Git - �tiquetage
#================================================

# Lister les �tiquettes existantes
git tag

# rechercher les �tiquettes correspondant � un motif
git tag -l 'v1.8.5*'

# Cr�er des �tiquettes annot�es
git tag -a v1.4 -m 'ma version 1.4'

# visualiser les donn�es de l��tiquette � c�t� du commit
git show v1.4

# cr�er une �tiquette l�g�re
git tag v1.4-lg

# visualiser les donn�es de l��tiquette l�g�re � c�t� 
# du commit
git show v1.4-lg

# �tiqueter des commits plus anciens
git tag -a v1.2 9fceb02

# Partager les �tiquettes
git push origin [nom-du-tag]

# pousser les �tiquettes apr�s les avoir cr��es localement
git push origin v1.5

# transf�rer toutes les nouvelles �tiquettes vers le 
# serveur distant
git push origin --tags

# cr�er une branche � partir de cette �tiquette
git checkout -b version2 v2.0.0

#================================================
# Les bases de Git - Les alias Git
#================================================

# d�finir un alias pour chaque commande
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

# utiliser les alias
git checkout -> git co
git branch -> git br
git commit -> git ci
git status -> git st

# cr�er un alias pour d�sindexer
git config --global alias.unstage 'reset HEAD --'

# utiliser un alias pour d�sindexer
git reset HEAD fileA -> 
git unstage fileA

# ajouter un alias last
git config --global alias.last 'log -1 HEAD'

# utiliser un alias last
git log -1 HEAD ->
git last

# �crivez vos propres outils pour travailler dans un d�p�t
git config --global alias.visual "!gitk"

# utiliser vos propres outils pour travailler dans un d�p�t
git visual -> gitk

#================================================
# Les branches avec Git - Les branches en bref
#================================================

# Cr�er une nouvelle branche
git branch testing

# pointeur vers la branche principale
master

# pointeur vers la branche actuelle
HEAD

# v�rifier les branches point�es
git log --oneline --decorate

# basculer sur une branche existante
git checkout testing

# Retournons sur la branche master
git checkout master

# afficher l�historique de vos commits avec des graphes
git log --oneline --decorate --graph --all

#================================================
# Les branches avec Git - Branches et fusions : les bases
#================================================

# cr�er une branche et y basculer tout de suite
git checkout -b prob53

# fusionner les branches correctif et master
git checkout master
git merge correctif

# effacer la branche correctif 
git branch -d correctif

# fusion avanc�e rapide
git checkout master
git merge correctif
----------
Updating f42c576..3a0874c
Fast-forward

# fusion � trois sources
git checkout master
git merge correctif
----------
Merge made by the 'recursive' strategy.

# fusion conflit
git checkout master
git merge correctif
----------
Auto-merging index.html
CONFLICT (content): Merge conflict in index.html
Automatic merge failed; fix conflicts and then commit the result.

#================================================
# Les branches avec Git - Gestion des branches
#================================================

# obtenir la liste des branches courantes
git branch

# visualiser la liste des derniers commits sur chaque branche
git branch -v    

# Marque de la branche actuelle point�e par HEAD
git branch
----------
* master

# voir quelles branches ont d�j� �t� fusionn�es 
git branch --merged

# visualiser les branches qui contiennent des travaux qui 
# n�ont pas encore �t� fusionn�s
git branch --no-merged

#================================================
# Les branches avec Git - Branches distantes
#================================================

# obtenir la liste compl�te de ces r�f�rences distantes
git ls-remote
git remote show

# nom par d�faut de la branche locale
master

# nom par d�faut du serveur distant
origin

# nom par d�faut de la branche distante
origin/master

# synchroniser vos travaux
git fetch origin

# ajouter un serveur aux r�f�rences distantes
git remote MY_REF MY_SERVER

# synchroniser vos travaux � partir d'une r�f�rence
git fetch MY_REF

# nom par d�faut de la branche distante d'une r�f�rence
MY_REF/master

# pousser une branche sur un serveur distant
git push (serveur distant) (branche)
git push origin correctionserveur

# pousser une branche locale vers une branche distante #
# nomm�e diff�remment
git push origin correctionserveur:branchegeniale

# configurer ce d�lai de mise en cache
git config --global credential.helper cache

# fusionner ce travail dans votre branche de travail actuelle
git merge origin/correctionserveur

# cr�er votre propre branche correctionserveur pour 
# pouvoir y travailler
git checkout -b correctionserveur origin/correctionserveur

# cr�er une branche locale avec le m�me nom que celui 
# de la branche distante
git checkout --track origin/correctionserveur

# cr�er une branche locale avec le m�me nom que
# celui de la branche distante
git checkout -b cs origin/correctionserveur

# associer une branche locale � une branche distante
git branch -u origin/correctionserveur

# voir quelles branches de suivi vous avez configur�es
git branch -vv

# 2 commits locaux qui n�ont pas �t� pouss�s au serveur
git branch -vv
----------
iss53     7e424c3 [origin/iss53: ahead 2]
ahead 2

# branche suivie et � jour
git branch -vv
----------
master    1ae2a45 [origin/master]

# 1 commit qui n�a pas �t� encore int�gr� localement
git branch -vv
----------
correctionserveur f8674d9 [equipe1/correction-serveur-ok: ahead 3, behind 1]
----------
behind 1

# branche locale qui ne suit aucune branche distante
git branch -vv
----------
test   5ea463a

# synchroniser (fetch) toutes vos branches distantes 
# depuis les serveurs
git fetch --all

# r�cup�rer et fusionner une branche distante
git pull

# effacer une branche distante
git push origin --delete correctionserveur

#================================================
# Les branches avec Git - Rebaser (Rebasing)
#================================================

# rebaser une branche simple
git checkout experience
git rebase master
git checkout master
git merge client
git branch -d client

# rebaser une branche complexe
git rebase --onto master serveur client

# rebaser une branche simple ind�pendant
git rebase master serveur
git checkout master
git merge serveur
git branch -d serveur

# Les dangers du rebasage
-> Ne rebasez jamais des commits qui ont d�j� �t� pouss�s 
sur un d�p�t public. (vous abandonnez les commits existants)

# forcer l��crasement de l�historique sur le serveur
git push --force

# Rebaser au-dessus de travaux rebas�s
git rebase equipe1/master

# Rebaser au-dessus de travaux rebas�s simple
git pull --rebase

# changer la valeur du param�tre de configuration 
# pull.rebase
git config --global pull.rebase true

#================================================
# Git sur le serveur - Protocoles
#================================================

# Protocoles utilis�s
-> local
-> HTTP
-> Secure Shell (SSH)
-> Git

# cloner un d�p�t local
git clone /opt/git/project.git

# cloner un d�p�t local avec file
git clone file:///opt/git/project.git

# ajouter un d�p�t local � un projet Git existant
git remote add local_proj /opt/git/project.git

# r�cup�rer un d�pot local
git pull /home/john/project

# URL utilis� via le protocole HTTP intelligent
# URL pour visualiser le d�p�t distant (GitHub)
https://github.com/schacon/simplegit

# permettre un acc�s en lecture seule � votre d�p�t 
# via le protocole HTTP idiot
cd /var/www/htdocs/
git clone --bare /chemin/vers/projet_git projetgit.git
cd projetgit.git
mv hooks/post-update.sample hooks/post-update
chmod a+x hooks/post-update

# cloner un d�p�t distant via le protocole HTTP idiot 
git clone https://exemple.com/projetgit.git

# cloner un d�p�t Git � travers SSH
git clone ssh://utilisateur@serveur/projet.git

# cloner un d�p�t Git � travers SSH avec la syntaxe SCP
git clone utilisateur@serveur:projet.git

# Port d�di� au daemon Git
-> 9418

# Pour qu�un d�p�t soit publi� via le protocole Git
-> daemon : xinetd 
-> fichier : git-daemon-export-ok

#================================================
# Git sur le serveur - Installation de Git sur un serveur
#================================================

# cloner votre d�p�t en cr�ant un nouveau d�p�t nu
git clone --bare mon_project mon_projet.git

# cloner votre d�p�t en cr�ant un nouveau d�p�t nu
# �quivalence
cp -Rf mon_projet/.git mon_projet.git

# Copie du d�p�t nu sur un serveur via le protocole SSH
scp -r mon_projet.git utilisateur@git.exemple.com:/srv/git

# cloner votre d�p�t via le protocole SSH
git clone utilisateur@git.exemple.com:/srv/git/mon_projet.git

# ajouter automatiquement les droits de groupe en �criture 
# � un d�p�t
ssh utilisateur@git.exemple.com
cd /srv/git/mon_projet.git
git init --bare --shared

#================================================
# Git sur le serveur - G�n�ration des cl�s publiques SSH
#================================================

# v�rifier si vous avez d�j� une cl� publique SSH
cd ~/.ssh
ls
----------
id_rsa -> cl� priv�
id_rsa.pub -> cl� publique

# g�n�rer une cl� publique
ssh-keygen
File -> ENTER
Passphrase -> ENTER
Same Passphrase -> ENTER

# afficher la cl� publique
cat ~/.ssh/id_rsa.pub

#================================================
# Git sur le serveur - Mise en place du serveur
#================================================

# cr�er un utilisateur git et un r�pertoire .ssh
sudo adduser git
su git
cd
mkdir .ssh && chmod 700 .ssh
touch .ssh/authorized_keys && chmod 600 .ssh/authorized_keys

# ajouter les cl�s publiques au fichier authorized_keys 
# de l�utilisateur git
cat /tmp/id_rsa.john.pub >> ~/.ssh/authorized_keys
cat /tmp/id_rsa.josie.pub >> ~/.ssh/authorized_keys
cat /tmp/id_rsa.jessica.pub >> ~/.ssh/authorized_keys

# cr�er un d�p�t vide nu
cd /opt/git
mkdir project.git
cd project.git
git init --bare

# pousser la premi�re version de leur projet vers ce d�p�t
cd monproject
git init
git add .
git commit -m 'premi�re validation'
git remote add origin git@gitserveur:/opt/git/projet.git
git push origin master

# cloner le d�p�t et y pousser leurs modifications
git clone git@gitserveur:/opt/git/projet.git
cd projet
nano LISEZMOI
git commit -am 'correction du fichier LISEZMOI'
git push origin master

# voir si `git-shell` est d�j� d�clar�
cat /etc/shells

# s'assurer que git-shell est install� sur le syst�me
which git-shell

# ajouter le chemin complet vers git-shell
sudo nano /etc/shells 

# �diter le shell de l�utilisateur
chsh <utilisateur> -s <shell>
sudo chsh git -s `which git-shell`

# v�rifier que l�utilisateur git ne peut plus utiliser 
# la connexion SSH pour pousser et tirer sur des d�p�ts Git
ssh git@gitserveur
----------
fatal: Interactive git shell is not enabled.

#================================================
# Git sur le serveur - D�mon (Daemon) Git
#================================================

# mettre en place le protocole Git
git daemon --reuseaddr --base-path=/opt/git/ /opt/git/
----------
--reuseaddr : red�marrer sans devoir attendre que 
les anciennes connexions expirent 
----------
--base-path : cloner des projets sans devoir sp�cifier 
le chemin complet
----------
/opt/git/ : endroit o� chercher des d�p�ts � exporter

# Si vous utilisez un pare-feu
-> rediriger le port 9418

# Transformer ce processus en daemon
/etc/event.d/local-git-daemon
----------
start on startup
stop on shutdown
exec /usr/bin/git daemon \
--user=git --group=git \
--reuseaddr \
--base-path=/opt/git/ \
/opt/git/
respawn

# d�marrer automatiquement votre daemon Git 
initctl start local-git-daemon

# sp�cifier � Git quels d�p�ts sont autoris�s en acc�s 
# non authentifi�
cd /chemin/au/projet.git
touch git-daemon-export-ok

# cr�er un fichier vide
touch MY_FILE

#================================================
# Git sur le serveur - HTTP intelligent
#================================================

# installer un serveur web apache
sudo apt-get install apache2 apache2-utils
a2enmod cgi alias env (1)
----------
-> (1) : activer les modules mod_cgi, mod_alias, et mod_env

# ajouter quelques lignes � la configuration d�Apache
SetEnv GIT_PROJECT_ROOT /opt/git
SetEnv GIT_HTTP_EXPORT_ALL
ScriptAlias /git/ /usr/libexec/git-core/git-http-backend/

# indiquer � Apache qu�il doit accepter les requ�tes 
# sur ce chemin
<Directory "/usr/lib/git-core*">
Options ExecCGI Indexes
Order allow,deny
Allow from all
Require all granted
</Directory>

# cr�er un fichier .htaccess contenant les mots de 
# passe de tous les utilisateurs valides
htdigest -c /opt/git/.htpasswd "Git Access" schacon

#================================================
# Git sur le serveur - GitWeb
#================================================

# serveur l�ger
lighttpd 
webrick 

# d�marrer une instance temporaire de serveur GitWeb
git instaweb --httpd=webrick

# arr�ter une instance temporaire de serveur GitWeb
git instaweb --httpd=webrick --stop

# g�n�rer un script CGI personnalis�
git clone git://git.kernel.org/pub/scm/git/git.git
cd git/
make GITWEB_PROJECTROOT="/opt/git" prefix=/usr gitweb
sudo cp -Rf gitweb /var/www/

# param�trer dans Apache l�utilisation de CGI pour ce script
<VirtualHost *:80>
ServerName gitserver
DocumentRoot /var/www/gitweb
<Directory /var/www/gitweb>
Options ExecCGI +FollowSymLinks +SymLinksIfOwnerMatch
AllowOverride All
order allow,deny
Allow from all
AddHandler cgi-script cgi
DirectoryIndex gitweb.cgi
</Directory>
</VirtualHost>

# visualiser vos d�p�ts en ligne
http://gitserveur/

#================================================
# Git sur le serveur - GitLab
#================================================

# t�l�charger une image de machine virtuelle ou un installateur rapide
https://bitnami.com/stack/gitlab

# acc�der � l'�cran d�identification
alt + ->
----------
-> indique l�adresse IP, l�utilisateur et le mot de passe 
par d�faut de l�instance GitLab

# suivre les instructions du readme du GitLab Community Edition
https://gitlab.com/gitlab-org/gitlab-ce/tree/master

# utilisateur par d�faut
admin@local.host

# mot de passe par d�faut
5iveL!fe

# URL du projet de l�utilisateur jane avec un projet appel� projet
http://serveur/jane/projet

# supprimer un utilisateur
-> Bloquer (Blocking) un utilisateur l�emp�che de s�identifier 
sur l�instance Gitlab
-> D�truire (Destroying) un utilisateur, par contre, l�efface 
compl�tement de la base de donn�es et du syst�me de fichiers

# groupe GitLab
-> assemblage de projets, accompagn� des informations de droits 
d�acc�s � ces projets

# projet GitLab
-> correspond grossi�rement � un d�p�t Git unique

# premi�re chose � faire avec GitLab
-> cr�er un nouveau projet : cliquer sur l�ic�ne + sur la barre d�outils
-> connecter un nouveau projet � un d�p�t Git local

# cr�er un d�p�t distant nomm� gitlab pointant vers l�h�bergement distant
git remote add gitlab https://serveur/espace_de_nom/projet.git

# cr�er une copie locale du d�p�t
git clone https://serveur/espace_de_nom/projet.git

# coop�rer sur un projet GitLab
-> donner � un autre utilisateur un acc�s direct en �criture 
sur le d�p�t Git
-> utiliser des requ�tes de tirage (pull request)

# ajouter un utilisateur � un projet
-> s�lectionner la section Members des param�tres du projet
-> associer le nouvel utilisateur � un niveau d�acc�s

# niveau d�acc�s Developer
-> permet pousser des commits et des branches directement 
sur le d�p�t sans restriction

# requ�tes de tirage (pull request)
-> permet � n�importe quel utilisateur qui peut voir le 
projet d�y contribuer de mani�re contr�l�e

# utilisateurs avec un acc�s direct
-> cr�er une branche
-> pousser des commits dessus
-> ouvrir une requ�te de tirage (pull request) depuis leur branche 
vers master ou toute autre branche

# utilisateurs qui n�ont pas la permission de pousser sur un d�p�t
-> faire un fork (cr�er leur propre copie)
-> pousser des commits sur cette copie
-> ouvrir une requ�te de tirage (pull request) depuis leur fork 
vers le projet principal
----------
-> permet au propri�taire de garder le contr�le total sur ce qui 
entre dans le d�p�t et quand, tout en autorisant les contributions 
des utilisateurs non fiables

# requ�tes de fusion (merge requests) et les probl�mes (issues)
-> principaux moyens pour mener des discussions au long cours 
dans GitLab
----------
-> peuvent �tre assign�s � des utilisateurs
-> peuvent �tre assembl�s en jalons (milestones)

# requ�te de fusion (merge requests)
-> permet une discussion ligne par ligne sur les modifications 
propos�es, ainsi qu�un fil de discussion g�n�ral. 
----------
-> permet une sorte de revue de code l�g�re

# h�berger vos projets Git sur un site externe 
# d�di� � l�h�bergement
https://git.wiki.kernel.org/index.php/GitHosting

#================================================
# Git distribu� - D�veloppements distribu�s
#================================================

# Gestion Centralis�e
-> Un concentrateur ou d�p�t central accepte le code 
et tout le monde doit synchroniser son travail avec
-> Les d�veloppeurs sont des n�uds, des consommateurs du 
concentrateur, seul endroit o� ils se synchronisent
-> le premier � pousser ses modifications le fera 
sans encombre
-> Le second d�veloppeur doit fusionner les 
modifications du premier dans son d�p�t local avant de
pousser ses modifications pour ne pas �craser les 
modifications du premier

# Mode du gestionnaire d�int�gration
-> mode de fonctionnement o� chaque d�veloppeur a un acc�s 
en �criture � son propre d�p�t public et en lecture � tous 
ceux des autres
-> un d�p�t canonique repr�sente le projet � officiel �

# Mode du gestionnaire d�int�gration
# contribuer au projet
-> cr�ez votre propre clone public du projet et poussez 
vos modifications dessus
-> envoyer une demande au mainteneur de projet pour qu�il 
tire vos modifications dans le d�p�t canonique

# Mode du gestionnaire d�int�gration
# mainteneur
-> ajouter votre d�p�t comme d�p�t distant, 
-> tester vos modifications localement, 
-> les fusionner dans sa branche 
-> et les pousser vers le d�p�t public

# Mode du gestionnaire d�int�gration
# fonctionnement
-> Le mainteneur du projet pousse vers son d�p�t public.
-> Un contributeur clone ce d�p�t et introduit 
des modifications.
-> Le contributeur pousse son travail sur son d�p�t public.
-> Le contributeur envoie au mainteneur un e-mail 
de demande pour tirer ses modifications depuis son d�p�t.
-> Le mainteneur ajoute le d�p�t du contributeur comme 
d�p�t distant et fusionne les modifications localement.
-> Le mainteneur pousse les modifications fusionn�es 
sur le d�p�t principal.

# Mode dictateur et ses lieutenants
-> utile dans des projets tr�s gros ou pour lesquels 
un ordre hi�rarchique existe
-> variante de la gestion multi-d�p�t
-> Des gestionnaires d�int�gration g�rent certaines 
parties du projet. Ce sont les lieutenants
-> Tous les lieutenants ont un unique gestionnaire 
d�int�gration, le dictateur bienveillant
-> Le d�p�t du dictateur sert de d�p�t de r�f�rence � 
partir duquel tous les collaborateurs doivent tirer

# Mode dictateur et ses lieutenants
# fonctionnement
-> Les simples d�veloppeurs travaillent sur la branche 
th�matique et rebasent leur travail sur master. 
La branche master est celle du dictateur.
-> Les lieutenants fusionnent les branches th�matiques 
des d�veloppeurs dans leur propre branche master.
-> Le dictateur fusionne les branches master de 
ses lieutenants dans sa propre branche master.
-> Le dictateur pousse sa branche master sur le d�p�t de 
r�f�rence pour que les d�veloppeurs se rebasent dessus.

#================================================
# Git distribu� - Contribution � un projet
#================================================

# r�aliser la contribution � un projet
-> taille du corps de contributeurs
-> mode de gestion utilis� pour le projet
-> gestion des acc�s en �criture

# cr�er des commits qui serviront � fournir des patchs
-> ne pas soumettre de patchs comportant des erreurs 
d�espace (caract�res espace inutiles en fin de ligne ou 
entrelacement d�espaces et de tabulations). 

# v�rifier les patchs avant de valider
git diff --check

# indexer partiellement des fichiers
git add --patch

# �crire des messages de validation
-> d�buter par une ligne unique d�au plus 50 caract�res
-> suivie d�une ligne vide, 
-> suivie d�une explication plus d�taill�e

# explication d�taill�e
-> inclue la motivation de la modification en contrastant 
le nouveau comportement par rapport � l�ancien
-> utiliser le pr�sent de l�imp�ratif ou des verbes 
substantiv�s dans le message
-> utilisez des ordres

# explication d�taill�e
# exemples
-- Au lieu de dire :
-> � J�ai ajout� des tests pour � ou 
-> � En train d�ajouter des tests pour �
----------
-- Dire:
-> � Ajoute des tests pour �
-> � Ajout de tests pour �

#------------------------------------------------
# Cas d�une petite �quipe priv�e

# John, clone le d�p�t, fait une modification et valide 
# localement
git clone john@githost:simplegit.git
cd simplegit/
vim lib/simplegit.rb
git commit -am 'Eliminer une valeur par d�faut invalide'

# Jessica, fait la m�me chose. 
# Elle clone le d�p�t et valide une modification
git clone jessica@githost:simplegit.git
cd simplegit/
vim TODO
git commit -am 'Ajouter une tache reset'

# Jessica pousse son travail sur le serveur
git push origin master

# John tente aussi de pousser ses modifications
git push origin master
----------
error: impossible de pousser des r�f�rences 
vers 'john@githost:simplegit.git'
----------
Git n�cessite une fusion des modifications locale

# John doit r�cup�rer les modifications de Jessica 
# et les fusionner avant d��tre autoris� � pousser
git fetch origin
git merge origin/master
git push origin master

# Jessica a travaill� sur une branche th�matique. 
# Elle a cr�� une branche th�matique nomm�e prob54 
# et r�alis� trois validations sur cette branche. 
----------

# Jessica souhaite se synchroniser sur le travail de John
git fetch origin

# Jessica pense que sa branche th�matique est pr�te 
# mais elle souhaite savoir si elle doit fusionner son travail 
# avant de pouvoir pousser.  
git log --no-merges issue54..origin/master

# ne montrer que la liste des commits qui sont sur la seconde 
# branche (dans ce cas origin/master) et qui ne sont pas sur 
# la premi�re (dans ce cas issue54).
git log --no-merges issue54..origin/master
----------
issue54..origin/master

# Jessica peut fusionner sa branche th�matique (issue54) dans 
# sa branche (master), fusionner le travail de John (origin/master)
# dans sa branche (master), puis pousser le r�sultat sur le serveur. Premi�rement, elle rebascule sur sa branche master pour int�grer son travail :
git checkout master
git merge issue54
git push origin master

# un des sch�mas les plus simples
-> travaillez sur une branche th�matique
-> fusionnez dans votre branche master
-> r�cup�rez origin/master et la fusionnez si elle a chang�
-> poussez le r�sultat sur la branche master du serveur.

#------------------------------------------------
# �quipe priv�e importante

# mode d�op�ration de type � gestionnaire d�int�gration �
-> John et Jessica travaillent sur une premi�re fonctionnalit�, 
-> tandis que Jessica et Josie travaillent sur une autre
-> le travail des groupes est int�gr� par certains ing�nieurs, 
-> le d�p�t principal ne peut �tre mise � jour que par ces ing�nieurs

# Jessica clone son d�p�t, 
# elle d�cide de travailler sur la fonctionA en premier. 
# Elle cr�e une nouvelle branche pour cette fonction 
# et travaille un peu dessus
git checkout -b fonctionA
vim lib/simplegit.rb
git commit -am 'Ajouter une limite � la fonction de log'

# Jessica pousse les commits de sa branche fonctionA sur le serveur
git push -u origin fonctionA

# Jessica envoie un courriel � John
-> elle a pouss� son travail dans la branche appel�e fonctionA
-> il peut l�inspecter

# Jessica d�cide de commencer � travailler sur la fonctionB 
# avec Josie
git fetch origin
git checkout -b fonctionB origin/master

# Jessica r�alise quelques validations sur la branche fonctionB
vim lib/simplegit.rb
git commit -am 'made the ls-tree function recursive'
vim lib/simplegit.rb
git commit -am 'add ls-files'

# Jessica re�oit un mail de Josie
-> une branche avec un premier travail a d�j� �t� pouss� 
sur le serveur en tant que fonctionBee

# Jessica r�cup�re les modifications de Josie
git fetch origin

# Jessica peut � pr�sent fusionner
git merge origin/fonctionBee

# Jessica doit pousser son travail fusionn� dans sa branche 
# fonctionB sur la branche fonctionBee du serveur
git push -u origin fonctionB:fonctionBee
----------
-> option -u : pour faciliter les pouss�es et les tirages

# John envoie un courriel � Jessica 
-> il a pouss� des modifications sur la branche fonctionA 
-> et lui demander de les v�rifier. 

# Jessica lance git fetch pour tirer toutes ces modifications 
git fetch origin

# Jessica peut voir ce qui a �t� modifi� avec git log
git log fonctionA..origin/fonctionA

# Jessica fusionne le travail de John dans sa propre branche fonctionA
git checkout fonctionA
git merge origin/fonctionA

# Jessica veut r�gler quelques d�tails. 
# Elle valide donc encore et pousse ses changements sur le serveur
git commit -am 'details regles'
git push

# Jessica, Josie et John informent les int�grateurs que les branches 
# fonctionA et fonctionB du serveur sont pr�tes

#------------------------------------------------
# Projet public dupliqu�

# Contribuer � un projet public est assez diff�rent
-> pr�senter le travail au mainteneur
-> vous n�avez pas la possibilit� de mettre � jour des branches 

# serveurs Git qui proposent facilement la duplication de d�p�t. 
-> GitHub, 
-> BitBucket, 
-> Google Code, 
-> repo.or.cz

# contributions 
-> sous forme de patch via courriel

# cloner le d�p�t principal, 
# cr�er une nouvelle branche th�matique pour le patch 
# ou la s�rie de patchs que seront votre contribution, 
git clone (url)
cd projet
git checkout -b fonctionA
git commit
git commit

# votre branche de travail est pr�te 
# et que vous �tes pr�t � la fournir au mainteneur
-> rendez-vous sur la page du projet 
-> et cliquez sur le bouton � Fork � 
-> pour cr�er votre propre projet dupliqu� 
-> sur lequel vous aurez les droits en �criture. 
-> Vous devez alors ajouter l�URL de ce nouveau d�p�t 
-> en tant que second d�p�t distant, dans notre cas nomm� macopie

# ajouter l�URL de ce nouveau d�p�t
git remote add macopie (url)

# pousser la branche sur laquelle vous travaillez 
# sur une branche distante
git push -u macopie fonctionA

# notifier le mainteneur
-> Ce processus est souvent appel� une demande de tirage (pull request) 
-> et vous pouvez la g�n�rer soit via le site web

# demande de tirage (pull request) 
git request-pull origin/master macopie

# soumettre un second sujet de travail au projet
git checkout -b fonctionB origin/master
-> (travail)
git commit
git push macopie fonctionB
-> (email au maintainer)
git fetch origin

# rebaser cette branche au sommet de origin/master, 
# r�soudre les conflits pour le mainteneur 
# et soumettre de nouveau vos modifications
git checkout fonctionA
git rebase origin/master
git push -f macopie fonctionA
----------
-> Historique ressemble � Historique des validations sur fonctionA
-> option -f : pour forcer le remplacement de la branche fonctionA

# d�marrez une nouvelle branche � partir de la branche origin/master 
# collez les modifications de fonctionB en r�solvant les conflits, 
# changez l�impl�mentation et poussez en tant que nouvelle branche
git checkout -b fonctionBv2 origin/master
git merge --no-commit --squash fonctionB
-> (changement d impl�mentation)
git commit
git push macopie fonctionBv2
----------
-> option --squash : prend tout le travail de la branche � fusionner 
et le colle dans un commit sans fusion au sommet de la branche extraite
-> option --no-commit : ne pas enregistrer automatiquement une validation

#------------------------------------------------
# Projet public via courriel

# grands projets
-> proc�dures �tablies pour accepter des patchs

# cr�ez une branche th�matique par s�rie de patchs 
# sur laquelle vous travaillez
git checkout -b topicA
-> (travail)
git commit
-> (travail)
git commit

# g�n�rer des fichiers au format mbox
git format-patch -M origin/master
----------
-> Cette commande transforme chaque commit en un message courriel 
-> dont le sujet est la premi�re ligne du message de validation 
-> et le corps contient le reste du message plus le patch correspondant
----------
-> format-patch : affiche les noms de fichiers de patch cr��s
-> option -M : suivre les renommages. 
----------
-> �diter ces fichiers de patch pour ajouter plus d�informations 
-> � destination de la liste de diffusion mais que vous ne souhaitez pas
-> voir appara�tre dans le message de validation

# contenu des fichiers ressemble
cat 0001-Ajout-d-une-limite-la-fonction-de-log.patch

# param�trer la section imap de votre fichier ~/.gitconfig
[imap]
folder = "[Gmail]/Drafts"
host = imaps://imap.gmail.com
user = utilisateur@gmail.com
pass = x67Nrs,/V:Xt84N
port = 993
sslverify = false

# votre serveur IMAP n�utilise pas SSL
-> host commencera par imap:// au lieu de imaps://

# placer la s�rie de patchs dans le r�pertoire Drafts du serveur IMAP
cat *.patch | git imap-send

# envoyer les patchs via un serveur SMTP
# param�trer la section � sendmail � dans votre fichier ~/.gitconfig
[sendemail]
smtpencryption = tls
smtpserver = smtp.gmail.com
smtpuser = user@gmail.com
smtpserverport = 587

# envoyer vos patchs
git send-email *.patch

#================================================
# Git distribu� - Maintenance d�un projet 
#================================================

# cr�e une branche � partir de master de la mani�re suivante
git branch sc/ruby_client master

# basculer imm�diatement dessus
git checkout -b sc/ruby_client master

# appliquer un patch dans une branche th�matique
git apply /tmp/patch-ruby-client.patch

# voir si un patch s�applique proprement avant de r�ellement l�appliquer
git apply --check 0001-seeing-if-this-helps-the-gem.patch

# appliquer un patch g�n�r� par format-patch
git am 0001-limit-log-function.patch

# validation g�n�r�e
git log --pretty=fuller -1

# continuer avec le patch suivant
git am --resolved
----------
git am --continue

#  appliquer des patchs conflictuels
git am -3 0001-seeing-if-this-helps-the-gem.patch

# appliquez des patchs en mode interactif
git am -3 -i mbox

# Jessica vous envoie un courriel indiquant qu�elle a une nouvelle 
# fonctionnalit� g�niale dans la branche ruby-client de son d�p�t, 
# vous pouvez la tester en ajoutant le d�p�t distant et en tirant 
# la branche localement
git remote add jessica git://github.com/jessica/monproject.git
git fetch jessica
git checkout -b rubyclient jessica/ruby-client

# r�aliser un tirage unique sans sauver l�URL comme r�f�rence distante
git pull https://github.com/pourunefois/projet

# Faire une revue de tous les commits
git log contrib --not master
----------
-> option --not : exclure les commits de la branche master
-> �quivalent au format : master..contrib

# visualiser un diff complet
git diff master

# anc�tre commun
git merge-base contrib master
----------
36c7dba2c95e6bbb78dfa822519ecfec6e1ca649

# comparer le dernier instantan� de la branche th�matique avec son 
# anc�tre commun � la branche master le plus r�cent
git diff 36c7db

# modifications que votre branche th�matique a introduites 
# depuis son anc�tre commun avec master
git diff master...contrib

# mode simple de fusion
-> master : contient le code stable
-> branche th�matique : fusionnez dans votre branche master puis effacez

# utiliser un cycle de fusion � deux �tapes
-> master : mis � jour seulement lors d�une version vraiment stable
-> develop : nouveau code

# quatre branches au long cours
-> master, 
-> next, 
-> pu (proposed updates : propositions) : pour les nouveaux travaux 
-> maint : pour les backports de maintenance

# tirer le commit e43a6 dans votre branche master
git cherry-pick e43a6fd3e94888d76779ad79fb568ed180e5fcdf

# apr�s s�lection d�un commit 
-> effacer votre branche th�matique 
-> et abandonner les commits que vous n�avez pas tir�s dans master

# activer la fonction Rerere
git config --global rerere.enabled true

# signer l��tiquette en tant que mainteneur
git tag -s v1.5 -m 'mon etiquette v1.5 sign�e'

# publier la cl� de votre trousseau 
gpg --list-keys
----------
pub   1024D/F721C45A 2009-02-09 [expires: 2010-02-09]

# importer la cl� directement dans la base de donn�es Git
gpg -a --export F721C45A | git hash-object -w --stdin
----------
659ef797d181633c87ec71ac3f9ba29fe5775b92

# cr�er une �tiquette qui pointe votre cl� dans Git 
git tag -a maintainer-pgp-pub 659ef797d181633c87ec71ac3f9ba29fe5775b92

# l��tiquette maintainer-pgp-pub sera partag�e publiquement
git push --tags

# v�rifier une �tiquette apr�s import direct de votre cl� publique PGP
git show maintainer-pgp-pub | gpg --import

# v�rifier vos �tiquettes sign�es
git show <�tiquette>

# g�n�rer un nom humainement lisible pour chaque commit
git describe master

# cr�er une archive du dernier instantan� de votre code
git archive master --prefix='projet/' | gzip > \
`git describe master`.tar.gz
ls *.tar.gz
----------
v1.6.2-rc1-20-g8c5b85c.tar.gz

# cr�er une archive au format zip
git archive master --prefix='project/' --format=zip > \
`git describe master`.zip

# obtenir rapidement une sorte de liste des modifications
git shortlog --no-merges master --not v1.0.1

#================================================
# GitHub - Configuration et param�trage d�un compte
#================================================

# cr�er un compte utilisateur gratuit. 
-> Allez tout simplement sur https://github.com, 
-> choisissez un nom d�utilisateur 
-> saisissez une adresse �lectronique 
-> et un mot de passe, 
-> puis cliquez sur � Sign up for GitHub � (S�inscrire sur GitHub).
-> ignorer la page des tarifs
-> GitHub vous envoie un courriel pour v�rifier l�adresse fournie

# acc�der � votre tableau de bord
-> En cliquant sur le logo Octocat (logo en forme de chat)

# se connecter � des d�p�ts Git
-> en utilisant le protocole https:// 
-> et de vous identifier au moyen de votre nom d�utilisateur 
-> et de votre mot de passe. 

# le compte que nous venons de cr�er devient utile
-> pour commencer � dupliquer (fork) un projet 
-> ou pour pousser sur ces d�p�ts plus tard

# utiliser des serveurs distants en SSH
-> renseigner votre cl� publique

# Acc�s par SSH
-> Acc�dez aux param�tres de votre compte
-> S�lectionnez ensuite la section � SSH keys � (cl�s SSH)
-> cliquez sur le bouton � Add an SSH key � (ajouter une cl� SSH), 
-> donnez un nom � votre cl�, 
-> copiez le contenu du fichier de cl� publique (~/.ssh/id_rsa.pub) 
-> et cliquez sur � Add key � (ajouter la cl�).

# Votre Avatar
-> S�lectionnez la section � Profile � (profil) 
-> et cliquez sur � Upload new picture � (t�l�charger une nouvelle image).
-> s�lectionner une image sur votre disque dur, 
-> la recadrer.

# Vos adresses �lectroniques
-> Github utilise les adresses �lectroniques 
-> pour faire correspondre les commits Git aux utilisateurs

# ajouter toutes les adresses que vous avez utilis�es
-> section � Emails � (adresses �lectroniques)

# r�glages de l�authentification � deux facteurs
-> section � Security � (S�curit�)
-> cliquez sur le bouton � Set up two-factor authentication � 
-> choisir d�utiliser une application de t�l�phone mobile 
-> ou bien de vous faire envoyer un code GitHub par SMS 

#================================================
# GitHub - Contribution � un projet
#================================================

# contribuer � un projet existant 
# sur lequel vous n�avez pas le droit de pousser
-> vous pouvez dupliquer (fork) ce projet. 
-> Cela signifie que GitHub va faire pour vous une copie personnelle
-> vous serez redirig� vers la page de votre nouveau projet

# organisation de la collaboration
-> cr�ation d�une branche th�matique � partir de la branche master,
-> validation de quelques am�liorations (commit),
-> pouss�e de la branche th�matique sur votre projet GitHub (push),
-> ouverture d�une requ�te de tirage sur GitHub (Pull Request),
-> discussion et �ventuellement possibilit� de nouvelles validations (commit).
-> Le propri�taire du projet fusionne (merge) ou ferme (close) la requ�te de tirage.

# probl�me au projet initial
-> Tony recherche un programme � faire tourner sur son Arduino 
-> et a trouv� un programme GitHub � https://github.com/schacon/blink.
-> Le seul probl�me est que le clignotement est trop rapide, 
-> nous pensons qu�il serait mieux d�attendre 3 secondes 
-> au lieu d�une seconde entre chaque changement d��tat. 
-> Am�liorons donc le programme 
-> et soumettons cette am�lioration au projet initial.

# Cr�ation d�une requ�te de tirage
-> Premi�rement, nous cliquons sur le bouton � Fork � 
-> pour obtenir une copie du projet. 
-> Notre nom d�utilisateur ici est � tonychacon � 
-> notre copie est � https://github.com/tonychacon/blink 
-> et c�est ici que nous pouvons la modifier. 
-> Nous pouvons aussi la cloner localement, 
-> cr�er une branche th�matique, 
-> modifier le code et pousser cette modification sur GitHub.
----------
git clone https://github.com/tonychacon/blink (1)
cd blink
git checkout -b slow-blink (2)
sed -i '' 's/1000/3000/' blink.ino # (MacOSX) (3)
git diff --word-diff (4)
git commit -a -m 'three seconds is better' (5)
git push origin slow-blink (6)
----------
-> Clone notre copie du projet localement
-> Cr�e un branche th�matique avec un nom descriptif
-> Modifie le code
-> V�rifie si la modification est bonne
-> Valide les modifications dans la branche th�matique
-> Pousse notre branche th�matique sur notre d�p�t dupliqu� GitHub
----------
-> allons sur notre projet dupliqu� sur GitHub, 
-> voir que GitHub a remarqu� que nous avons pouss� 
-> une nouvelle branche th�matique 
-> et affiche un gros bouton vert pour v�rifier nos modifications 
-> et ouvrir une requ�te de tirage sur le projet original.
-> vous rendre � la page � Branches �
-> � https://github.com/<utilisateur>/<projet>/branches 
-> pour trouver votre branche 
-> et ouvrir une requ�te de tirage � partir de l�.





