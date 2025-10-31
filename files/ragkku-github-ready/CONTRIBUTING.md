# 🤝 Contributing to RAGKKU

Thank you for your interest in contributing to RAGKKU! This document provides guidelines and information for contributors.

## 🌟 **How to Contribute**

### **1. Types of Contributions**

We welcome contributions in the following areas:

- 🐛 **Bug Fixes** - Fix issues and improve stability
- ✨ **New Features** - Add new functionality
- 📚 **Documentation** - Improve guides and API docs
- 🎨 **UI/UX Improvements** - Enhance user experience
- 🔧 **Performance** - Optimize speed and efficiency
- 🧪 **Testing** - Add tests and improve coverage
- 🌐 **Translations** - Add language support

### **2. Getting Started**

1. **Fork the Repository**
   ```bash
   # Click "Fork" on GitHub, then clone your fork
   git clone https://github.com/yourusername/ragkku.git
   cd ragkku
   ```

2. **Set Up Development Environment**
   ```bash
   # Install dependencies (if any)
   npm install
   
   # Start development server
   npm run dev
   ```

3. **Create a Branch**
   ```bash
   # Create a new branch for your feature
   git checkout -b feature/amazing-feature
   ```

## 📋 **Development Guidelines**

### **Code Style**

- **HTML:** Use semantic HTML5 elements
- **CSS:** Follow BEM methodology for class naming
- **JavaScript:** Use ES6+ features, prefer const/let over var
- **Comments:** Write clear, concise comments for complex logic

### **File Organization**
```
ragkku/
├── index.html              # Main landing page
├── chat-*.html             # Chat interfaces
├── admin-*.html            # Admin panels
├── docs/                   # Documentation
├── n8n-workflows/          # n8n workflow exports
└── assets/                 # Static assets (future)
```

### **Naming Conventions**

- **Files:** `kebab-case.html`
- **CSS Classes:** `.block__element--modifier`
- **JavaScript Variables:** `camelCase`
- **Constants:** `UPPER_SNAKE_CASE`

## 🔧 **Development Process**

### **1. Before You Start**

- Check existing issues to avoid duplicates
- Create an issue to discuss major changes
- Review the project roadmap
- Ensure your idea aligns with project goals

### **2. Making Changes**

1. **Write Good Code**
   ```javascript
   // Good: Clear, documented function
   /**
    * Sends a message to the AI and processes the response
    * @param {string} message - User's message
    * @param {string} endpoint - API endpoint URL
    * @returns {Promise<Object>} AI response data
    */
   async function sendMessage(message, endpoint) {
       // Implementation
   }
   ```

2. **Test Your Changes**
   ```bash
   # Manual testing
   npm run dev
   
   # Test different browsers
   # Test mobile responsiveness
   # Test CORS scenarios
   ```

3. **Update Documentation**
   - Update README.md if needed
   - Add/update code comments
   - Update setup guides
   - Document new features

### **3. Submitting Changes**

1. **Commit Messages**
   ```bash
   # Good commit message format
   git commit -m "🐛 Fix CORS issue in chat interface
   
   - Add proper error handling for fetch failures
   - Implement fallback to direct n8n chat
   - Update debug panel with CORS detection
   
   Fixes #123"
   ```

2. **Push and Create PR**
   ```bash
   git push origin feature/amazing-feature
   # Then create Pull Request on GitHub
   ```

## 📝 **Pull Request Guidelines**

### **PR Title Format**
```
🎨 Improve chat interface design
🐛 Fix document upload validation
✨ Add support for new file formats
📚 Update installation documentation
🔧 Optimize loading performance
```

### **PR Description Template**
```markdown
## Description
Brief description of what this PR does.

## Type of Change
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] Documentation update

## Testing
- [ ] Tested in Chrome/Firefox/Safari
- [ ] Tested on mobile devices
- [ ] Tested CORS scenarios
- [ ] Manual testing completed

## Screenshots (if applicable)
Add screenshots to help explain your changes.

## Checklist
- [ ] My code follows the style guidelines
- [ ] I have performed a self-review
- [ ] I have commented my code where necessary
- [ ] I have updated the documentation
- [ ] My changes generate no new warnings
```

