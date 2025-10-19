cmake_minimum_required(VERSION 3.15)
project(CSES_Solutions)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -O2")

function(add_problem PROBLEM_PATH)
    get_filename_component(PROBLEM_NAME ${PROBLEM_PATH} NAME_WE)
    get_filename_component(PROBLEM_DIR ${PROBLEM_PATH} DIRECTORY)
    string(REPLACE "/" "_" TARGET_NAME "${PROBLEM_DIR}/${PROBLEM_NAME}")

    add_executable(${TARGET_NAME} ${PROBLEM_PATH})
endfunction()

file(GLOB_RECURSE PROBLEM_FILES "problem_set/**/*.cpp")

foreach(PROBLEM_FILE ${PROBLEM_FILES})
    file(RELATIVE_PATH REL_PATH ${CMAKE_SOURCE_DIR} ${PROBLEM_FILE})
    add_problem(${REL_PATH})
endforeach()
