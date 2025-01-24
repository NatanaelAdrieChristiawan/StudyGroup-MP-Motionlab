
# 📱 Belajar API & Future di Flutter

## 🎯 Apa yang Akan Dipelajari?
Rangkuman ini akan bahas soal **API** dan **Future** di Flutter.

---

## 🧠 Apa Itu API dan Future?

### 🔗 API (Application Programming Interface)
- API itu kayak jembatan komunikasi antara **client** (aplikasi kita) dan **server**.
- Contoh nyata: Flutter kamu jadi client, terus minta data dari server kayak [DummyJSON API](https://dummyjson.com/docs).

### ⏳ Future
- **Future** itu representasi dari sesuatu yang **nggak langsung selesai** alias butuh waktu (asinkron).
- Contoh:
  - Ngambil data dari internet.
  - Buka file dari galeri.

---

## 🔧 Implementasi

### 1. **Setting Proyek**
Tambah package HTTP ke file `pubspec.yaml`:
```yaml
dependencies:
  http: ^0.15.0
```

Jangan lupa jalanin ini buat instalasi:
```bash
flutter pub get
```

---

### 2. **Contoh Kode: Ambil Data dari API**
Berikut ini contoh gimana cara Flutter ngambil data dari API pake **Future**:

```dart
import 'dart:convert'; // Buat ubah JSON jadi Map
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Package buat HTTP request

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Future buat ngambil data dari API
  Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products/1'));
    if (response.statusCode == 200) {
      return json.decode(response.body); // Ubah JSON jadi Map
    } else {
      throw Exception('Gagal ngambil data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contoh API di Flutter'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchData(), // Panggil Future
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Loading
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // Error
          } else {
            final data = snapshot.data!;
            return Center(
              child: Text('Nama Produk: ${data['title']}'),
            ); // Tampilkan data
          }
        },
      ),
    );
  }
}
```

---

## 🛠️ Penjelasan Kode

1. **Future Method**:
   - `fetchData()` dipake buat ambil data dari API.
   - Kalau berhasil (`statusCode == 200`), JSON diubah ke Map pake `json.decode()`.

2. **FutureBuilder Widget**:
   - **`future`**: Berisi Future yang bakal dijalanin.
   - **`builder`**: Ngatur tampilan sesuai status:
     - **`waiting`**: Tampilkan spinner loading.
     - **`error`**: Kalau ada masalah, tampilin pesan error.
     - **`data`**: Tampilkan data API.

---

## 🚀 Hasil Akhir
Aplikasi bakal nampilin nama produk dari API:
- **Endpoint API**: `https://dummyjson.com/products/1`
- **Output**: "Nama Produk: iPhone 9"

---

## 📚 Referensi
- [Dokumentasi Flutter](https://flutter.dev/docs)
- [HTTP Package](https://pub.dev/packages/http)
- [DummyJSON API](https://dummyjson.com/docs)
