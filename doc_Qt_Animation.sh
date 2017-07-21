#================================================
# Qt - Macros
#================================================
 
# Q_OBJECT
La macro Q_OBJECT doit appara�tre dans la section priv�e 
d une d�finition de classe qui d�clare ses propres signaux 
et slots � sous ou qui utilise d autres services fournis 
par le syst�me m�ta-objet de Qt.

# Q_PROPERTY
Cette macro est utilis�e pour d�clarer les propri�t�s dans les classes 
qui h�ritent de QObject. Les propri�t�s se comportent comme des 
membres de donn�es de classe, mais elles ont des fonctionnalit�s 
suppl�mentaires accessibles via le syst�me Meta-Object.

# QT_TRANSLATE_NOOP
Marque le texte de la cha�ne sourceText pour la traduction 
dynamique dans le contexte donn�; � savoir, la source source 
stock�e ne sera pas modifi�e. Le contexte est g�n�ralement 
une classe et doit �galement �tre sp�cifi� comme cha�ne litt�rale.

#================================================
# Qt - Methods
#================================================

# QGraphicsItem::setCacheMode
D�finit le mode de cache de l �l�ment en mode.

# QGraphicsItem::DeviceCoordinateCache
La mise en cache est activ�e au niveau du dispositif de peinture, 
dans les coordonn�es de l appareil. 
Ce mode correspond aux objets pouvant se d�placer, 
mais ne sont pas tourn�s, mis � l �chelle ou cisaill�s. 
Si l �l�ment est transform� directement ou indirectement, 
le cache sera r�g�n�r� automatiquement. 
    
# QGraphicsItem::setAcceptHoverEvents
Si activ� est vrai, cet �l�ment acceptera les �v�nements de survoltage; 
Sinon, il les ignorera. 
Par d�faut, les �l�ments n acceptent pas les �v�nements suspendus.

# QGraphicsItem::boundingRect
Cette fonction virtuelle pure d�finit les limites ext�rieures 
de l objet en tant que rectangle; Toute la peinture doit �tre limit�e � 
l int�rieur du rectangle d une pi�ce. QGraphicsView utilise 
ceci pour d�terminer si l article n�cessite le redessinage.

# QGraphicsItem::shape
Renvoie la forme de cet �l�ment en tant que QPainterPath dans les 
coordonn�es locales. La forme est utilis�e pour beaucoup de choses, 
y compris la d�tection de collision, les tests de succ�s et les fonctions 
QGraphicsScene::items ().

# QPainterPath::addEllipse
Cr�e une ellipse dans le rectangle d�limit� sp�cifi� 
et l ajoute au chemin du peintre comme sous-chemin ferm�.

# QGraphicsItem::paint
Cette fonction, appel�e habituellement par QGraphicsView, peint le 
contenu d un �l�ment dans les coordonn�es locales.

# QStyleOption::state
Cette variable contient les drapeaux de style utilis�s lors du 
dessin du contr�le.

# QStyle::State_Sunken
Utilis� pour indiquer si le widget est enfonc� ou press�.

# QGradient::setColorAt
Cr�e un point d arr�t � la position donn�e avec la couleur donn�e. 
La position donn�e doit �tre comprise entre 0 et 1.

# QStyle::State_MouseOver
Utilis� pour indiquer si le widget est sous la souris.

# QPainter::setPen
D�finit le stylo du peintre pour �tre le stylo donn�.

# QPainter::setBrush
D�finit la brosse du peintre sur la brosse donn�e.

# QPainter::drawEllipse
Dessine l ellipse d�finie par le rectangle donn�.

# QPainter::translate
Traduire le syst�me de coordonn�es par le d�calage donn�; 
C est-�-dire que le d�calage donn� est ajout� aux points.

# QPainter::drawPixmap
Dessine la source de la partie rectangulaire du pixmap donn� 
dans la cible donn�e dans le dispositif de peinture.

# QGraphicsItem::mousePressEvent
Ce gestionnaire d �v�nements, pour l �v�nement, peut �tre r�impl�ment� 
pour recevoir des �v�nements de presse de souris pour cet �l�ment. 
Les �v�nements de presse de la souris ne sont livr�s qu aux �l�ments 
qui acceptent le bouton de la souris qui est press�. 
Par d�faut, un �l�ment accepte tous les boutons de la souris, 
mais vous pouvez le modifier en appelant setAcceptedMouseButtons ().

# QGraphicsItem::mouseReleaseEvent
Ce gestionnaire d �v�nements, pour l �v�nement, peut �tre r�impl�ment� 
pour recevoir les �v�nements de sortie de la souris pour cet �l�ment.

