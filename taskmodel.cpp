#include "taskmodel.h"

#include <QVariant>
#include <QDebug>

TaskModel::TaskModel(const QStringList &tasks, QObject *parent) : m_tasks(tasks), QAbstractListModel(parent)
{
}

int TaskModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return m_tasks.count();
}

QVariant TaskModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant{};
    
    if (index.row() >= m_tasks.size() || index.row() < 0)
        return QVariant{};
    
    if (role == TaskRole)
        return m_tasks.at(index.row());
    
    return QVariant{};
}

QHash<int, QByteArray> TaskModel::roleNames() const
{
    
    QHash<int, QByteArray> roles;
    roles[TaskRole] = "task";
    return roles;
}

void TaskModel::addTask(const QString &task)
{
    qDebug() << "addTask " << task;
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_tasks << task;
    endInsertRows();
    
    emit taskAdded(task);
}
