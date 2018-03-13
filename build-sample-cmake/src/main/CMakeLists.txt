add_executable(pipeliner src/main.cpp)

add_executable(maintest test/main.cpp)
target_link_libraries(maintest libgtest)

add_test(maintest maintest)
