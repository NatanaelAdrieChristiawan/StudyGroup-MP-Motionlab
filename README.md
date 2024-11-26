# StudyGroup-MP-Motionlab

## Rangkuman Study Group

### Materi: Dart Dasar

#### Apa itu Dart?
Dart adalah bahasa pemrograman yang dikembangkan oleh Google. Dart digunakan untuk membangun aplikasi lintas platform seperti mobile, web, dan desktop. Dart juga merupakan bahasa utama yang digunakan oleh Flutter untuk pengembangan aplikasi.

#### Keunggulan Dart:
- **Cross-Platform**: Mendukung pengembangan aplikasi yang dapat berjalan di berbagai platform.
- **Strongly Typed**: Mendukung tipe data yang kuat dan aman.
- **Asynchronous Programming**: Memiliki fitur untuk menangani operasi asinkron seperti Future dan Stream.
- **Pemrograman Berorientasi Objek (OOP)**: Memiliki dukungan penuh untuk OOP.

---

## Konsep Dasar Dart

### 1. **Tipe Data**
Dart mendukung berbagai tipe data, seperti:
- `String`: Teks
- `int`: Bilangan bulat
- `double`: Bilangan desimal
- `bool`: Nilai benar atau salah
- `var`: Tipe yang ditentukan berdasarkan nilai awal
- `dynamic`: Tipe yang dapat berubah-ubah

Contoh:
```dart
String nama = "Natanael";
int umur = 20;
double tinggi = 173.5;
bool isMarried = false;
var status = "Aktif";
dynamic data = 12345; // Bisa berubah menjadi tipe lain
data = "String sekarang";

### 2. **Konstanta dan Null Safety**
- `final`: Digunakan untuk nilai yang tidak dapat diubah setelah dideklarasikan.
- Null safety memungkinkan variabel memiliki nilai `null` hanya jika ditentukan dengan tanda `?`.

Contoh:
```dart
final String nama = "Natanael";
int? angka; // Bisa bernilai null
angka = null;



### 3. **Operasi Aritmatika**
Dart mendukung operasi dasar seperti penjumlahan, pengurangan, pembagian, dan perkalian.

Contoh:
```dart
int a = 10;
int b = 5;
double hasil = a / b;


### 4. **Percabangan (if-else)**
Percabangan digunakan untuk membuat logika program.

Contoh:
```dart
int angka = 10;
if (angka > 0) {
  print("Angka positif");
} else {
  print("Angka negatif atau nol");
}


### 5. **Perulangan**
Dart mendukung perulangan seperti `for`, `while`, dan `do-while`.

Contoh:
```dart
for (int i = 0; i < 5; i++) {
  print("Perulangan ke-$i");
}


### 6. **Fungsi**
Fungsi digunakan untuk modularisasi kode.

**Fungsi tanpa parameter:**
```dart
void sapa() {
  print("Halo, apa kabar?");
}
sapa();

**Fungsi dengan parameter:**
```dart
void sapa(String nama) {
  print("Halo, $nama!");
}
sapa("Natan");

**Fungsi dengan return:**
```dart
int tambah(int a, int b) {
  return a + b;
}
print(tambah(5, 3)); // Output: 8


### 7. **List**
List digunakan untuk menyimpan sekumpulan data.

Contoh:
```dart
List<String> mahasiswa = ["Indra", "Budi", "Eko"];
print(mahasiswa[0]); // Output: Indra

for (String nama in mahasiswa) {
  print(nama);
}


### 8. **Map**
Map menyimpan data dalam bentuk pasangan key-value.

Contoh:
```dart
Map<String, dynamic> data = {
  "nama": "Natanael Adrie",
  "umur": 20,
};
print(data["nama"]); // Output: Natanael Adrie

### 9. **Class dan Objek**
Dart mendukung pemrograman berorientasi objek (OOP).

**Membuat Class:**
```dart
class Mahasiswa {
  String nama;
  int umur;

  Mahasiswa(this.nama, this.umur);

  void berjalan() {
    print("$nama sedang berjalan.");
  }
}

**Menggunakan Objek:**
```dart
final mahasiswa = Mahasiswa("Natanael Adrie", 20);
mahasiswa.berjalan(); // Output: Natanael Adrie sedang berjalan.