# 🤖 Panduan Setup WhatsApp Bot dengan Google Gemini AI

## 📋 Deskripsi Workflow

Workflow ini membuat chatbot WhatsApp yang menggunakan Google Gemini AI untuk memberikan respons otomatis. Bot akan:

- ✅ Menerima pesan WhatsApp secara otomatis
- ✅ Memfilter hanya pesan teks (menolak gambar, audio, dll)
- ✅ Memproses pertanyaan dengan Google Gemini AI
- ✅ Mengirim jawaban kembali ke pengirim

---

## 🚀 Langkah Setup

### 1. Setup WhatsApp Business API

#### A. Buat WhatsApp Business Account
1. Kunjungi [Meta for Developers](https://developers.facebook.com/)
2. Login dengan akun Facebook Anda
3. Buat aplikasi baru dan pilih "Business"
4. Tambahkan produk "WhatsApp"

#### B. Konfigurasi WhatsApp
1. **Dapatkan Phone Number ID:**
   - Buka WhatsApp Business API di dashboard
   - Catat Phone Number ID (contoh: `477115632141067`)

2. **Setup Webhook:**
   - Webhook URL: `https://your-n8n-domain.com/webhook/whatsapp`
   - Verify Token: buat token rahasia (contoh: `mySecretToken123`)
   - Subscribe ke field: `messages`

3. **Dapatkan Access Token:**
   - Generate token di Meta Developer Console
   - Simpan token untuk konfigurasi n8n

#### C. Konfigurasi di n8n
1. Buka n8n dan buat credentials WhatsApp baru
2. Masukkan:
   - **Access Token**: Token dari Meta
   - **Phone Number ID**: ID yang didapat tadi

### 2. Setup Google Gemini API

#### A. Buat API Key
1. Kunjungi [Google AI Studio](https://ai.google.dev/)
2. Login dengan akun Google
3. Klik "Create API Key"
4. Simpan API Key dengan aman

#### B. Konfigurasi di n8n
1. Buka n8n credentials
2. Buat credential baru untuk Google Gemini
3. Masukkan API Key yang sudah dibuat

### 3. Import dan Konfigurasi Workflow

#### A. Import Workflow
1. Download file `whatsapp-gemini-workflow.json`
2. Di n8n, pilih "Import from JSON"
3. Upload file workflow

#### B. Update Konfigurasi
1. **WhatsApp Nodes:**
   - Ganti `YOUR_PHONE_NUMBER_ID` dengan Phone Number ID sebenarnya
   - Pilih credentials WhatsApp yang sudah dibuat

2. **Gemini Node:**
   - Pilih credentials Google Gemini
   - Model sudah diset ke `gemini-2.0-flash-exp` (terbaru)

#### C. Test Workflow
1. Klik "Test Workflow" pada WhatsApp Trigger
2. Kirim pesan ke nomor WhatsApp Business Anda
3. Periksa apakah bot merespons dengan benar

---

## 🛠️ Struktur Workflow

```
WhatsApp Trigger
    ↓
Check Message Type (Switch)
    ↓                    ↓
Gemini AI          Handle Non-Text
    ↓                    ↓
Send Response      Error Message
```

### Node Details:

1. **WhatsApp Trigger**: Menangkap pesan masuk dari webhook
2. **Check Message Type**: Memfilter hanya pesan teks
3. **Gemini AI**: Memproses pertanyaan dengan AI
4. **Send Response**: Mengirim jawaban ke pengirim
5. **Handle Non-Text**: Mengirim pesan error untuk file non-teks

---

## 🎯 Customization

### Mengubah Prompt AI
Edit node "Gemini AI" dan ubah prompt:
```javascript
="Anda adalah customer service yang ramah. Jawab dalam bahasa Indonesia.

Pertanyaan: " + $('WhatsApp Trigger').item.json.messages[0].text.body
```

### Menambah Memory (Opsional)
Untuk bot yang bisa mengingat percakapan, tambahkan:
- Memory Buffer Window node
- Chat Model node (ganti Gemini node)
- Agent node untuk orchestration

### Integrasi Database
Untuk menyimpan riwayat chat:
- Tambahkan node database (MySQL, PostgreSQL, dll)
- Simpan pertanyaan dan jawaban
- Buat analytics dashboard

---

## ⚠️ Troubleshooting

### Bot Tidak Merespons
1. **Cek Webhook URL**: Pastikan n8n bisa diakses dari internet
2. **Verify Token**: Pastikan token webhook sama di Meta dan n8n
3. **Credentials**: Cek WhatsApp dan Gemini credentials
4. **Phone Number ID**: Pastikan ID benar dan aktif

### Error "Invalid Phone Number"
- Pastikan Phone Number ID sudah benar
- Nomor harus dalam format internasional (+62xxx)
- WhatsApp Business account harus verified

### Gemini API Error
- Cek API Key masih valid
- Pastikan quota API belum habis
- Model `gemini-2.0-flash-exp` tersedia di region Anda

---

## 📊 Monitoring

### Metrics yang Perlu Dipantau:
- **Response Time**: Waktu dari terima pesan hingga kirim jawaban
- **Error Rate**: Persentase pesan yang gagal diproses
- **API Usage**: Penggunaan quota Gemini API
- **Message Volume**: Jumlah pesan per hari/jam

### Log Locations:
- n8n execution logs
- WhatsApp webhook logs di Meta Developer Console
- Google Cloud Console untuk Gemini API

---

## 💡 Tips Optimization

1. **Rate Limiting**: Tambahkan delay untuk avoid spam
2. **Error Handling**: Tambahkan try-catch nodes
3. **Message Queue**: Gunakan Redis untuk high volume
4. **Caching**: Cache response untuk pertanyaan umum
5. **Analytics**: Gunakan Google Analytics atau Mixpanel

---

## 🔐 Security Best Practices

1. **API Keys**: Jangan hardcode, gunakan environment variables
2. **Webhook Security**: Gunakan HTTPS dan verify signature
3. **Rate Limiting**: Batasi jumlah request per user
4. **Input Validation**: Sanitize input dari user
5. **Access Control**: Limit akses ke n8n dashboard

---

## 📞 Support

Jika mengalami kendala:
1. Cek dokumentasi n8n: https://docs.n8n.io/
2. WhatsApp Business API docs: https://developers.facebook.com/docs/whatsapp
3. Google Gemini docs: https://ai.google.dev/docs

---

**Selamat! Bot WhatsApp dengan Gemini AI Anda sudah siap digunakan! 🎉**
