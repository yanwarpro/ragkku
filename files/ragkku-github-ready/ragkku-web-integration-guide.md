# 🚀 RAGKKU Web App Integration Guide

## 📋 Overview

Anda sekarang memiliki 2 workflow n8n untuk RAG system:
1. **RAGKKU** - Core RAG functionality
2. **RAGKKU API Wrapper** - REST API endpoints untuk web app

## 🔗 Available API Endpoints

### **Base URL**: `https://n8n.yanwarpro.my.id/`

---

## 📤 1. Upload Document API

**Upload dokumen untuk di-process ke vector store**

### Endpoint
```
POST https://n8n.yanwarpro.my.id/webhook/ragkku/upload
```

### Request Body
```json
{
  "file": "base64_encoded_file_or_url"
}
```

### Example Request (JavaScript)
```javascript
// Upload file dari form
const formData = new FormData();
formData.append('file', fileInput.files[0]);

fetch('https://n8n.yanwarpro.my.id/webhook/ragkku/upload', {
  method: 'POST',
  body: formData
})
.then(response => response.json())
.then(data => {
  console.log('Upload success:', data);
});
```

### Response
```json
{
  "status": "success",
  "message": "Document uploaded successfully",
  "data": {
    "processed": true,
    "chunks": 15,
    "vectorStoreUpdated": true
  }
}
```

---

## 💬 2. Chat API

**Kirim pertanyaan dan dapatkan jawaban dari RAG system**

### Endpoint
```
POST https://n8n.yanwarpro.my.id/webhook/ragkku/chat
```

### Request Body
```json
{
  "message": "Your question here"
}
```

### Example Request (JavaScript)
```javascript
const sendMessage = async (message) => {
  const response = await fetch('https://n8n.yanwarpro.my.id/webhook/ragkku/chat', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      message: message
    })
  });
  
  return await response.json();
};

// Usage
sendMessage("Apa isi dokumen yang saya upload?")
  .then(data => {
    console.log('AI Response:', data.response);
  });
```

### Response
```json
{
  "status": "success",
  "response": "Berdasarkan dokumen yang Anda upload...",
  "timestamp": "2025-10-30T15:20:00.000Z"
}
```

---

## 🌐 Web App Integration Examples

### **React.js Example**

```jsx
import React, { useState } from 'react';

const RAGChat = () => {
  const [message, setMessage] = useState('');
  const [response, setResponse] = useState('');
  const [loading, setLoading] = useState(false);

  const handleUpload = async (file) => {
    const formData = new FormData();
    formData.append('file', file);
    
    try {
      const response = await fetch('https://n8n.yanwarpro.my.id/webhook/ragkku/upload', {
        method: 'POST',
        body: formData
      });
      const data = await response.json();
      alert('Document uploaded successfully!');
    } catch (error) {
      console.error('Upload error:', error);
    }
  };

  const handleChat = async () => {
    setLoading(true);
    try {
      const response = await fetch('https://n8n.yanwarpro.my.id/webhook/ragkku/chat', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ message })
      });
      const data = await response.json();
      setResponse(data.response);
    } catch (error) {
      console.error('Chat error:', error);
    }
    setLoading(false);
  };

  return (
    <div>
      <input 
        type="file" 
        onChange={(e) => handleUpload(e.target.files[0])} 
      />
      
      <input 
        type="text" 
        value={message}
        onChange={(e) => setMessage(e.target.value)}
        placeholder="Ask about your document..."
      />
      
      <button onClick={handleChat} disabled={loading}>
        {loading ? 'Thinking...' : 'Send'}
      </button>
      
      {response && <div className="response">{response}</div>}
    </div>
  );
};

export default RAGChat;
```

### **HTML + Vanilla JavaScript**

