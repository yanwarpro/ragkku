# 🚀 RAGKKU Web Application

Aplikasi web lengkap untuk sistem RAGKKU (RAG + KKU) yang memungkinkan admin untuk mengupload dokumen dan user untuk chat dengan AI berdasarkan dokumen tersebut.

## 📁 Struktur File

```
ragkku-webapp/
├── index.html          # Landing page utama
├── admin.html          # Panel admin untuk upload dokumen
├── chat.html           # Interface chat untuk user
└── README.md           # Dokumentasi ini
```

## 🌟 Fitur Aplikasi

### 🏠 **Landing Page (index.html)**
- **Overview sistem** dengan penjelasan fitur
- **Status indicator** - menampilkan status sistem online/offline
- **Navigation** ke admin panel dan chat interface
- **Responsive design** untuk semua device
- **Modern UI** dengan gradient dan animasi

### 👨‍💼 **Admin Panel (admin.html)**
- **Authentication** dengan password protection
- **Drag & drop upload** atau browse file
- **File validation** (PDF, CSV, TXT, max 10MB)
- **Upload progress** dengan indicator visual
- **Upload history** tersimpan di localStorage
- **Real-time status** upload success/error

### 💬 **Chat Interface (chat.html)**
- **Real-time chat** dengan AI
- **Message history** tersimpan di localStorage
- **Typing indicator** saat AI sedang berpikir
- **Quick action buttons** untuk pertanyaan umum
- **Message formatting** dengan markdown support
- **Connection status** indicator

## 🛠️ Setup & Deployment

### **Prasyarat**
1. ✅ Workflow RAGKKU sudah running di n8n
2. ✅ Workflow RAGKKU API Wrapper sudah aktif
3. ✅ Google Gemini credentials sudah dikonfigurasi
4. ✅ n8n accessible via https://n8n.yanwarpro.my.id/

### **Option 1: Static File Hosting**

