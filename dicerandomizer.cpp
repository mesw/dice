#include "dicerandomizer.h"

DiceRandomizer::DiceRandomizer(QObject *parent) : QObject(parent)
{

}

int DiceRandomizer::randomize()
{

    return m_random.bounded(m_min, m_max+1);

}
