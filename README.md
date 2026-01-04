# Windows Automation Scripts

This repository contains a collection of PowerShell and CMD scripts designed to streamline Windows 11 workflows, automate system maintenance, and implement Green IT practices.

### Overview

The scripts in this repository focus on:

* **System Optimization**: Automating cleanup of temporary files and build artifacts.
* **Environment Setup**: Standardizing developer configurations.
* **Security & Auditing**: Lightweight tools for local system health and permission checks.

## Sustainability & Best Practice

In line with green computing and professional standards:

* **Resource Efficiency**: Scripts are optimized to minimize CPU usage and disk I/O.
* **Code Quality**: Following DRY (Don't Repeat Yourself) principles and secure scripting standards.
* **Impact**: Reducing digital waste by cleaning up redundant data (e.g., `node_modules`, `bin`, `obj`).

## Usage

1. Clone the repository.
2. Ensure your execution policy allows PowerShell scripts:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

```


3. Run any script from the root directory:
```powershell
.\script-name.ps1

```
