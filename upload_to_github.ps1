# PowerShell script to upload BabyAdam to GitHub
# Author: Darrell Mesa
# Email: darrell.mesa@pm-ss.org

# Configuration
$repoUrl = "https://github.com/ai-in-pm/babyadam.git"
$userName = "Darrell Mesa"
$userEmail = "darrell.mesa@pm-ss.org"
$commitMessage = "Initial commit of BabyAdam project"

# Display header
Write-Host "BabyAdam GitHub Upload Script" -ForegroundColor Cyan
Write-Host "==============================" -ForegroundColor Cyan
Write-Host ""

# Check if Git is installed
try {
    $gitVersion = git --version
    Write-Host "Git is installed: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "Git is not installed. Please install Git before proceeding." -ForegroundColor Red
    exit 1
}

# Configure Git user information
Write-Host "Configuring Git user information..." -ForegroundColor Yellow
git config user.name "$userName"
git config user.email "$userEmail"
Write-Host "Git user configured." -ForegroundColor Green

# Initialize Git repository if not already initialized
if (-not (Test-Path ".git")) {
    Write-Host "Initializing Git repository..." -ForegroundColor Yellow
    git init
    Write-Host "Git repository initialized." -ForegroundColor Green
} else {
    Write-Host "Git repository already initialized." -ForegroundColor Green
}

# Check if remote exists
$remoteExists = git remote -v | Select-String -Pattern "origin"
if ($remoteExists) {
    Write-Host "Remote 'origin' already exists. Updating URL..." -ForegroundColor Yellow
    git remote set-url origin $repoUrl
    Write-Host "Remote URL updated." -ForegroundColor Green
} else {
    Write-Host "Adding remote 'origin'..." -ForegroundColor Yellow
    git remote add origin $repoUrl
    Write-Host "Remote 'origin' added." -ForegroundColor Green
}

# Add all files to staging
Write-Host "Adding files to staging..." -ForegroundColor Yellow
git add .
Write-Host "Files added to staging." -ForegroundColor Green

# Commit changes
Write-Host "Committing changes..." -ForegroundColor Yellow
git commit -m "$commitMessage"
Write-Host "Changes committed." -ForegroundColor Green

# Push to GitHub
Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
Write-Host "This may prompt for your GitHub credentials." -ForegroundColor Yellow
$pushChoice = Read-Host "Do you want to force push? (y/n) [Default: n]"
if ($pushChoice -eq "y") {
    git push -u origin main --force
} else {
    git push -u origin main
}
Write-Host "Push completed." -ForegroundColor Green

# Verify upload
Write-Host ""
Write-Host "Upload process completed." -ForegroundColor Cyan
Write-Host "Please verify the upload by visiting: $repoUrl" -ForegroundColor Cyan
Write-Host ""
Write-Host "If you encounter any issues, refer to the GITHUB_UPLOAD.md file for troubleshooting." -ForegroundColor Yellow
