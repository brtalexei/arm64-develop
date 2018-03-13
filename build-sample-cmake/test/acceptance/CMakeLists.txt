add_executable(acceptance src/main.cpp)
target_link_libraries(acceptance libgtest)

add_test(acceptance acceptance)