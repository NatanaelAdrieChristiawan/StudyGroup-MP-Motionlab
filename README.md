# Flutter & Firebase - Week 8

## *Pengenalan Firebase*
Firebase adalah platform pengembangan aplikasi dari Google yang menyediakan berbagai layanan seperti:
- *Penyimpanan data*
- *Autentikasi pengguna*
- *Analisis aplikasi*
- *Hosting & cloud functions*
- *Notifikasi & banyak lagi*

Firebase sering digunakan bersama *Flutter* untuk mengintegrasikan fitur backend secara cepat dan efisien.

---

## *Firestore - Database Cloud Firebase*
Firestore adalah layanan database NoSQL dari Firebase yang menyimpan dan mengelola data aplikasi dengan *realtime sync*. 

### *Konsep Dasar Firestore*
- *Collection* → Sekumpulan dokumen dalam database Firestore (mirip tabel di database relasional).
- *Document* → Tempat menyimpan data dalam Firestore, memiliki ID unik.
- *Tipe Data yang Didukung*:
  - String, Boolean, Timestamp, Number, Map, Array
  - Null, Geopoint (Latitude, Longitude), Reference

---

## *Mengenal Stream & StreamBuilder*
### *Apa itu Stream?*
Stream adalah *fungsi asinkron* yang mengirimkan data secara *berkelanjutan* berdasarkan event tertentu.  
Berbeda dengan Future, yang hanya mengembalikan satu data, *Stream akan terus mengirimkan data baru* selama tersedia.

### *Apa itu StreamBuilder?*
StreamBuilder adalah widget Flutter yang mendengarkan event dari *Stream* dan *membangun ulang UI berdasarkan perubahan data terbaru*.

> *Contoh penggunaan:* Membuat daftar yang diperbarui secara *realtime* dengan data dari Firestore.

---

## *Integrasi Firestore ke dalam Flutter*
### *Langkah-langkah Integrasi*
1. *Buat project Firebase* di [Firebase Console](https://console.firebase.google.com/)
2. *Tambahkan Firestore Database* dalam proyek Firebase
3. *Integrasikan Firebase dengan Flutter:*
   - Install *Firebase CLI*
   - Install *FlutterFire CLI*
   - Tambahkan *firebase_core* ke dalam proyek Flutter
4. *Gunakan Firestore dalam aplikasi Flutter*
   - Tambahkan service Firestore untuk membaca & menulis data.

---

## *Kesimpulan*
- Firebase mempermudah pengelolaan backend aplikasi dengan fitur lengkap.
- Firestore adalah solusi NoSQL *realtime* yang mudah diintegrasikan.
- Stream & StreamBuilder membantu dalam membangun aplikasi *dynamic & realtime*.

🚀 *Mulai eksplorasi Firebase dengan Flutter sekarang!* 🎯