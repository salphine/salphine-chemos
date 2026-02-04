Write-Host "🚀 SALPHINE CHEMOS - Streamlit Cloud Deployment" -ForegroundColor Cyan
Write-Host "=" * 60

# Step 1: Verify files
Write-Host "
📁 Verifying required files..." -ForegroundColor Yellow

# List of required files
 = @("main.py", "database.py", "auth.py", "requirements.txt", ".streamlit/config.toml")
 = True

foreach ( in ) {
    if (Test-Path ) {
        Write-Host "✅ " -ForegroundColor Green
    } else {
        Write-Host "❌  (missing)" -ForegroundColor Red
         = False
    }
}

if (-not ) {
    Write-Host "
⚠️ Please fix missing files before deploying." -ForegroundColor Red
    exit
}

# Step 2: Clean up
Write-Host "
🧹 Cleaning up..." -ForegroundColor Yellow
Remove-Item "__pycache__" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "*.pyc" -ErrorAction SilentlyContinue
Remove-Item ".git" -Recurse -Force -ErrorAction SilentlyContinue

# Step 3: Initialize Git
Write-Host "
🔧 Setting up Git..." -ForegroundColor Yellow
git init
git add .
git commit -m "Deploy SALPHINE CHEMOS v2.0 to Streamlit Cloud" -q

Write-Host "✅ Git initialized with all files" -ForegroundColor Green

# Step 4: GitHub Instructions
Write-Host "
🔗 GITHUB SETUP INSTRUCTIONS:" -ForegroundColor Cyan
Write-Host "-" * 50
Write-Host "1. Go to: https://github.com/new" -ForegroundColor White
Write-Host "2. Repository name: salphine-chemos" -ForegroundColor White
Write-Host "3. Description: SALPHINE CHEMOS Sales System" -ForegroundColor White
Write-Host "4. Keep it PUBLIC (required for free hosting)" -ForegroundColor White
Write-Host "5. DO NOT initialize with README, .gitignore, or license" -ForegroundColor White
Write-Host "6. Click 'Create repository'" -ForegroundColor White
Write-Host "-" * 50

 = Read-Host "
Enter your GitHub username (e.g., 'salphine')"
 = "https://github.com//salphine-chemos.git"

Write-Host "
📤 Connecting to GitHub repository..." -ForegroundColor Yellow
git remote add origin 
git branch -M main

Write-Host "Pushing code to GitHub..." -ForegroundColor Gray
git push -u origin main

if (0 -eq 0) {
    Write-Host "✅ Successfully pushed to GitHub!" -ForegroundColor Green
    
    # Step 5: Streamlit Cloud Instructions
    Write-Host "
🌐 STREAMLIT CLOUD DEPLOYMENT:" -ForegroundColor Cyan
    Write-Host "-" * 50
    Write-Host "1. Go to: https://share.streamlit.io" -ForegroundColor White
    Write-Host "2. Sign in with GitHub" -ForegroundColor White
    Write-Host "3. Click 'New app'" -ForegroundColor White
    Write-Host "4. Select repository: /salphine-chemos" -ForegroundColor White
    Write-Host "5. Branch: main" -ForegroundColor White
    Write-Host "6. Main file path: main.py" -ForegroundColor White
    Write-Host "7. Click 'Deploy'!" -ForegroundColor White
    Write-Host "-" * 50
    
    Write-Host "
🔗 YOUR APP WILL BE LIVE AT:" -ForegroundColor Green
    Write-Host "👉 https://salphine-chemos.streamlit.app" -ForegroundColor White
    Write-Host "(or https://-salphine-chemos.streamlit.app)" -ForegroundColor Gray
    
    Write-Host "
⏱️ Deployment takes 1-2 minutes to complete." -ForegroundColor Yellow
    Write-Host "📊 Check deployment status at: https://share.streamlit.io" -ForegroundColor White
    
} else {
    Write-Host "❌ Failed to push to GitHub" -ForegroundColor Red
    Write-Host "Possible issues:" -ForegroundColor Yellow
    Write-Host "1. Repository doesn't exist on GitHub" -ForegroundColor White
    Write-Host "2. Wrong GitHub username" -ForegroundColor White
    Write-Host "3. Network issues" -ForegroundColor White
    Write-Host "
Manually create repository at: https://github.com/new" -ForegroundColor White
}

Write-Host "
🎉 Deployment instructions complete!" -ForegroundColor Cyan
