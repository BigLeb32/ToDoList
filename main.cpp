#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "taskmodel.h"
#include "filehandler.h"


const QString tasks_file = "tasks.txt";

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    
    //    qmlRegisterType<TaskModel>("Task", 1, 0, "TaskModel");
    
    QQmlApplicationEngine engine;
    
    FileHandler fileHandler;
    
    TaskModel taskModel(fileHandler.readFromFile(tasks_file));
    engine.rootContext()->setContextProperty("taskModel", &taskModel);
    
    QObject::connect(&taskModel, &TaskModel::taskAdded, [&fileHandler] (const QString &task){
        fileHandler.saveToFile(tasks_file, task);
    });
    
    qmlRegisterSingletonType(QUrl("qrc:/qml/AppUtil.qml"), "AppUtil", 1, 0,"AppUtil");
    
    const QUrl url(QStringLiteral("qrc:/qml/Main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1); 
        }, Qt::QueuedConnection);
    engine.load(url);
    
    
    return app.exec();
}
