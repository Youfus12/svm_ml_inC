@echo off

:: Check if MinGW is installed
where gcc >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo MinGW not found. Please install MinGW and add it to your PATH.
    exit /b 1
)

:: Create the build directory if it doesn't exist
if exist "build" (
    echo Build directory already exists. Cleaning up...
    rmdir /s /q build
)
mkdir build
cd build

:: Run CMake to configure the project
echo Running CMake...
cmake ..

:: Build the project
echo Building the project...
mingw32-make

:: Notify the user that the build is complete
echo Build complete. Run 'build\\NaiveBayes.exe' to start.

:: Generate settings for Windows
echo Generated settings for Windows.

:: Create VS Code configuration files
echo Creating VS Code configuration files...

mkdir .vscode
echo {
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Debug NaiveBayes",
            "type": "cppdbg",
            "request": "launch",
            "program": "\${workspaceFolder}\\build\\NaiveBayes.exe",
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
            "miDebuggerPath": "C:\\mingw\\bin\\gdb.exe",
            "preLaunchTask": "build",
            "miDebuggerArgs": "",
            "logging": {
                "moduleLoad": false,
                "trace": false,
                "traceResponse": false,
                "engineLogging": false
            }
        }
    ]
} > .vscode\launch.json

echo {
    "version": "2.0.0",
    "tasks": [
        {
            "label": "build",
            "type": "shell",
            "command": "mingw32-make",
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "problemMatcher": ["\$gcc"],
            "detail": "Generated task for building the project"
        }
    ]
} > .vscode\tasks.json

echo VS Code configuration files created successfully.
