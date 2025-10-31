#!/bin/bash

# 🚀 RAGKKU GitHub Deployment Script untuk yanwarpro/ragkku
# Custom deployment untuk repository yang sudah dibuat

set -e

echo "🚀 RAGKKU Deployment ke https://github.com/yanwarpro/ragkku"
echo "================================================================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Repository info
GITHUB_USERNAME="yanwarpro"
REPO_NAME="ragkku"
GIT_EMAIL="yanwar.pro@gmail.com"
GIT_NAME="Yanwar Pro"
REMOTE_URL="https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"

print_status "Repository: $REMOTE_URL"
print_status "User: $GIT_NAME <$GIT_EMAIL>"

# Check if Git is installed
if ! command -v git &> /dev/null; then
    print_error "Git is not installed. Please install Git first."
    exit 1
fi

# Remove existing .git if exists
if [ -d ".git" ]; then
    print_warning "Removing existing .git directory..."
    rm -rf .git
fi

# Initialize Git repository
print_status "Initializing Git repository..."
git init
print_success "Git repository initialized"

# Set Git configuration
print_status "Configuring Git..."
git config user.email "$GIT_EMAIL"
git config user.name "$GIT_NAME"
print_success "Git configuration set"

# Rename branch to main
print_status "Setting up main branch..."
git branch -M main

# Create/update README.md as main README
print_status "Setting up README.md..."
if [ -f "README-github.md" ]; then
    cp README-github.md README.md
    print_success "README.md updated from README-github.md"
else
    print_warning "README-github.md not found, using existing README.md"
fi

# Add all files
print_status "Adding files to Git..."
git add .

# Check if there are any changes to commit
if git diff --staged --quiet; then
    print_warning "No changes to commit"
else
    # Commit changes
    print_status "Committing changes..."
    git commit -m "🚀 RAGKKU - AI Document Chat System

✨ Features:
- 🤖 AI Document Chat with Google Gemini
- 📄 Multi-format support (PDF, CSV, TXT)
- 🌐 Beautiful web interface with admin panel
- 🔧 n8n workflow integration for automation
- 🛠️ CORS bypass solutions for browser compatibility
- 📱 Mobile-friendly responsive design
- 🐳 Docker deployment ready

🏗️ Architecture:
- Frontend: Vanilla HTML/CSS/JavaScript
- Backend: n8n automation workflows
- AI Engine: Google Gemini API
- Vector Store: In-memory embeddings
- Deployment: Docker + Nginx + Static hosting

🎯 Working Solutions:
- Direct n8n chat interface (CORS-free)
- Form upload with drag & drop
- Admin panel with multiple upload methods
- Debug tools and troubleshooting guides
- Production-ready deployment configs

🚀 Ready for:
- GitHub Pages deployment
- Vercel/Netlify hosting
- Docker containerization
- Custom domain setup

Made with ❤️ for the AI community!"
    
    print_success "Changes committed"
fi

# Add remote origin
print_status "Adding remote origin: $REMOTE_URL"
git remote add origin "$REMOTE_URL"

echo ""
print_success "Repository setup completed!"
echo ""
echo "📋 Next steps:"
echo "   1. Push to GitHub: git push -u origin main"
echo "   2. Enable GitHub Pages in repository settings"
echo "   3. Update n8n endpoints in HTML files if needed"
echo "   4. Test the deployment"
echo ""

echo "🔗 Repository links:"
echo "   • Repository: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo "   • GitHub Pages: https://$GITHUB_USERNAME.github.io/$REPO_NAME"
echo "   • Issues: https://github.com/$GITHUB_USERNAME/$REPO_NAME/issues"
echo ""

echo "🚀 Push commands:"
echo "   git push -u origin main"
echo ""

print_status "Checking repository status..."
echo "Repository status:"
git status --short

echo ""
print_status "Checking commit log..."
echo "Last commit:"
git log --oneline -1

echo ""
print_success "RAGKKU repository is ready to push to GitHub! 🎉"

echo ""
echo "💡 Quick push command:"
echo "   git push -u origin main"
echo ""
