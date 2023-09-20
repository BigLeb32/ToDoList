#ifndef FILEHANDLER_H
#define FILEHANDLER_H

#include <QString>
#include <QStringList>
#include <QFile>
#include <QTextStream>
#include <QDebug>

class FileHandler {
public slots:
    void saveToFile(const QString& filename, const QString &str);
    QStringList readFromFile(const QString& filename);
};

#endif // FILEHANDLER_H
