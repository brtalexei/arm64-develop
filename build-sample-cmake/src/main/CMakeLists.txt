add_executable(pipeliner src/main.cpp)

target_link_libraries(pipeliner
        my::engine
        )

add_executable(maintest test/main.cpp)

target_link_libraries(maintest
        libgtest
        )

add_test(maintest maintest)
