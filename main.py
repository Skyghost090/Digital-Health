import sys
import os
from PyQt5.QtCore import *
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *

file = open("apps.txt", "r")
content = file.read()

class MainWindow(QMainWindow):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.setWindowTitle('Digital Wellbing')
        self.setGeometry(100, 100, 500, 300)

        listWidget = QListWidget()
        self.setCentralWidget(listWidget)
        for word in content.split():
            QListWidgetItem(word, listWidget)

        menuBar = QMenuBar(self)
        self.setMenuBar(menuBar)
        addAction_ = QAction("Add Application", self)
        addAction_.triggered.connect(self.addTrigered)
        removeAction = QAction("Remove Application", self)
        removeAction.triggered.connect(self.removeTrigered)
        githubAction = QAction("Github", self)
        githubAction.triggered.connect(lambda: os.system("xdg-open 'https://github.com/Skyghost090'"))
        appsMenu = QMenu("&Apps timer", self)
        appsMenu.addAction(addAction_)
        appsMenu.addAction(removeAction)
        menuBar.addMenu(appsMenu)
        aboutMenu = menuBar.addMenu("&About")
        aboutMenu.addAction(githubAction)
        self.show()

    def addTrigered(self):
        dlg = QDialog()
        dlg.setWindowTitle("Type App Name To Add")
        dlg.setFixedSize(300,130)
        appName = QLineEdit(dlg)
        appName.setGeometry(0,0,300,40)
        appName.setStyleSheet("font-size: 17px; background-color: transparent")

        datetime = QTimeEdit(dlg)
        datetime.setGeometry(0,40,300,50)
        datetime.setDisplayFormat("HH:mm")

        btn = QPushButton("Ok", dlg)
        btn.setGeometry(0,90,300,40)
        btn.setFlat(True)

        def click():
            sed =  '"1 s/.*/&,{}/"'.format(appName.text())
            sed2 =  '"2 s/.*/&,{}/"'.format(datetime.text())
            sedfirst =  '"1 s/.*/&{}/"'.format(appName.text())
            sedapps =  '"1 s/.*/&{} /"'.format(appName.text())
            sed2first =  '"2 s/.*/&{}/"'.format(datetime.text())
            os.system('if [ $(cat apps.txt | grep -o " " | wc -l) == "0" ]; then sed -i {} timeout.csv && echo "" >> timeout.csv && echo "" >> timeout.csv && sed -i {} timeout.csv; else sed -i {} timeout.csv && sed -i {} timeout.csv; fi'.format(sedfirst, sed2first, sed, sed2))
            os.system("sed -i {} apps.txt".format(sedapps))
            dlg.close()

        btn.clicked.connect(click)
        dlg.setWindowModality(Qt.ApplicationModal)
        dlg.exec_()

    def removeTrigered(self):
        dlg = QDialog()
        dlg.setWindowTitle("Type App Name To Remove")
        dlg.setFixedSize(300,80)
        appName = QLineEdit(dlg)
        appName.setGeometry(0,0,300,40)
        appName.setStyleSheet("font-size: 17px; background-color: transparent")
        btn = QPushButton("Ok", dlg)
        btn.setGeometry(0,40,300,40)
        btn.setFlat(True)

        def click():
            substring = '$(cat apps.txt | sed -i "s/{}/ /g")'.format(appName.text())
            os.system('echo "{} " > apps.txt'.format(substring))
            os.system('./remove.sh {}'.format(appName.text()))
            dlg.close()

        btn.clicked.connect(click)

        dlg.setWindowModality(Qt.ApplicationModal)
        dlg.exec_()

app = QApplication(sys.argv)
window = MainWindow()
sys.exit(app.exec())
