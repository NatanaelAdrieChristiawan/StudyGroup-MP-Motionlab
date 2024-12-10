
# Minggu 3 - Package & Widget Lifecycle

## Pengenalan

Konsep-konsep dasar **Package**, **Widget Lifecycle**, dan **Navigasi** dalam pengembangan aplikasi mobile, khususnya menggunakan **Flutter**.

### 1. Package dalam Pengembangan Aplikasi Mobile
**Package** adalah unit organisasi yang mengemas kode, sumber daya, dan aset aplikasi untuk dapat didistribusikan dan dijalankan di platform mobile seperti Android dan iOS.
- **Package Name** adalah identifier unik untuk aplikasi yang digunakan oleh sistem untuk mengenali aplikasi tersebut (misalnya `com.example.appname`).
- **Packaging** memastikan semua komponen yang diperlukan (seperti kelas, gambar, layout) dipaketkan bersama-sama untuk distribusi yang lebih efisien.

### 2. Widget Lifecycle di Flutter
Flutter menggunakan widget untuk merepresentasikan komponen UI aplikasi. Widget ini memiliki lifecycle yang harus dipahami agar pengembangan aplikasi berjalan dengan baik:
- **initState()**: Dipanggil ketika widget pertama kali dibuat dan dimasukkan ke dalam widget tree.
- **build()**: Dipanggil untuk merender widget ke layar agar dapat ditampilkan.
- **dispose()**: Dipanggil saat widget dihapus dari widget tree.

### 3. Navigasi dalam Aplikasi Mobile
**Navigasi** memungkinkan pengguna berpindah antar layar (screen) dalam aplikasi.
- **Navigator** di Flutter digunakan untuk mengelola rute (routes) dan berpindah antar layar.
- Jenis-jenis navigasi:
  - **Push**: Menambahkan layar baru ke dalam stack navigasi.
  - **Pop**: Menghapus layar yang ada di bagian atas stack untuk kembali ke layar sebelumnya.
- **Manajemen Rute**: Flutter mendukung routing eksplisit dan implisit untuk mempermudah manajemen navigasi.

## Contoh Kode: Widget Lifecycle dan Navigasi

Berikut adalah contoh implementasi dalam Flutter yang menunjukkan **Widget Lifecycle** dan **Navigasi** antar layar:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    super.initState();
    print('FirstScreen initialized');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Layar Pertama')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigasi ke Layar Kedua
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          },
          child: Text('Ke Layar Kedua'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    print('FirstScreen disposed');
    super.dispose();
  }
}

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  void initState() {
    super.initState();
    print('SecondScreen initialized');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Layar Kedua')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Kembali ke layar pertama
          },
          child: Text('Kembali'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    print('SecondScreen disposed');
    super.dispose();
  }
}
```