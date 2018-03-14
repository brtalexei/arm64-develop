project(engine VERSION 0.0.1 LANGUAGES CXX)

add_library(engine
        src/motor.cpp
        )

add_library(my::engine ALIAS engine)

target_include_directories(engine
        PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include
        PRIVATE src
        )

add_executable(enginetest
        test/test_noise.cpp
        test/main.cpp
        )

target_link_libraries(enginetest
        my::engine
        libgtest
        )

add_test(enginetest enginetest)