#### **Netlify (Gratis)**
1. Zip semua file HTML
2. Drag & drop ke [Netlify Drop](https://app.netlify.com/drop)
3. Get URL otomatis (contoh: `https://abc123.netlify.app`)

#### **Vercel (Gratis)**
1. Upload file ke GitHub repository
2. Connect Vercel ke GitHub repo
3. Auto-deploy setiap push

#### **GitHub Pages (Gratis)**
1. Create repository di GitHub
2. Upload semua file HTML
3. Enable GitHub Pages di repository settings
4. Access via `https://username.github.io/repo-name`

### **Option 2: VPS/Server**

#### **Apache/Nginx**
```bash
# Copy files to web directory
sudo cp *.html /var/www/html/

# Set permissions
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/
```

#### **Node.js Express Server**
```javascript
const express = require('express');
const path = require('path');
const app = express();

app.use(express.static(path.join(__dirname, 'public')));

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.listen(3000, () => {
    console.log('RAGKKU Web App running on port 3000');
});
```

### **Option 3: CDN (Fastest)**

Upload ke CDN seperti:
- **AWS S3 + CloudFront**
- **Google Cloud Storage**
- **Azure Static Web Apps**

## ⚙️ Konfigurasi

### **Admin Password**
Edit di `admin.html` line 340:
```javascript
const CONFIG = {
    adminPassword: 'admin123', // Ganti dengan password yang aman
    // ...
};
```

### **API Endpoints**
Jika n8n URL berbeda, update di semua file:
```javascript
// admin.html line 342
apiUrl: 'https://your-n8n-domain.com/webhook/ragkku/upload'

// chat.html line 298
apiUrl: 'https://your-n8n-domain.com/webhook/ragkku/chat'
```

### **CORS Settings**
Pastikan n8n webhook sudah set CORS headers:
```
Access-Control-Allow-Origin: *
Access-Control-Allow-Methods: POST, GET, OPTIONS
Access-Control-Allow-Headers: Content-Type
```

## 🔒 Security Considerations

### **Production Setup**
1. **Change admin password** ke password yang kuat
2. **Enable HTTPS** untuk semua endpoints
3. **Add rate limiting** di level server/proxy
4. **Implement proper authentication** (JWT, OAuth, dll)
5. **Validate file uploads** di server-side
6. **Monitor usage** dan setup alerts

### **Recommended Security Headers**
```nginx
add_header X-Frame-Options DENY;
add_header X-Content-Type-Options nosniff;
add_header X-XSS-Protection "1; mode=block";
add_header Strict-Transport-Security "max-age=31536000; includeSubDomains";
```

## 📱 Mobile Optimization

Aplikasi sudah responsive dengan:
- ✅ **Viewport meta tag** untuk mobile
- ✅ **Flexible grid layouts** 
- ✅ **Touch-friendly buttons** (min 44px)
- ✅ **Readable font sizes** 
- ✅ **Optimized for iOS/Android**

## 🎨 Customization

### **Branding**
- Edit **logo dan nama** di header
- Ganti **color scheme** di CSS variables
- Update **meta tags** untuk SEO

### **Features**
- Tambah **user authentication**
- Integrate **analytics** (Google Analytics)
- Add **feedback system**
- Implement **document management**

## 📊 Monitoring & Analytics

### **Built-in Monitoring**
- Connection status indicators
- Upload success/error tracking
- Chat message history
- Local storage usage tracking

### **Recommended Analytics**
```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

## 🚨 Troubleshooting

### **Common Issues**

#### **Upload Failed**
- Check file size (max 10MB)
- Validate file type (PDF/CSV/TXT only)
- Verify n8n webhook URL
- Check CORS headers

#### **Chat Not Working**
- Verify API endpoint URL
- Check n8n workflow is active
- Ensure Gemini credentials configured
- Test webhook manually with curl

#### **Authentication Issues**
- Verify admin password in config
- Clear browser localStorage
- Check browser console for errors

### **Debug Mode**
Add to browser console:
```javascript
// Clear chat history
clearChatHistory();

// Check localStorage
console.log(localStorage.getItem('ragkkuChatHistory'));
console.log(localStorage.getItem('uploadHistory'));

// Test API connection
fetch('https://n8n.yanwarpro.my.id/webhook/ragkku/chat', {
    method: 'POST',
    headers: {'Content-Type': 'application/json'},
    body: JSON.stringify({message: 'test'})
}).then(r => r.json()).then(console.log);
```

## 📈 Performance Optimization

### **Best Practices**
- **Minify CSS/JS** untuk production
- **Optimize images** dan icons
- **Enable gzip compression**
- **Use CDN** untuk static assets
- **Implement caching** headers

### **Lighthouse Scores Target**
- Performance: 90+
- Accessibility: 95+
- Best Practices: 90+
- SEO: 90+

## 🔄 Updates & Maintenance

### **Regular Tasks**
- Monitor n8n workflow performance
- Check API endpoint availability
- Update dependencies (Font Awesome, etc)
- Review and rotate admin passwords
- Clean up old localStorage data

### **Version Control**
```bash
# Create git repository
git init
git add .
git commit -m "Initial RAGKKU web app"

# Tag versions
git tag v1.0.0
```

## 📞 Support

### **Documentation**
- [n8n Documentation](https://docs.n8n.io/)
- [Google Gemini API](https://ai.google.dev/docs)
- [RAG Integration Guide](./ragkku-web-integration-guide.md)

### **Contact**
Untuk issue atau pertanyaan teknis, buat issue di repository atau contact admin.

---

## 🎉 **Selamat!**

Aplikasi web RAGKKU Anda sudah siap untuk production! 

**Next Steps:**
1. Deploy ke platform pilihan Anda
2. Test semua functionality
3. Share URL dengan users
4. Monitor performance dan usage

**Happy Deploying! 🚀**
