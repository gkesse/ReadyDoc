#================================================
# QCustomPlot
#================================================

#------------------------------------------------
# gestion cr�ation graphe
#------------------------------------------------   
# ajout graphe
customPlot->addGraph(); 
# couleur contour
customPlot->graph(0)->setPen(QPen(Qt::blue)); 
# couleur fond
customPlot->graph(0)->setBrush(QBrush(QColor(255, 50, 255, 255)));
# ajout donn�es
customPlot->graph(0)->setData(x, y);
# ajout abscisse
customPlot->xAxis->setLabel("x");  
# ajout ordonn�e
customPlot->yAxis->setLabel("y");
# ajout borne abscisse
customPlot->xAxis->setRange(-1, 1);
# ajout borne ordonn�e
customPlot->yAxis->setRange(0, 1);
# ajout visibilit� axe abscisse
customPlot->xAxis2->setVisible(true);
# ajout visibilit� label abscisse 
customPlot->xAxis2->setTickLabels(false);
# ajout visibilit� axe ordonn�e
customPlot->yAxis2->setVisible(true);
# ajout visibilit� label ordonn�e
customPlot->yAxis2->setTickLabels(false);

#------------------------------------------------
# gestion connexion graphe
#------------------------------------------------   
# transmission borne ordonn�e
connect(customPlot->xAxis, SIGNAL(rangeChanged(QCPRange)), customPlot->xAxis2, SLOT(setRange(QCPRange)));
# transmission borne abscisse
connect(customPlot->yAxis, SIGNAL(rangeChanged(QCPRange)), customPlot->yAxis2, SLOT(setRange(QCPRange)));










