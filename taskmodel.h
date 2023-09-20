#ifndef TASKMODEL_H
#define TASKMODEL_H

#include <QAbstractListModel>
#include <QStringList>

class TaskModel : public QAbstractListModel
{
    Q_OBJECT
    
public:
    explicit TaskModel(const QStringList& tasks = {},QObject *parent = nullptr);
    
    enum {TaskRole = Qt::UserRole};
    
    // Required for any model:
    int rowCount(const QModelIndex &parent = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    QHash<int, QByteArray> roleNames() const;
    
public slots:
    void addTask(const QString &task);
    
signals:
    void taskAdded(const QString &task);
    
private:
    QStringList m_tasks;
};

#endif // TASKMODEL_H