# QGraphicsItem::update
Planifie un nouveau redraw de la zone couverte par rect dans cet �l�ment. 
Vous pouvez appeler cette fonction chaque fois que votre �l�ment 
doit �tre redessin�, par exemple s il change d aspect ou de taille.

# QGraphicsView::resizeEvent
Ce gestionnaire d �v�nements peut �tre r�impl�ment� dans une sous-classe 
pour recevoir des �v�nements de redimensionnement de widget qui sont pass�s 
dans le param�tre de l �v�nement. Lorsque resizeEvent () est appel�, 
le widget a d�j� sa nouvelle g�om�trie. L ancienne taille est accessible 
via QResizeEvent::oldSize ().

# QGraphicsView::fitInView
Mise � l �chelle de la matrice de vue et d�file les barres de d�filement 
pour s assurer que le rectangle de la sc�ne s ins�re dans la fen�tre. 
Rect doit �tre dans la sc�ne rect; Sinon, fitInView () ne peut pas 
garantir que tout le rect est visible.

# QGraphicsView::sceneRect
Cette propri�t� contient la zone de la sc�ne visualis�e par cette vue.

# Qt::KeepAspectRatioByExpanding
La taille est r�duite � un rectangle aussi petit que possible 
� l ext�rieur d un rectangle donn�, en conservant le rapport d aspect.

# QGraphicsPixmapItem::setOffset
D�finit le d�calage de l �l�ment pixmap pour compenser. 
QGraphicsPixmapItem dessine son pixmap en utilisant le d�calage 
pour son coin sup�rieur gauche.

# QGraphicsItem::setZValue
D�finit la valeur Z de l �l�ment sur z. La valeur Z d�cide de l ordre 
d empilement des articles des fr�res et soeurs (voisins). 
Un �l�ment de fratrie de haute valeur Z sera toujours dessin� 
sur un autre �l�ment de fratrie avec une valeur Z inf�rieure.

# QGraphicsScene::addItem
Ajoute ou d�place l �l�ment et tous ses enfants � cette sc�ne. 
Cette sc�ne prend possession de l �l�ment.

# QGraphicsItem::setPos
D�finit la position de l �l�ment � pos, qui est en coordonn�es parentales. 
Pour les �l�ments sans parent, pos est en coordonn�es de sc�ne.

# QGraphicsItem::setTransform
D�finit la matrice de transformation actuelle de l �l�ment en matrice.
Si la combinaison est vraie, la matrice est combin�e avec 
la matrice actuelle; Sinon, la matrice remplace la matrice actuelle. 
Combiner est faux par d�faut.

# QTransform::fromScale
Cr�e une matrice qui correspond � une mise � l �chelle 
de sx horizontalement et sy verticalement. 
C est la m�me chose que QTransform().scale(sx,sy) 
mais l�g�rement plus rapide.

# QState::assignProperty
Indique cet �tat pour d�finir la propri�t� avec le nom donn� de 
l objet donn� � la valeur donn�e lorsque l �tat est entr�.

# QWidget::setWindowTitle
Cette propri�t� d�tient le titre de la fen�tre (l�gende).
Cette propri�t� n a de sens que pour les widgets de haut niveau, 
tels que les fen�tres et les dialogues. 
Si aucune l�gende n a �t� d�finie, le titre est bas� 
sur WindowFilePath. Si aucun de ces �l�ments n est d�fini, 
le titre est une cha�ne vide.

# QGraphicsView::setViewportUpdateMode
Cette propri�t� contient la fa�on dont la fen�tre doit mettre 
son contenu � jour. QGraphicsView utilise cette propri�t� pour d�cider comment 
mettre � jour les zones de la sc�ne qui ont �t� re-expos�es ou 
modifi�es. Habituellement, vous n avez pas besoin de modifier 
cette propri�t�, mais il existe des cas o� cela peut am�liorer 
les performances de rendu. 

# QGraphicsView::BoundingRectViewportUpdate
Le rectangle d�limitant toutes les modifications dans la fen�tre 
sera redessin�. Ce mode pr�sente l avantage que QGraphicsView 
recherche uniquement une r�gion pour les changements, 
ce qui minimise le temps pass� � d�terminer ce qu il faut 
redessiner. L inconv�nient est que les zones qui n ont 
pas chang� doivent �galement �tre redessin�es.

# QGraphicsView::setBackgroundBrush
Cette propri�t� contient la brosse de fond de la sc�ne.
Cette propri�t� d�finit la brosse de fond pour la sc�ne dans 
cette vue. Il sert � remplacer l arri�re-plan de la sc�ne et 
d�finit le comportement de drawBackground(). 
Pour fournir un dessin d arri�re-plan personnalis� pour cette vue, 
vous pouvez r�impliquer drawBackground() � la place.

