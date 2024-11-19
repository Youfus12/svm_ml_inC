cmake_minimum_required(VERSION 3.10)
project(svm_ml_inC)

# Set the C standard
set(CMAKE_C_STANDARD 11)

# Set the build type (optional, but good for debugging)
set(CMAKE_BUILD_TYPE Debug)

# Set the output directory for the executable
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Add the source files for the executable
set(SOURCES
    src/main.c
    src/ali_hamo.c
    src/fadel_abderrahmen.c
)

# Add executable with the correct name
add_executable(svm_ml_inC ${SOURCES})

# Check if SDL2 is installed and link it
find_package(PkgConfig REQUIRED)
pkg_check_modules(SDL2 REQUIRED sdl2)

# Include SDL2 headers and link SDL2 libraries
include_directories(${SDL2_INCLUDE_DIRS})
target_link_libraries(svm_ml_inC ${SDL2_LIBRARIES})

# Optional: Set specific compiler flags for UNIX and Windows
if(UNIX)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -g")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -L${SDL2_LIBRARY_DIRS}")
elseif(WIN32)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
endif()

# Optional: Add a test if needed
# enable_testing()
# add_test(NAME ExampleTest COMMAND svm_ml_inC)
