# 🤖 RAGKKU - AI Document Chat System

**Retrieval Augmented Generation Knowledge Knowledge University**

Sistem AI yang memungkinkan Anda untuk mengunggah dokumen (PDF, CSV, TXT) dan mengajukan pertanyaan tentang isinya menggunakan Google Gemini AI dan n8n workflow automation.

![RAGKKU Banner](https://img.shields.io/badge/RAGKKU-AI%20Document%20Chat-blue?style=for-the-badge&logo=openai)

## 🌟 **Features**

- 📄 **Multi-format Document Support** - PDF, CSV, TXT files
- 🤖 **AI-Powered Responses** - Google Gemini integration
- 🔍 **Contextual Answers** - AI responds based on uploaded documents
- 🌐 **Web Interface** - Beautiful, responsive UI
- 🛠️ **Admin Panel** - Easy document management
- 🔧 **n8n Workflow** - Automated document processing
- 📱 **Mobile Friendly** - Works on all devices
- 🔄 **Multiple Upload Methods** - Form, API, drag & drop

## 🚀 **Quick Start**

### **Option 1: Direct Access (Recommended)**

1. **Upload Document:** [Form Upload](https://n8n.yanwarpro.my.id/form/82848bc4-5ea2-4e5a-8bb6-3c09b94a8c5d)
2. **Chat with AI:** [Direct Chat](https://n8n.yanwarpro.my.id/chat/d744b523-7378-49a5-9696-bf381ff6221f)

### **Option 2: Self-Hosted**

1. Clone this repository
2. Open `index.html` in a web server
3. Configure n8n endpoints in JavaScript files
4. Upload documents and start chatting!

## 📁 **Project Structure**

```
ragkku/
├── 🏠 Frontend/
│   ├── index.html              # Landing page
│   ├── chat-cors-bypass.html   # CORS-aware chat interface
│   ├── admin-fixed.html        # Admin panel with multiple upload methods
│   └── assets/
│       ├── styles/
│       └── scripts/
├── 🔧 n8n-workflows/
│   ├── ragkku-main.json        # Core RAG workflow
│   └── ragkku-api-wrapper.json # API wrapper workflow
├── 📚 docs/
│   ├── setup-guide.md          # Complete setup instructions
│   ├── troubleshooting.md      # Common issues & solutions
│   └── api-documentation.md    # API endpoints reference
└── 🚀 deployment/
    ├── docker-compose.yml      # For containerized deployment
    └── nginx.conf              # CORS proxy configuration
```

## 🛠️ **Tech Stack**

- **Frontend:** Vanilla HTML/CSS/JavaScript
- **AI Engine:** Google Gemini API
- **Workflow:** n8n automation platform
- **Vector Store:** In-memory embeddings
- **Document Processing:** PDF.js, CSV parsing
- **Styling:** Custom CSS with FontAwesome icons

## 🎯 **Use Cases**

- 📖 **Document Analysis** - Analyze research papers, reports, manuals
- 💼 **Business Intelligence** - Query CSV data, financial reports
- 🎓 **Education** - Study materials, textbook Q&A
- 📋 **Legal Documents** - Contract analysis, policy reviews
- 🔬 **Research** - Academic papers, technical documentation

## 🖥️ **Screenshots**

### Landing Page
Beautiful, modern interface with clear navigation and feature highlights.

### Chat Interface  
Real-time AI chat with document context and typing indicators.

### Admin Panel
Easy document upload with drag & drop, progress tracking, and history.

## 🚦 **Status & Endpoints**

| Component | Status | URL | Description |
|-----------|--------|-----|-------------|
| 🏠 Landing Page | ✅ Active | `index.html` | Main entry point |
| 🤖 Chat Interface | ✅ Active | [Chat Link](https://n8n.yanwarpro.my.id/chat/d744b523-7378-49a5-9696-bf381ff6221f) | Direct n8n chat |
| 📤 Upload Form | ✅ Active | [Upload Link](https://n8n.yanwarpro.my.id/form/82848bc4-5ea2-4e5a-8bb6-3c09b94a8c5d) | Document upload |
| 🛠️ Admin Panel | ✅ Active | `admin-fixed.html` | Document management |
| 🔧 API Endpoints | ⚠️ CORS Limited | See docs | Webhook APIs |

## 📖 **Documentation**

- **[Setup Guide](docs/setup-guide.md)** - Complete installation & configuration
- **[Troubleshooting](docs/troubleshooting.md)** - Common issues & solutions  
- **[API Documentation](docs/api-documentation.md)** - Endpoint reference
- **[CORS Solutions](docs/cors-solutions.md)** - Handling browser restrictions

## 🔧 **Configuration**

### **n8n Environment Variables**
```bash
N8N_CORS_ORIGIN=*
WEBHOOK_CORS_ALLOWED_ORIGINS=*
WEBHOOK_CORS_ALLOWED_METHODS=GET,HEAD,POST,PUT,DELETE,OPTIONS
WEBHOOK_CORS_ALLOWED_HEADERS=Content-Type,Authorization,X-Requested-With,Accept
```

### **Google Gemini API**
```javascript
const CONFIG = {
    googleGeminiApiKey: 'your-api-key',
    model: 'gemini-pro',
    maxTokens: 4096
};
```

## 🚀 **Deployment Options**

### **1. Static Hosting (Vercel/Netlify)**
```bash
git clone https://github.com/yourusername/ragkku.git
cd ragkku
# Deploy to Vercel/Netlify
```

### **2. Docker Deployment**
```bash
docker-compose up -d
```

### **3. Manual Server Setup**
```bash
# Serve with any HTTP server
python -m http.server 8000
# or
npx serve .
```

## 🔍 **Troubleshooting**

### **Common Issues**

**CORS Errors:**
- Use direct n8n chat interface
- Configure proxy server
- Check CORS environment variables

**Upload Failures:**
- Verify file format (PDF, CSV, TXT)
- Check file size limits (10MB)
- Ensure n8n workflow is active

**AI Not Responding:**
- Verify Google Gemini API key
- Check document upload success
- Test endpoints with curl/Postman

See [detailed troubleshooting guide](docs/troubleshooting.md) for more solutions.

## 🤝 **Contributing**

1. Fork the repository
2. Create feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open Pull Request

## 📄 **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 **Acknowledgments**

- **n8n** - Workflow automation platform
- **Google Gemini** - AI language model
- **FontAwesome** - Icons and styling
- **Community** - Feedback and contributions

## 📞 **Support**

- 📧 **Email:** support@ragkku.dev
- 💬 **Discord:** [Join our community](https://discord.gg/ragkku)
- 🐛 **Issues:** [GitHub Issues](https://github.com/yourusername/ragkku/issues)
- 📖 **Docs:** [Documentation Site](https://docs.ragkku.dev)

## 🔮 **Roadmap**

- [ ] **Multiple AI Models** - OpenAI, Claude, Local LLMs
- [ ] **Advanced Vector Store** - Pinecone, Weaviate integration
- [ ] **User Authentication** - Multi-user support
- [ ] **File Management** - Organize documents in folders
- [ ] **API Rate Limiting** - Enterprise-grade scaling
- [ ] **Mobile App** - Native iOS/Android applications

---

**Made with ❤️ by the RAGKKU Team**

⭐ **Star this repo if you found it helpful!**
