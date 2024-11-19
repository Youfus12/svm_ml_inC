# SVM ML in C

This project is a simple C implementation of Support Vector Machine (SVM) for machine learning. It uses SDL2 for visualization and is set up with `CMake` for cross-platform building.

## Features

- **Cross-platform**: Supports both Linux and Windows environments.
- **Build and Run Automation**: Easily build and run the project with a single click in VS Code using the provided setup scripts.

## Requirements

### Dependencies

- **CMake** (for building the project)
- **g++** (for compiling the C code)
- **SDL2** (for graphical visualization)
- **VS Code** (with the C++ extension installed)

On Windows, you also need **Chocolatey** (for automated dependency installation via `setup.bat`).

### Setup Files

The repository contains setup scripts for both Linux and Windows to configure your development environment for easy building and running of the project:

- `setup.sh` for Linux
- `setup.bat` for Windows

These scripts will automatically install dependencies and configure VS Code to run the project with a single click.

## Setup

### Step 1: Clone the Repository

Clone the repository to your local machine:

```bash
git clone <your-repo-url>
cd <your-repo-folder>
