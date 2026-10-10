# 编译 resume.typ 为 resume.pdf
# 用法: 在本目录打开 PowerShell, 执行  ./compile.ps1
$ErrorActionPreference = "Stop"
$root = $PSScriptRoot
Set-Location $root

# 查找 typst: 优先 PATH 中的 typst, 其次使用本机工具目录
$typst = (Get-Command typst -ErrorAction SilentlyContinue).Source
if (-not $typst) {
    $candidates = @(
        "D:\myworkspace\.tools\typst\typst-x86_64-pc-windows-msvc\typst.exe"
    )
    $typst = $candidates | Where-Object { Test-Path $_ } | Select-Object -First 1
}
if (-not $typst) {
    Write-Error "未找到 typst CLI, 请先安装: https://github.com/typst/typst/releases"
    exit 1
}

# 编译 (--root 保证 icons/ 等相对路径正确解析)
& $typst compile resume.typ resume.pdf --root $root --font-path fonts
if ($LASTEXITCODE -eq 0) {
    Write-Host "已生成: $root\resume.pdf"
}
