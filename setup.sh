#!/bin/bash

# Set up the VS Code project configurations for Linux
echo "Setting up VS Code configurations for Linux..."

# Create .vscode directory if it doesn't exist
mkdir -p .vscode

# Create tasks.json
cat <<EOL > .vscode/tasks.json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Build (Linux)",
            "type": "shell",
            "command": "make",
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "problemMatcher": "$gcc",
            "presentation": {
                "reveal": "silent"
            }
        }
    ]
}
EOL

# Create launch.json for debugging
cat <<EOL > .vscode/launch.json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Launch (Linux)",
            "type": "cppdbg",
            "request": "launch",
            "program": "\${workspaceFolder}/build/bin/svm_ml_inC",
            "args": [],
            "stopAtEntry": false,
            "cwd": "\${workspaceFolder}",
            "environment": [],
            "externalConsole": true,
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

echo "VS Code configuration completed for Linux!"
echo "You can now open the project in VS Code, build it with 'Ctrl+Shift+B' and run it with the 'Run' button."
