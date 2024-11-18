# StudyGroup-MP-Motionlab

# Rangkuman Study Group

## Materi: Version Control (Git)

### Apa itu GIT?
Git adalah sistem kontrol versi terdistribusi yang memungkinkan pengembang melacak perubahan kode, berkolaborasi dengan tim, dan mengelola proyek dengan efisien.

### Keunggulan Git:
- **Distributed Version Control**: Setiap pengembang memiliki salinan penuh dari seluruh riwayat proyek.
- **Branching dan Merging**: Memungkinkan eksperimen tanpa mengganggu branch utama.
- **Efisien**: Cepat dalam melakukan operasi commit, diff, dan merge.
- **Rekam Jejak Perubahan**: Memiliki riwayat lengkap perubahan pada proyek.

---

## Alur Kerja Dasar Git
1. **Modifikasi File** di direktori kerja (working directory).
2. **Stage File** dengan perintah `git add` untuk memasukkannya ke staging area.
3. **Commit Perubahan** dengan perintah `git commit`, yang menyimpan snapshot ke repository lokal.
4. **Push ke Remote Repository** dengan perintah `git push` untuk menyinkronkan perubahan ke server GitHub.

---

## Perintah-Perintah Dasar Git

### 1. **Konfigurasi Awal**
- **Setel Nama dan Email Pengguna**:
  ```bash
  git config --global user.name "Nama Anda"
  git config --global user.email "email@example.com"

### 2. **Inisialisasi Repository**
git init

### 3. **Menambahkan dan Commit File**
Menambahkan file tertentu: git add [nama_file]
Menambahkan semua file yang dimodifikasi: git add .
Commit Perubahan: git commit -m "Pesan commit"

### 4. **Melihat Status dan Log**
Menampilkan status file (termodifikasi, staged, dll.): git status
Menampilkan riwayat commit secara detail: git Log atau git log --oneline untuk tampilan yang lebih singkat

### 5. **Branching dan Merging**
Membuat Branch Baru: git branch [nama_branch]
Beralih ke Branch:git checkout [nama_branch]
Membuat dan Beralih ke Branch Sekaligus: git checkout -b [nama_branch]
Menggabungkan Branch (Merge): git merge [nama_branch]

### 6. **Sinkronisasi dengan Remote**
Clone Repository dari Remote: git clone [url_repository]
Menambahkan Remote Baru: git remote add origin [url_repository]
Push Perubahan ke Remote:git push origin [nama_branch]
Pull Perubahan dari Remote: git pull origin [nama_branch]

### 7. **Menghapus File**
Menghapus File dari Repository: git rm [nama_file]


