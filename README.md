
# Flutter Development Fundamentals

Ringkasan materi **Fundamental Flutter Development** untuk Minggu ke-2.

---

## 🛠 Apa itu Flutter?

Flutter adalah sebuah framework untuk membangun **aplikasi mobile** menggunakan bahasa pemrograman Dart. Flutter memungkinkan pembuatan aplikasi untuk berbagai sistem operasi (seperti Android dan iOS) menggunakan **satu codebase**.

### Fitur Utama:
- Struktur UI berbasis **Widget**.
- Menggunakan **SDK (Software Development Kit)** untuk mengompilasi kode Dart menjadi kode native.

---

## 📦 Dasar Widget

### Apa itu Widget?
Widget adalah elemen dasar yang membangun **antarmuka pengguna (UI)** di Flutter. Semua elemen visual, seperti tombol, teks, layout, hingga animasi, adalah widget.

- **Widget Tree**: Struktur hierarki di mana setiap widget bisa memiliki widget parent dan child.

### Widget Utama:
- **MaterialApp**: Widget root untuk implementasi desain Material.
- **Scaffold**: Kerangka visual untuk setiap layar aplikasi Flutter.
- Widget Umum:
  - SafeArea
  - Text
  - Container
  - Icon
  - Image
  - Button

### Widget Layouting:
- **Alignment Property**: Mengatur posisi elemen dalam widget.
- **Column**: Menyusun elemen secara vertikal.
- **Row**: Menyusun elemen secara horizontal.

---

## 💻 Contoh Implementasi Flutter

### Membuat Halaman Utama (Home Screen)

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Selamat Datang di Flutter!', style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('Klik Saya'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