# QGraphicsView::CacheBackground
L arri�re-plan est mis en cache. Cela affecte � la fois les 
arri�re-plans personnalis�s et les arri�re-plans en fonction de 
la propri�t� backgroundBrush. Lorsque ce drapeau est activ�, 
QGraphicsView allouera un pixmap avec la pleine taille de la fen�tre.

# QGraphicsView::setRenderHints
Cette propri�t� contient les astuces de rendu par d�faut pour 
la vue. Ces astuces sont utilis�es pour initialiser QPainter 
avant que chaque �l�ment visible ne soit dessin�. 
QPainter utilise des astuces de rendu pour basculer 
les fonctionnalit�s de rendu telles que l antialiasing et la 
transformation de pixmap lisse.

# QPainter::Antialiasing
Indique que le moteur devrait antialias les bords des primitives 
si possible.

# QPainter::SmoothPixmapTransform
Indique que le moteur devrait utiliser un algorithme de 
transformation pixmap lisse (tel que bilin�aire) plut�t que 
le voisin le plus proche.

# QWidget::show
Affiche le widget et ses widgets enfants.
Cela �quivaut � appeler showFullScreen(), showMaximized() ou 
setVisible(true), en fonction du comportement par d�faut 
de la plate-forme pour les indicateurs de fen�tre.

# QStateMachine::addState
Ajoute l �tat donn� � cette machine d �tat. L �tat devient 
un �tat de haut niveau. Si l �tat est d�j� dans une machine 
diff�rente, il sera d abord retir� de son ancienne machine, 
puis ajout� � cette machine.

# QState::setInitialState
Cette propri�t� contient l �tat initial de cet �tat 
(un de ses �tats d enfant).

# QVariantAnimation::setDuration
Cette propri�t� tient la dur�e de l animation.
Cette propri�t� d�crit la dur�e en millisecondes de l animation. 
La dur�e par d�faut est de 250 millisecondes.

# QVariantAnimation::setEasingCurve
Cette propri�t� contient la courbe d assouplissement de 
l animation. Cette propri�t� d�finit la courbe d assouplissement 
de l animation. Par d�faut, une courbe d assouplissement lin�aire
est utilis�e, ce qui entra�ne une interpolation lin�aire. 
D autres courbes sont fournies, par exemple, QEasingCurve::InCirc, 
qui fournit une courbe d entr�e circulaire. 
Un autre exemple est QEasingCurve :: InOutElastic, qui fournit 
un effet �lastique sur les valeurs de la variante interpol�e.

# QEasingCurve::InOutQuad
Courbe d att�nuation pour une fonction quadratique (t^2): 
acc�l�ration jusqu � mi-course, puis d�c�l�ration.

# QAnimationGroup::addAnimation
Ajoute de l animation � ce groupe. 
Cela appellera l insertion d animation avec des index 
�gaux � l animationCount().

# QState::addTransition
Ajoute une transition associ�e au signal donn� de 
l objet �metteur donn� et renvoie le nouvel objet 
QSignalTransition. La transition a cet �tat comme source 
et la cible donn�e comme l �tat cible.

# QAbstractTransition::addAnimation
Ajoute l animation donn�e � cette transition. 
La transition ne prend pas en compte l animation.

# QTimer::start
D�marre ou red�marre la minuterie avec un intervalle de 
temporisation de millisecondes. Si la minuterie est d�j� en 
cours d ex�cution, elle sera arr�t�e et red�marr�. Si singleShot 
est vrai, la minuterie ne sera activ�e qu une seule fois.

# QTimer::setSingleShot
Cette propri�t� d�termine si la minuterie est une minuterie 
� un seul plan. Un temporisateur � un seul tir d�clenche 
une seule fois, les temporisateurs non-d�clencheurs 
d�clenchent chaque intervalle de millisecondes.

# QStateMachine::start
D�marre cette machine d �tat. La machine r�initialise sa 
configuration et la transition vers l �tat initial. 
Lorsqu un �tat final de niveau sup�rieur (QFinalState) est entr�, 
la machine �mettra le signal finished().

# QApplication::setNavigationMode
D�finit le type de navigation de mise au point que Qt devrait 
utiliser pour le mode. Cette fonctionnalit� est disponible dans 
Qt pour Embedded Linux et Windows CE uniquement.

# Qt::NavigationModeCursorAuto
Le curseur de la souris permet de modifier la mise au point, 
il est affich� uniquement sur des appareils non tactiles. 
Le clavier est utilis� pour impl�menter un curseur virtuel, 
� moins que le p�riph�rique ne poss�de un type d entr�e de type 
analogique (par exemple, pav� tactile). 
C est le param�tre recommand� pour une application telle 
qu un navigateur Web qui a besoin d un contr�leur de pointeur 
sur les appareils tactiles et non touchants.
