#include "filehandler.h"



void FileHandler::saveToFile(const QString &filename, const QString &str) {
    QFile file(filename);
    if (!file.open(QIODevice::Append | QIODevice::Text)) {
        qDebug() << "Unable to open file for writing: " << file.errorString();
        return;
    }

    QTextStream out(&file);
    out << str << "\n";

    file.close();
}

QStringList FileHandler::readFromFile(const QString &filename) {
    QFile file(filename);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qDebug() << "Unable to open file for reading: " << file.errorString();
        return QStringList();
    }
    
    QStringList list;
    QTextStream in(&file);
    while (!in.atEnd()) {
        QString line = in.readLine();
        list.append(line);
    }
    
    file.close();
    return list;
}
