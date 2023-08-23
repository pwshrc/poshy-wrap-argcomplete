#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest


function Register-ArgcompleteArgumentCompleter {
    param(
        [Parameter(Mandatory = $true)]
        [string] $CommandName
    )
    $argcompleteRegisterCommand = Get-Command register-python-argcomplete -ErrorAction SilentlyContinue
    if (-not $argcompleteRegisterCommand) {
        throw "register-python-argcomplete not found."
    }

    [string] $argcompleteRegister = $argcompleteRegisterCommand.Source
    _python3 $argcompleteRegister --shell powershell $CommandName | Out-String | Invoke-Expression
}
