#include "dicerandomizer.h"

DiceRandomizer::DiceRandomizer(QObject *parent) : QObject(parent)
{
    m_seedTimer.start();
}

int DiceRandomizer::randomize()
{

    if (!m_initialized) {
        m_random.seed(m_seedTimer.elapsed());
        m_initialized = true;
    }

    return m_random.bounded(m_min, m_max+1);

}
