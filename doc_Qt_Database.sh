#================================================
# Qt - Database
#================================================

#------------------------------------------------
# QSqlDatabase

# obtenir la liste des drivers
QSqlDatabase::drivers().contains("QSQLITE")
# ajouter une connexion
QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
# d�finir le nom
db.setDatabaseName(":memory:")
# ouvrir une connexion
db.open()
# obtenir la derni�re erreur
db.lastError()
# obtenir la liste des tables
db.tables()

#------------------------------------------------
# QSqlQuery

# ex�cuter une requ�te SQL
q.exec(QLatin1String("create table books(id integer primary key, title varchar, author integer, genre integer, year integer, rating integer)")
# obtenir la derni�re erreur
q.lastError()
# pr�parer une requ�te SQL
q.prepare(QLatin1String("insert into authors(name, birthdate) values(?, ?)")))
# ajouter une valeur pour la liaison
q.addBindValue(title);
# ex�cuter la requ�te
q.exec();
# obtenir l'id de la derni�re insertion
q.lastInsertId();

#------------------------------------------------
# QSqlRelationalTableModel

model = new QSqlRelationalTableModel(ui.bookTable);
# d�finir la strat�gie d'�dition
model->setEditStrategy(QSqlTableModel::OnManualSubmit);
# d�finir la table
model->setTable("books");
# d�finir l'index du champ
model->fieldIndex("author");
# d�finir la relation entre l'index et les colonnes
model->setRelation(authorIdx, QSqlRelation("authors", "id", "name"));
# d�finir l'ent�te
model->setHeaderData(authorIdx, Qt::Horizontal, tr("Author Name"));
# remplace le mod�le avec les donn�es de la table
model->select()
# obtenir la derni�re erreur
model->lastError()

#------------------------------------------------
# QTableView

model = new QSqlRelationalTableModel(ui.bookTable);
# d�finir le mod�le
ui.bookTable->setModel(model);
# d�finir le d�l�gu�
ui.bookTable->setItemDelegate(new BookDelegate(ui.bookTable));
# d�finir la colonne invisible
ui.bookTable->setColumnHidden(model->fieldIndex("id"), true);
# d�finir le mod�le de s�lection
ui.bookTable->setSelectionMode(QAbstractItemView::SingleSelection);
# obtenir le mod�le de s�lection
ui.bookTable->selectionModel()

#------------------------------------------------
# QComboBox

# initialiser le mod�le
ui.authorEdit->setModel(model->relationModel(authorIdx));
# indiquer la colonne visible du mod�le
ui.authorEdit->setModelColumn(model->relationModel(authorIdx)->fieldIndex("name"));

#------------------------------------------------
# QDataWidgetMapper

QDataWidgetMapper *mapper = new QDataWidgetMapper(this);
# initialiser le mod�le
mapper->setModel(model);
# initialiser le d�l�gu�
mapper->setItemDelegate(new BookDelegate(this));
# ajouter un mapping entre une colonne du mod�le 
mapper->addMapping(ui.titleEdit, model->fieldIndex("title"));
# cr�er une connexion 
connect(ui.bookTable->selectionModel(), 
SIGNAL(currentRowChanged(QModelIndex,QModelIndex)),
mapper, SLOT(setCurrentModelIndex(QModelIndex)));