## 🐛 **Bug Reports**

### **Before Reporting**
- Search existing issues
- Test with latest version
- Try different browsers
- Check CORS-related issues

### **Bug Report Template**
```markdown
**Describe the bug**
A clear description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:
1. Go to '...'
2. Click on '....'
3. Scroll down to '....'
4. See error

**Expected behavior**
What you expected to happen.

**Screenshots**
If applicable, add screenshots.

**Environment:**
- OS: [e.g., Windows 10, macOS Big Sur]
- Browser: [e.g., Chrome 96, Firefox 95]
- n8n Version: [if known]
- RAGKKU Version: [e.g., v1.0.0]

**Additional context**
Any other context about the problem.
```

## 💡 **Feature Requests**

### **Feature Request Template**
```markdown
**Is your feature request related to a problem?**
A clear description of what the problem is.

**Describe the solution you'd like**
A clear description of what you want to happen.

**Describe alternatives you've considered**
Alternative solutions or features you've considered.

**Additional context**
Any other context or screenshots about the feature request.

**Implementation Ideas**
If you have ideas about how to implement this feature.
```

## 🧪 **Testing Guidelines**

### **Manual Testing Checklist**
- [ ] Document upload works
- [ ] Chat functionality responds
- [ ] Admin panel accessible
- [ ] CORS handling works
- [ ] Mobile responsive
- [ ] Different file formats
- [ ] Error scenarios
- [ ] Network offline/online

### **Browser Testing**
- [ ] Chrome (latest)
- [ ] Firefox (latest)
- [ ] Safari (latest)
- [ ] Edge (latest)
- [ ] Mobile browsers

## 📚 **Documentation**

### **When to Update Docs**
- Adding new features
- Changing existing functionality
- Fixing bugs that affect usage
- Updating setup procedures

### **Documentation Types**
- **README.md** - Main project overview
- **SETUP.md** - Installation and configuration
- **docs/troubleshooting.md** - Common issues
- **docs/api-documentation.md** - API reference
- **Code comments** - Inline documentation

## 🎉 **Recognition**

### **Contributors**
All contributors will be:
- Added to README.md contributors section
- Mentioned in release notes
- Acknowledged in commit messages

### **Types of Recognition**
- 🥇 **Gold Contributors** - Major features, architecture
- 🥈 **Silver Contributors** - Multiple contributions
- 🥉 **Bronze Contributors** - Bug fixes, documentation

## 📞 **Getting Help**

### **Where to Ask Questions**
- 💬 **GitHub Discussions** - General questions
- 🐛 **GitHub Issues** - Bug reports
- 📧 **Email** - contact@ragkku.dev
- 🔗 **Discord** - Real-time chat

### **Response Times**
- Issues: 24-48 hours
- Pull Requests: 48-72 hours
- Questions: 24 hours

## 🏆 **Best Practices**

### **Code Quality**
- Write self-documenting code
- Add comments for complex logic
- Use consistent formatting
- Follow established patterns

### **Git Practices**
- Use descriptive commit messages
- Keep commits atomic (one change per commit)
- Rebase before submitting PR
- Test before committing

### **Communication**
- Be respectful and constructive
- Provide clear, detailed descriptions
- Ask for clarification when needed
- Help others in discussions

## 📈 **Project Roadmap**

### **Current Priorities**
1. 🔧 Improve CORS handling
2. 📱 Better mobile experience
3. 🚀 Performance optimization
4. 🧪 Add automated testing
5. 🌐 Multi-language support

### **Future Goals**
- Multiple AI model support
- Advanced vector store integration
- User authentication system
- Enterprise features
- Mobile applications

---

## 🙏 **Thank You**

Thank you for contributing to RAGKKU! Your efforts help make this project better for everyone. Every contribution, no matter how small, is valuable and appreciated.

**Happy coding! 🚀**
