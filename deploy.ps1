Write-Host "🚀 SALPHINE CHEMOS Deployment Assistant" -ForegroundColor Cyan
Write-Host "=" * 50

# Step 1: Check files
Write-Host "
📁 Checking required files..." -ForegroundColor Yellow

 = @("main.py", "database.py", "auth.py", "requirements.txt")
 = @()

foreach ( in ) {
    if (Test-Path ) {
        Write-Host "✅ " -ForegroundColor Green
    } else {
        Write-Host "❌  (missing)" -ForegroundColor Red
         += 
    }
}

if (.Count -gt 0) {
    Write-Host "
⚠️ Missing files. Please create them first." -ForegroundColor Red
    exit
}

# Step 2: Setup git
Write-Host "
🔧 Setting up Git..." -ForegroundColor Yellow

# Clean up old git
if (Test-Path ".git") {
    Write-Host "Removing old git repository..." -ForegroundColor Gray
    Remove-Item -Recurse -Force ".git" -ErrorAction SilentlyContinue
}

git init
git add .
git commit -m "Deploy SALPHINE CHEMOS Sales System"

# Step 3: Connect to GitHub
Write-Host "
🔗 GitHub Setup" -ForegroundColor Yellow
Write-Host "1. Go to: https://github.com/new" -ForegroundColor White
Write-Host "2. Create repository: salphine-chemos" -ForegroundColor White
Write-Host "3. Copy the repository URL" -ForegroundColor White

 = Read-Host "
Enter your GitHub repository URL (e.g., https://github.com/salphine/salphine-chemos.git)"

if () {
    git remote add origin 
    git branch -M main
    
    Write-Host "
📤 Pushing to GitHub..." -ForegroundColor Green
    git push -u origin main
    
    if (0 -eq 0) {
        Write-Host "✅ Successfully pushed to GitHub!" -ForegroundColor Green
        
        # Step 4: Deploy to Streamlit Cloud
        Write-Host "
🌐 Streamlit Cloud Deployment" -ForegroundColor Cyan
        Write-Host "=" * 30
        Write-Host "1. Go to: https://share.streamlit.io" -ForegroundColor White
        Write-Host "2. Sign in with GitHub" -ForegroundColor White
        Write-Host "3. Click 'New app'" -ForegroundColor White
        Write-Host "4. Select repository: salphine-chemos" -ForegroundColor White
        Write-Host "5. Branch: main" -ForegroundColor White
        Write-Host "6. Main file path: main.py" -ForegroundColor White
        Write-Host "7. Click 'Deploy'!" -ForegroundColor White
        
        Write-Host "
🔗 Your app will be live at:" -ForegroundColor Cyan
        Write-Host "https://salphine-chemos.streamlit.app" -ForegroundColor White
    } else {
        Write-Host "❌ Failed to push to GitHub. Check your URL and internet connection." -ForegroundColor Red
    }
} else {
    Write-Host "❌ No repository URL provided." -ForegroundColor Red
}

Write-Host "
🎉 Deployment guide complete!" -ForegroundColor Cyan