```html
<!DOCTYPE html>
<html>
<head>
    <title>RAGKKU Web Interface</title>
    <style>
        .container { max-width: 800px; margin: 0 auto; padding: 20px; }
        .chat-box { border: 1px solid #ccc; height: 400px; overflow-y: auto; padding: 10px; }
        .input-area { margin-top: 10px; }
        input[type="text"] { width: 70%; padding: 10px; }
        button { padding: 10px 20px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>RAGKKU - Document Q&A</h1>
        
        <!-- Upload Section -->
        <div>
            <h3>Upload Document</h3>
            <input type="file" id="fileInput" accept=".pdf,.csv,.txt">
            <button onclick="uploadFile()">Upload</button>
        </div>
        
        <!-- Chat Section -->
        <div>
            <h3>Ask Questions</h3>
            <div id="chatBox" class="chat-box"></div>
            <div class="input-area">
                <input type="text" id="messageInput" placeholder="Ask about your document...">
                <button onclick="sendMessage()">Send</button>
            </div>
        </div>
    </div>

    <script>
        async function uploadFile() {
            const fileInput = document.getElementById('fileInput');
            const file = fileInput.files[0];
            
            if (!file) {
                alert('Please select a file first');
                return;
            }
            
            const formData = new FormData();
            formData.append('file', file);
            
            try {
                const response = await fetch('https://n8n.yanwarpro.my.id/webhook/ragkku/upload', {
                    method: 'POST',
                    body: formData
                });
                const data = await response.json();
                alert('Document uploaded successfully!');
                addToChatBox('System: Document uploaded and processed!');
            } catch (error) {
                console.error('Upload error:', error);
                alert('Upload failed');
            }
        }
        
        async function sendMessage() {
            const messageInput = document.getElementById('messageInput');
            const message = messageInput.value.trim();
            
            if (!message) return;
            
            addToChatBox(`You: ${message}`);
            messageInput.value = '';
            
            try {
                const response = await fetch('https://n8n.yanwarpro.my.id/webhook/ragkku/chat', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ message })
                });
                const data = await response.json();
                addToChatBox(`AI: ${data.response}`);
            } catch (error) {
                console.error('Chat error:', error);
                addToChatBox('AI: Sorry, there was an error processing your message.');
            }
        }
        
        function addToChatBox(message) {
            const chatBox = document.getElementById('chatBox');
            const messageDiv = document.createElement('div');
            messageDiv.textContent = message;
            messageDiv.style.marginBottom = '10px';
            chatBox.appendChild(messageDiv);
            chatBox.scrollTop = chatBox.scrollHeight;
        }
        
        // Allow Enter key to send message
        document.getElementById('messageInput').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                sendMessage();
            }
        });
    </script>
</body>
</html>
```

### **Next.js API Route Example**

```javascript
// pages/api/ragkku/[...action].js
export default async function handler(req, res) {
  const { action } = req.query;
  const actionType = action[0]; // 'upload' or 'chat'
  
  const baseUrl = 'https://n8n.yanwarpro.my.id/webhook/ragkku/';
  
  try {
    const response = await fetch(`${baseUrl}${actionType}`, {
      method: 'POST',
      headers: req.headers,
      body: JSON.stringify(req.body)
    });
    
    const data = await response.json();
    res.status(200).json(data);
  } catch (error) {
    res.status(500).json({ error: 'Failed to process request' });
  }
}
```

---

## 🔧 Setup Steps

### 1. **Aktifkan Workflow API Wrapper**
- Buka n8n dashboard
- Cari workflow "RAGKKU API Wrapper"
- Klik toggle untuk mengaktifkan

### 2. **Test Endpoints**
```bash
# Test upload endpoint
curl -X POST https://n8n.yanwarpro.my.id/webhook/ragkku/upload \
  -F "file=@/path/to/your/document.pdf"

# Test chat endpoint
curl -X POST https://n8n.yanwarpro.my.id/webhook/ragkku/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "What is this document about?"}'
```

### 3. **CORS Configuration**
API sudah dikonfigurasi dengan:
- `Access-Control-Allow-Origin: *`
- `Content-Type: application/json`

---

## 🛠️ Error Handling

### Common Errors & Solutions

**1. Upload Failed**
```json
{
  "error": "File upload failed",
  "details": "Supported formats: PDF, CSV, TXT"
}
```

**2. Chat Error**
```json
{
  "error": "No documents in vector store",
  "details": "Please upload a document first"
}
```

**3. Rate Limiting**
```json
{
  "error": "Too many requests",
  "details": "Please wait before sending another message"
}
```

---

## 📊 Monitoring & Analytics

### Webhook Statistics
- Check n8n execution history untuk melihat usage
- Monitor response times dan error rates
- Track document upload success rate

### Performance Tips
1. **Optimize file size** - Compress PDFs sebelum upload
2. **Chunking strategy** - Large documents akan di-split otomatis
3. **Caching** - Consider caching responses untuk pertanyaan umum

---

## 🔐 Security Considerations

### **Authentication** (Optional Enhancement)
Tambahkan API key authentication:

```javascript
// Add to webhook headers
headers: {
  'Authorization': 'Bearer YOUR_API_KEY',
  'Content-Type': 'application/json'
}
```

### **Rate Limiting**
Implement client-side rate limiting untuk avoid spam.

### **Input Validation**
Validate file types dan message content sebelum sending.

---

## 🚀 Next Steps

1. **Deploy web app** dengan integration code
2. **Test upload & chat** functionality
3. **Monitor performance** via n8n dashboard
4. **Scale up** jika diperlukan (upgrade vector store)

---

**Happy integrating! 🎉**

*RAGKKU sekarang siap untuk production use dengan web app Anda!*
