#ifndef DICERANDOMIZER_H
#define DICERANDOMIZER_H

#include <QElapsedTimer>
#include <QObject>
#include <QRandomGenerator>
class DiceRandomizer : public QObject
{
    Q_OBJECT

    QRandomGenerator m_random;
    int m_min = 1;
    int m_max = 6;
    bool m_initialized;
    QElapsedTimer m_seedTimer;

public:
    explicit DiceRandomizer(QObject *parent = nullptr);

signals:

public slots:

    int randomize();

};

#endif // DICERANDOMIZER_H
