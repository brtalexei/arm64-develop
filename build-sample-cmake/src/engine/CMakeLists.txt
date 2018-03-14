project(engine VERSION 0.0.1 LANGUAGES CXX)

add_library(engine
        src/motor.cpp)

target_include_directories(engine PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include
        )

add_executable(enginetest
        test/test_noise.cpp
        test/main.cpp
        )

target_link_libraries(enginetest engine)
target_link_libraries(enginetest libgtest)

add_test(enginetest enginetest)
