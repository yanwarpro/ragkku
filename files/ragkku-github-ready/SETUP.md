# 🚀 RAGKKU Setup Guide

## 📋 **Prerequisites**

- ✅ n8n instance (self-hosted or cloud)
- ✅ Google Gemini API key
- ✅ Web server (Nginx, Apache, or static hosting)
- ✅ Domain name (optional, for production)

## 🛠️ **Quick Setup**

### **1. Clone Repository**
```bash
git clone https://github.com/yourusername/ragkku.git
cd ragkku
```

### **2. Static Hosting (Easiest)**
```bash
# Using Python
python -m http.server 3000

# Using Node.js
npx serve . -p 3000

# Using PHP
php -S localhost:3000
```

### **3. Deploy to Vercel/Netlify**
```bash
# Vercel
vercel --prod

# Netlify
netlify deploy --prod --dir .
```

## 🔧 **n8n Configuration**

### **1. Import Workflows**
1. Open n8n dashboard
2. Import `n8n-workflows/ragkku-main.json`
3. Import `n8n-workflows/ragkku-api-wrapper.json`
4. Activate both workflows

### **2. Configure Credentials**
```javascript
// Google Gemini API
{
  "apiKey": "your-gemini-api-key",
  "model": "gemini-pro"
}
```

### **3. Environment Variables**
```bash
# Add to n8n environment
N8N_CORS_ORIGIN=*
WEBHOOK_CORS_ALLOWED_ORIGINS=*
WEBHOOK_CORS_ALLOWED_METHODS=GET,HEAD,POST,PUT,DELETE,OPTIONS
WEBHOOK_CORS_ALLOWED_HEADERS=Content-Type,Authorization,X-Requested-With,Accept
```

## 🌐 **Frontend Configuration**

### **1. Update Endpoints**
Edit JavaScript files to point to your n8n instance:

```javascript
// In all HTML files, update CONFIG object
const CONFIG = {
    endpoints: {
        upload: 'https://your-n8n-instance.com/form/your-form-id',
        chat: 'https://your-n8n-instance.com/chat/your-chat-id',
        webhook: 'https://your-n8n-instance.com/webhook/your-webhook-id'
    }
};
```

### **2. Test Endpoints**
```bash
# Test upload endpoint
curl -X POST https://your-n8n-instance.com/form/your-form-id \
  -F "field0=@test.pdf"

# Test chat endpoint  
curl -X POST https://your-n8n-instance.com/webhook/your-webhook-id \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello!"}'
```

## 🐳 **Docker Deployment**

### **1. Using Docker Compose**
```bash
# Start services
docker-compose up -d

# View logs
docker-compose logs -f

# Stop services
docker-compose down
```

### **2. Custom Docker Build**
```dockerfile
FROM nginx:alpine
COPY . /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
```

```bash
# Build image
docker build -t ragkku .

# Run container
docker run -p 3000:80 ragkku
```

## ☁️ **Cloud Deployment**

### **Vercel**
1. Connect GitHub repository
2. Set build command: `echo "Static site"`
3. Set output directory: `.`
4. Deploy

### **Netlify**
1. Connect GitHub repository
2. Build command: `echo "Static site"`
3. Publish directory: `.`
4. Deploy

### **GitHub Pages**
1. Push to GitHub
2. Settings → Pages
3. Source: Deploy from branch
4. Branch: main / (root)

## 🔐 **Security Setup**

### **1. Environment Variables**
```bash
# Never commit these to Git
GEMINI_API_KEY=your-secret-key
N8N_WEBHOOK_SECRET=your-webhook-secret
ADMIN_PASSWORD=your-admin-password
```

### **2. CORS Configuration**
```nginx
# nginx.conf
add_header Access-Control-Allow-Origin "https://your-domain.com";
add_header Access-Control-Allow-Methods "GET, POST, OPTIONS";
add_header Access-Control-Allow-Headers "Content-Type, Authorization";
```

### **3. Rate Limiting**
```nginx
# Rate limiting
limit_req_zone $binary_remote_addr zone=api:10m rate=10r/m;
limit_req zone=api burst=20 nodelay;
```

## 📊 **Monitoring Setup**

### **1. Health Checks**
```javascript
// Add to your deployment
const healthCheck = async () => {
    const endpoints = [
        'https://your-n8n-instance.com/healthz',
        'https://your-domain.com/api/status'
    ];
    
    for (const endpoint of endpoints) {
        const response = await fetch(endpoint);
        console.log(`${endpoint}: ${response.status}`);
    }
};
```

### **2. Error Tracking**
```javascript
// Add error tracking
window.addEventListener('error', (e) => {
    console.error('Global error:', e.error);
    // Send to your error tracking service
});
```

## 🧪 **Testing**

### **1. Functionality Tests**
```bash
# Test document upload
curl -X POST https://your-domain.com/api/upload \
  -F "file=@test.pdf"

# Test chat functionality
curl -X POST https://your-domain.com/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "What is this document about?"}'
```

### **2. Performance Tests**
```bash
# Load testing with curl
for i in {1..10}; do
  curl -w "@curl-format.txt" -o /dev/null https://your-domain.com/
done
```

## 🚨 **Troubleshooting**

### **Common Issues**

**CORS Errors:**
```bash
# Check CORS headers
curl -I -X OPTIONS https://your-domain.com/api/chat \
  -H "Origin: https://your-frontend-domain.com"
```

**n8n Connection Issues:**
```bash
# Test n8n connectivity
curl -I https://your-n8n-instance.com/healthz
```

**File Upload Failures:**
- Check file size limits
- Verify MIME types
- Test with different file formats

### **Debug Mode**
Enable debug mode in the frontend:
```javascript
// In browser console
localStorage.setItem('ragkku-debug', 'true');
location.reload();
```

## 📈 **Performance Optimization**

### **1. CDN Setup**
```html
<!-- Use CDN for static assets -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
```

### **2. Caching Strategy**
```nginx
# Cache static assets
location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg)$ {
    expires 1y;
    add_header Cache-Control "public, immutable";
}
```

### **3. Compression**
```nginx
# Enable gzip compression
gzip on;
gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;
```

## 🔄 **Updates & Maintenance**

### **1. Regular Updates**
```bash
# Pull latest changes
git pull origin main

# Restart services if needed
docker-compose restart
```

### **2. Backup Strategy**
```bash
# Backup configuration
cp -r config/ backup/config-$(date +%Y%m%d)/

# Backup user data
tar -czf backup/user-data-$(date +%Y%m%d).tar.gz uploads/
```

### **3. Monitoring Health**
```bash
# Check service status
docker-compose ps

# View logs
docker-compose logs --tail=100 -f
```

## 🎯 **Production Checklist**

- [ ] ✅ n8n workflows imported and active
- [ ] ✅ Google Gemini API configured
- [ ] ✅ CORS headers properly set
- [ ] ✅ HTTPS enabled (SSL certificate)
- [ ] ✅ Environment variables secured
- [ ] ✅ Error tracking implemented
- [ ] ✅ Health checks configured
- [ ] ✅ Backup strategy in place
- [ ] ✅ Rate limiting enabled
- [ ] ✅ Monitoring dashboards setup

## 📞 **Support**

If you encounter issues:

1. Check the [troubleshooting guide](troubleshooting.md)
2. Review n8n execution logs
3. Test endpoints with curl/Postman
4. Open GitHub issue with details
5. Join our Discord community

---

**Ready to deploy? Let's get RAGKKU up and running! 🚀**
