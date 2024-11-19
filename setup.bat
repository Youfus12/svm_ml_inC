@echo off

REM Step 1: Check and install necessary dependencies (CMake, g++)
echo Checking for necessary dependencies...

REM Install Chocolatey if not already installed (ensure the user has admin privileges)
where cmake > nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo CMake not found. Installing CMake...
    choco install cmake -y
)

where g++ > nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo g++ not found. Installing g++...
    choco install mingw -y
)

REM Check if SDL2 is installed (via Chocolatey)
choco list --local-only | findstr /C:"libsdl2" > nul
if %ERRORLEVEL% NEQ 0 (
    echo SDL2 not found. Installing SDL2...
    choco install libsdl2 -y
)

REM Step 2: Create necessary VS Code configuration files
echo Creating VS Code configuration files...

REM Create .vscode directory if it doesn't exist
if not exist ".vscode" mkdir .vscode

REM Create tasks.json
echo {
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Configure (Windows)",
            "type": "shell",
            "command": "cmake",
            "args": ["-S", ".", "-B", "build"],
            "group": "build",
            "problemMatcher": [],
            "detail": "Run CMake to configure the project"
        },
        {
            "label": "Build (Windows)",
            "type": "shell",
            "command": "cmake --build build",
            "group": "build",
            "problemMatcher": [],
            "detail": "Build the project"
        },
        {
            "label": "Build and Run (Windows)",
            "type": "shell",
            "command": "cmake --build build && ./build/bin/svm_ml_inC.exe",
            "group": "build",
            "problemMatcher": [],
            "detail": "Build and run the project"
        }
    ]
} > .vscode\tasks.json

REM Create launch.json
echo {
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Run svm_ml_inC",
            "type": "cppdbg",
            "request": "launch",
            "program": "\${workspaceFolder}\\build\\bin\\svm_ml_inC.exe",
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
            "miDebuggerPath": "C:\\MinGW\\bin\\gdb.exe",
            "preLaunchTask": "Build (Windows)"
        }
    ]
} > .vscode\launch.json

REM Step 3: Create the build directory and configure the project using cmake
echo Running cmake to configure the project...
mkdir build
cmake -S . -B build

echo Setup complete! You can now open the project in VS Code and run it by pressing the Run button.
pause
