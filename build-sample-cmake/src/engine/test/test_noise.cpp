#include <gtest/gtest.h>
#include <engine/motor.h>

namespace {
    TEST(Motor, Noise) {
        motor m;
        m.make_sound();
    }
}