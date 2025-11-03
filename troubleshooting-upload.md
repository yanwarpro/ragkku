# 🔧 RAGKKU Upload Troubleshooting Guide

## 🚨 Masalah: "Upload gagal: Failed to fetch"

### **Root Cause Analysis:**
Error "Failed to fetch" terjadi karena:
1. **CORS Policy** - Browser memblokir request lintas domain
2. **Network Issues** - Koneksi terputus atau timeout
3. **n8n Workflow Tidak Aktif** - Endpoint tidak responsive
4. **SSL/HTTPS Issues** - Mixed content problems

---

## 🛠️ **Solusi Langkah-demi-Langkah**

### **Solusi 1: Gunakan Form n8n Langsung (RECOMMENDED) ✅**

**Cara Termudah:**
1. Buka: https://n8n.yanwarpro.my.id/form/82848bc4-5ea2-4e5a-8bb6-3c09b94a8c5d
2. Upload file langsung di form n8n
3. Tidak ada masalah CORS

**Keuntungan:**
- ✅ Tidak ada masalah CORS
- ✅ Upload langsung ke n8n 
- ✅ Proses otomatis ke vector store
- ✅ Paling reliable

### **Solusi 2: Gunakan Admin Panel yang Diperbaiki**

File `admin-fixed.html` sudah dilengkapi dengan:
- **Multiple upload methods** (Form + API)
- **Better error handling**
- **Connection testing**
- **Fallback mechanisms**

**Features:**
```javascript
// Method 1: Form Upload (Primary)
uploadViaForm() // Direct ke form trigger

// Method 2: API Upload (Fallback) 
uploadViaAPI() // Via wrapper API dengan base64
```

### **Solusi 3: Manual API Testing**

**Test koneksi dengan curl:**
```bash
# Test form endpoint
curl -X POST https://n8n.yanwarpro.my.id/form/82848bc4-5ea2-4e5a-8bb6-3c09b94a8c5d \
  -F "field0=@/path/to/your/document.pdf"

# Test chat endpoint
curl -X POST https://n8n.yanwarpro.my.id/webhook/4091fa09-fb9a-4039-9411-7104d213f601 \
  -H "Content-Type: application/json" \
  -d '{"message": "test connection"}'
```

### **Solusi 4: Deploy dengan Proxy/CORS Headers**

**Jika hosting di server sendiri, tambahkan CORS headers:**

**Nginx:**
```nginx
location /api/ {
    proxy_pass https://n8n.yanwarpro.my.id/;
    
    # CORS Headers
    add_header Access-Control-Allow-Origin *;
    add_header Access-Control-Allow-Methods "GET, POST, OPTIONS";
    add_header Access-Control-Allow-Headers "Content-Type, Authorization";
    
    # Handle preflight
    if ($request_method = 'OPTIONS') {
        return 204;
    }
}
```

**Apache:**
```apache
<Directory "/var/www/html">
    Header always set Access-Control-Allow-Origin "*"
    Header always set Access-Control-Allow-Methods "GET, POST, OPTIONS"
    Header always set Access-Control-Allow-Headers "Content-Type, Authorization"
</Directory>
```

---

## 📋 **Debugging Checklist**

### **1. Verify n8n Workflows Status**
```bash
# Check if workflows are active
curl https://n8n.yanwarpro.my.id/healthz
```

**Expected workflows status:**
- ✅ RAGKKU (Core RAG) - ACTIVE
- ✅ RAGKKU API Wrapper - ACTIVE  

### **2. Test Individual Endpoints**

**Form Trigger Test:**
```javascript
// Browser Console
fetch('https://n8n.yanwarpro.my.id/form/82848bc4-5ea2-4e5a-8bb6-3c09b94a8c5d')
  .then(r => console.log('Form accessible:', r.status))
  .catch(e => console.error('Form error:', e));
```

**Chat Webhook Test:**
```javascript
fetch('https://n8n.yanwarpro.my.id/webhook/4091fa09-fb9a-4039-9411-7104d213f601', {
  method: 'POST',
  headers: {'Content-Type': 'application/json'},
  body: JSON.stringify({message: 'test'})
}).then(r => r.json()).then(console.log);
```

