cmake_minimum_required(VERSION 3.14)
project(McMasterExoskeleton)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)

# Add source files
# add_library(MyLibrary src/my_library.cpp)

# Include GoogleTest
add_subdirectory(googletest)

# Enable testing
enable_testing()
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Add unit tests
add_executable(exoskeleton tests/sample_test.cpp)
target_link_libraries(exoskeleton PRIVATE gtest gtest_main)

# Register the test with CTest
add_test(NAME sampleTest COMMAND sampleTest)
