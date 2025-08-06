@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: 检查是否在Git仓库中，如果不是则初始化
git rev-parse --is-inside-work-tree >nul 2>&1
if %errorlevel% neq 0 (
    echo 初始化新的Git仓库...
    git init
)

:: 检查是否有提交记录，如果没有则创建初始提交
git rev-parse --verify HEAD >nul 2>&1
if %errorlevel% neq 0 (
    echo 创建初始提交...
    echo Initial commit > README.md
    git add README.md
    git commit -m "Initial commit" >nul
)

:: 设置起始日期（60天前）
for /f "usebackq" %%x in (`powershell -command "(Get-Date).AddDays(-60).ToString('yyyy-MM-dd')"`) do set start_date=%%x

:: 创建60次提交
for /l %%i in (1,1,60) do (
    :: 计算当前日期（起始日期 + 天数）
    for /f "usebackq" %%d in (`powershell -command "((Get-Date '!start_date!').AddDays(%%i).ToString('yyyy-MM-dd')"`) do set commit_date=%%d
    
    :: 创建或修改文件
    echo Commit %%i - !commit_date! > dummy.txt
    
    :: 添加到暂存区
    git add dummy.txt
    :: 提交
    git commit -m "伪造提交"
    
    echo 已创建提交 %%i/60 - 日期: !commit_date!
)

echo 已完成60次伪造提交
pause