### **3. Browser Developer Tools**

**Check Console for errors:**
1. Open F12 → Console tab
2. Look for CORS errors
3. Check Network tab for failed requests
4. Verify request/response headers

**Common Error Messages:**
- `Access to fetch blocked by CORS policy`
- `Mixed Content: blocked loading`
- `NET::ERR_CONNECTION_REFUSED`

### **4. Network Connectivity**

**Test from different locations:**
```bash
# Test from server
curl -I https://n8n.yanwarpro.my.id/

# Test DNS resolution
nslookup n8n.yanwarpro.my.id

# Test SSL certificate
openssl s_client -connect n8n.yanwarpro.my.id:443
```

---

## 🔄 **Alternative Upload Methods**

### **Method 1: Direct Form (Recommended)**
- URL: https://n8n.yanwarpro.my.id/form/82848bc4-5ea2-4e5a-8bb6-3c09b94a8c5d
- No CORS issues
- Direct integration

### **Method 2: Email to n8n (Advanced)**
Setup email trigger di n8n untuk upload via email attachment.

### **Method 3: Google Drive Integration**
Connect Google Drive → n8n → RAGKKU workflow.

### **Method 4: FTP/SFTP Upload**
Setup FTP server yang terhubung ke n8n.

---

## ⚙️ **n8n Configuration Check**

### **Workflow RAGKKU Settings:**
```json
{
  "formTrigger": {
    "enabled": true,
    "webhookId": "82848bc4-5ea2-4e5a-8bb6-3c09b94a8c5d",
    "acceptedFileTypes": ".pdf, .csv, .txt"
  },
  "chatTrigger": {
    "enabled": true, 
    "webhookId": "4091fa09-fb9a-4039-9411-7104d213f601"
  }
}
```

### **Required Credentials:**
- ✅ Google Gemini API Key
- ✅ Vector Store Configuration
- ✅ Webhook Permissions

### **Verify Vector Store:**
```javascript
// Test if vector store has data
// Check n8n execution logs for:
- Document processing success
- Vector embeddings created
- Memory key populated
```

---

## 🚨 **Emergency Workarounds**

### **If All Else Fails:**

1. **Manual Text Input:**
   - Copy-paste document text ke chat
   - Ask questions directly

2. **Use Chat Interface Only:**
   - Skip upload completely
   - Use AI untuk general questions

3. **Local Processing:**
   - Use local RAG tools
   - Export data from n8n

4. **Alternative AI Services:**
   - Claude with files upload
   - ChatGPT with document plugin
   - Google Bard with file support

---

## 📊 **Monitoring & Logs**

### **Check n8n Execution Logs:**
1. Login ke n8n dashboard
2. Go to Executions tab
3. Check failed executions
4. Review error messages

### **Browser Network Monitoring:**
```javascript
// Monitor fetch requests
const originalFetch = window.fetch;
window.fetch = function(...args) {
  console.log('Fetch request:', args);
  return originalFetch.apply(this, args)
    .then(response => {
      console.log('Fetch response:', response);
      return response;
    });
};
```

### **Performance Monitoring:**
- Response time: < 30 seconds
- Success rate: > 95%
- File size limit: 10MB
- Concurrent uploads: 1 per session

---

## 🆘 **Get Help**

### **Escalation Path:**
1. **Check this guide** first
2. **Test with curl** to isolate browser issues  
3. **Check n8n logs** for server-side errors
4. **Use direct form** as fallback
5. **Contact admin** if persistent issues

### **Information to Provide:**
- Browser type & version
- File type & size being uploaded
- Exact error message
- Network environment (WiFi/Mobile/VPN)
- Screenshots of browser console

---

## ✅ **Success Indicators**

**Upload berhasil jika:**
- ✅ File uploaded tanpa error
- ✅ n8n execution completed
- ✅ Vector store updated
- ✅ Chat responds dengan document context
- ✅ Admin history shows upload

**Test workflow end-to-end:**
1. Upload document → Success ✅
2. Open chat interface → OK ✅  
3. Ask about document → AI responds ✅
4. Verify answers are contextual ✅

---

**Dengan panduan ini, masalah upload seharusnya bisa teratasi! 🎯**
