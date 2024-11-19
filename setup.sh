#!/bin/bash

# Step 1: Check and install necessary dependencies (CMake, g++)
echo "Checking for necessary dependencies..."

# Update package lists
sudo apt update

# Install required dependencies if not already installed
if ! command -v cmake &> /dev/null
then
    echo "CMake not found, installing..."
    sudo apt install cmake -y
fi

if ! command -v g++ &> /dev/null
then
    echo "g++ not found, installing..."
    sudo apt install g++ -y
fi

if ! command -v pkg-config &> /dev/null
then
    echo "pkg-config not found, installing..."
    sudo apt install pkg-config -y
fi

if ! pkg-config --exists sdl2; then
  echo "SDL2 not found. Installing SDL2..."
  sudo apt install libsdl2-dev -y
fi

# Step 2: Create necessary VS Code configuration files
echo "Creating VS Code configuration files..."

# Create .vscode directory if it doesn't exist
mkdir -p .vscode

# Create tasks.json
cat <<EOL > .vscode/tasks.json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Configure (Linux)",
            "type": "shell",
            "command": "cmake",
            "args": ["-S", ".", "-B", "build"],
            "group": "build",
            "problemMatcher": [],
            "detail": "Run CMake to configure the project"
        },
        {
            "label": "Build (Linux)",
            "type": "shell",
            "command": "cmake --build build",
            "group": "build",
            "problemMatcher": [],
            "detail": "Build the project"
        },
        {
            "label": "Build and Run (Linux)",
            "type": "shell",
            "command": "cmake --build build && ./build/bin/svm_ml_inC",
            "group": "build",
            "problemMatcher": [],
            "detail": "Build and run the project"
        }
    ]
}
EOL

# Create launch.json
cat <<EOL > .vscode/launch.json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Run svm_ml_inC",
            "type": "cppdbg",
            "request": "launch",
            "program": "\${workspaceFolder}/build/bin/svm_ml_inC",
            "args": [],
            "stopAtEntry": false,
            "cwd": "\${workspaceFolder}",
            "environment": [],
            "externalConsole": false,
            "MIMode": "gdb",
            "setupCommands": [
                {
                    "description": "Enable pretty-printing for gdb",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": true
                }
            ],
            "miDebuggerPath": "/usr/bin/gdb",
            "preLaunchTask": "Build (Linux)"
        }
    ]
}
EOL

# Step 3: Create the build directory and configure the project using cmake
echo "Running cmake to configure the project..."
mkdir -p build
cmake -S . -B build

echo "Setup complete! You can now open the project in VS Code and run it by pressing the Run button."
