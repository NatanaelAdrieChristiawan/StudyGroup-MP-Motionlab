# Flutter Local Storage

Flutter menyediakan beberapa solusi untuk penyimpanan data lokal dalam aplikasi, yang memungkinkan pengembang untuk menyimpan data di perangkat pengguna tanpa memerlukan koneksi internet. Beberapa metode penyimpanan lokal yang umum digunakan di Flutter antara lain SharedPreferences, SQLite, dan Hive.

## 1. *SharedPreferences*
   - *Deskripsi:* SharedPreferences digunakan untuk menyimpan data dalam bentuk key-value pair (seperti pengaturan aplikasi).
   - *Keuntungan:* Mudah digunakan dan ringan.
   - *Kapan digunakan:* Ideal untuk menyimpan data konfigurasi atau preferensi pengguna (misalnya tema aplikasi, bahasa, dll.).
   - *Implementasi:*
     1. Tambahkan dependensi ke pubspec.yaml:
        yaml
        dependencies:
          shared_preferences: ^2.0.15
        
     2. Contoh penggunaan:
        dart
        import 'package:shared_preferences/shared_preferences.dart';

        // Menyimpan data
        Future<void> saveData() async {
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('username', 'FlutterUser');
        }

        // Membaca data
        Future<void> loadData() async {
          final prefs = await SharedPreferences.getInstance();
          String? username = prefs.getString('username');
          print(username);
        }
        

## 2. *SQLite*
   - *Deskripsi:* SQLite adalah database ringan yang memungkinkan penyimpanan data terstruktur dalam aplikasi.
   - *Keuntungan:* Cocok untuk aplikasi yang memerlukan penyimpanan data lebih kompleks dan terstruktur.
   - *Kapan digunakan:* Ketika data aplikasi melibatkan relasi antar data atau ukuran data yang lebih besar.
   - *Implementasi:*
     1. Tambahkan dependensi ke pubspec.yaml:
        yaml
        dependencies:
          sqflite: ^2.0.0+3
        
     2. Contoh penggunaan:
        dart
        import 'package:sqflite/sqflite.dart';
        import 'package:path/path.dart';

        Future<Database> openDb() async {
          return openDatabase(
            join(await getDatabasesPath(), 'app_database.db'),
            onCreate: (db, version) {
              return db.execute(
                "CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT)",
              );
            },
            version: 1,
          );
        }

        Future<void> insertUser(User user) async {
          final db = await openDb();
          await db.insert(
            'users',
            user.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
        

## 3. *Hive*
   - *Deskripsi:* Hive adalah database NoSQL yang sangat cepat dan ringan untuk penyimpanan data lokal.
   - *Keuntungan:* Sangat cepat dan mendukung tipe data yang kompleks. Cocok untuk data yang tidak terstruktur.
   - *Kapan digunakan:* Ketika Anda membutuhkan penyimpanan data yang sangat cepat atau tidak memerlukan struktur tabel yang kaku.
   - *Implementasi:*
     1. Tambahkan dependensi ke pubspec.yaml:
        yaml
        dependencies:
          hive: ^2.0.4
          hive_flutter: ^1.1.0
        
     2. Contoh penggunaan:
        dart
        import 'package:hive/hive.dart';

        void main() async {
          await Hive.initFlutter();

          var box = await Hive.openBox('myBox');
          box.put('name', 'Flutter');

          print(box.get('name'));  // Output: Flutter
        }
        

## 4. *Key Differences*
   - *SharedPreferences:* Penyimpanan key-value yang cocok untuk data ringan dan konfigurasi aplikasi.
   - *SQLite:* Penyimpanan relasional, cocok untuk data yang lebih kompleks.
   - *Hive:* Penyimpanan NoSQL yang sangat cepat dan cocok untuk data yang tidak memerlukan struktur tabel.

## 5. *Pilih Penyimpanan yang Tepat*
   - Gunakan *SharedPreferences* jika data yang disimpan bersifat ringan, seperti preferensi pengguna atau pengaturan aplikasi.
   - Gunakan *SQLite* jika Anda membutuhkan penyimpanan data terstruktur dengan hubungan antar tabel.
   - Gunakan *Hive* jika Anda memerlukan penyimpanan data yang cepat dan tidak terstruktur.