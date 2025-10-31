#!/bin/bash

# 🚀 RAGKKU GitHub Deployment Script
# This script initializes a Git repository and pushes to GitHub

set -e

echo "🚀 RAGKKU GitHub Deployment Script"
echo "=================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
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

# Check if Git is installed
if ! command -v git &> /dev/null; then
    print_error "Git is not installed. Please install Git first."
    exit 1
fi

# Get repository information
echo ""
read -p "Enter your GitHub username: " GITHUB_USERNAME
read -p "Enter repository name (default: ragkku): " REPO_NAME
REPO_NAME=${REPO_NAME:-ragkku}

read -p "Enter your email for Git commits: " GIT_EMAIL
read -p "Enter your name for Git commits: " GIT_NAME

# Validate inputs
if [[ -z "$GITHUB_USERNAME" || -z "$GIT_EMAIL" || -z "$GIT_NAME" ]]; then
    print_error "All fields are required!"
    exit 1
fi

# Set Git configuration
print_status "Configuring Git..."
git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_NAME"

# Initialize Git repository if not already initialized
if [ ! -d ".git" ]; then
    print_status "Initializing Git repository..."
    git init
    print_success "Git repository initialized"
else
    print_warning "Git repository already exists"
fi

# Create/update .gitignore if needed
if [ ! -f ".gitignore" ]; then
    print_status "Creating .gitignore..."
    cat > .gitignore << 'EOF'
# See existing .gitignore content above
EOF
    print_success ".gitignore created"
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
    git commit -m "🚀 Initial RAGKKU project setup

Features:
- 🤖 AI Document Chat System
- 📄 Multi-format support (PDF, CSV, TXT)
- 🌐 Web interface with admin panel
- 🔧 n8n workflow integration
- 🛠️ CORS bypass solutions
- 📱 Mobile-friendly design
- 🐳 Docker deployment ready

Components:
- Frontend: Vanilla HTML/CSS/JS
- Backend: n8n workflows
- AI: Google Gemini integration
- Deployment: Docker + Nginx"
    
    print_success "Changes committed"
fi

# Add remote origin
REMOTE_URL="https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
print_status "Adding remote origin: $REMOTE_URL"

# Remove existing remote if it exists
git remote remove origin 2>/dev/null || true
git remote add origin "$REMOTE_URL"

# Create main branch and push
print_status "Setting up main branch..."
git branch -M main

echo ""
print_warning "Important: Make sure you have created the repository '$REPO_NAME' on GitHub first!"
print_warning "Repository URL: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo ""

read -p "Have you created the repository on GitHub? (y/N): " REPO_CREATED

if [[ "$REPO_CREATED" =~ ^[Yy]$ ]]; then
    print_status "Pushing to GitHub..."
    
    # Push to GitHub
    if git push -u origin main; then
        print_success "Successfully pushed to GitHub!"
        echo ""
        echo "🎉 RAGKKU has been deployed to GitHub!"
        echo ""
        echo "📋 Next steps:"
        echo "   1. Visit: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
        echo "   2. Enable GitHub Pages (Settings → Pages)"
        echo "   3. Update README.md with your specific URLs"
        echo "   4. Configure n8n workflows with your endpoints"
        echo "   5. Set up environment variables"
        echo ""
        echo "🔗 Quick links:"
        echo "   • Repository: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
        echo "   • GitHub Pages: https://$GITHUB_USERNAME.github.io/$REPO_NAME"
        echo "   • Issues: https://github.com/$GITHUB_USERNAME/$REPO_NAME/issues"
        echo ""
        echo "📚 Documentation:"
        echo "   • Setup Guide: SETUP.md"
        echo "   • Troubleshooting: docs/troubleshooting.md"
        echo "   • API Docs: docs/api-documentation.md"
        echo ""
        print_success "Deployment completed successfully!"
    else
        print_error "Failed to push to GitHub. Please check:"
        echo "   1. Repository exists on GitHub"
        echo "   2. You have push permissions"
        echo "   3. Your Git credentials are correct"
        echo ""
        echo "Manual push command:"
        echo "   git push -u origin main"
    fi
else
    print_warning "Please create the repository on GitHub first, then run:"
    echo "   git push -u origin main"
fi

echo ""
print_status "Repository information:"
echo "   • Local repository: $(pwd)"
echo "   • Remote URL: $REMOTE_URL"
echo "   • Branch: main"
echo "   • Last commit: $(git log -1 --pretty=format:'%h - %s (%cr)')"

echo ""
print_success "Git repository is ready! 🎉"
