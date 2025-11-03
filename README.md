# RAGKKU

Ini adalah proyek RAGKKU.

## Cara Kerja Aplikasi

Aplikasi ini berfungsi sebagai antarmuka untuk mengunggah dokumen dan berinteraksi dengan model bahasa melalui API n8n. Berikut adalah alur kerjanya:

1.  **Unggah Dokumen**: Pengguna dapat mengunggah dokumen melalui halaman `admin.html`. Dokumen yang diunggah akan dikirim ke API `wrapperApiUrl` yang dikonfigurasi di `CONFIG`.
2.  **Pemrosesan API n8n**: API n8n akan memproses dokumen yang diunggah, kemungkinan melakukan ekstraksi teks, embedding, atau indexing untuk persiapan RAG (Retrieval Augmented Generation).
3.  **Chat Interaktif**: Pengguna dapat berinteraksi dengan model bahasa melalui halaman `chat.html`. Pertanyaan pengguna akan dikirim ke `chatApiUrl` yang juga dikonfigurasi di `CONFIG`.
4.  **Penanganan Error**: Aplikasi ini dilengkapi dengan penanganan error untuk koneksi API n8n. Jika koneksi gagal, notifikasi akan ditampilkan, dan aplikasi dapat berjalan dalam mode offline atau dengan fungsionalitas terbatas.
5.  **Riwayat Unggahan**: Halaman `admin.html` juga menampilkan riwayat unggahan dokumen, yang dikelompokkan berdasarkan tanggal (Hari Ini, Kemarin, atau tanggal spesifik).