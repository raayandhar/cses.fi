#!/bin/bash
set -e

if [ $# -lt 1 ]; then
    echo "Usage: ./run.sh <problem_path> [input_file]"
    exit 1
fi

PROBLEM_PATH="$1"
INPUT_FILE="$2"

if [ ! -f "$PROBLEM_PATH" ]; then
    echo "Error: File '$PROBLEM_PATH' not found"
    exit 1
fi

PROBLEM_NAME=$(basename "$PROBLEM_PATH" .cpp)
PROBLEM_DIR=$(dirname "$PROBLEM_PATH")
TARGET_NAME="${PROBLEM_DIR}/${PROBLEM_NAME}"
TARGET_NAME="${TARGET_NAME//\//_}"
mkdir -p build

echo "Compiling $PROBLEM_NAME..."
cd build
cmake .. > /dev/null
cmake --build . --target "$TARGET_NAME" 2>&1 | grep -v "Consolidate compiler generated dependencies"
cd ..

echo "Running $PROBLEM_NAME"
echo "... enter input ..."

if [ -n "$INPUT_FILE" ]; then
    if [ ! -f "$INPUT_FILE" ]; then
        echo "Error: Input file '$INPUT_FILE' not found"
        exit 1
    fi
    ./build/$TARGET_NAME < "$INPUT_FILE"
else
    ./build/$TARGET_NAME
fi
