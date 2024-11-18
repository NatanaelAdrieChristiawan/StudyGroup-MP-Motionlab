
# StudyGroup-MP-Motionlab

## Rangkuman Study Group

### Materi: Version Control (Git)

#### Apa itu GIT?
Git adalah sistem kontrol versi terdistribusi yang memungkinkan pengembang melacak perubahan kode, berkolaborasi dengan tim, dan mengelola proyek dengan efisien.

#### Keunggulan Git:
- **Distributed Version Control**: Setiap pengembang memiliki salinan penuh dari seluruh riwayat proyek.
- **Branching dan Merging**: Memungkinkan eksperimen tanpa mengganggu branch utama.
- **Efisien**: Cepat dalam melakukan operasi commit, diff, dan merge.
- **Rekam Jejak Perubahan**: Memiliki riwayat lengkap perubahan pada proyek.

---

## Alur Kerja Dasar Git
1. **Modifikasi File** di direktori kerja.
2. **Stage File** dengan perintah:
   ```bash
   git add
   ```
   untuk memasukkannya ke staging area.
3. **Commit Perubahan** dengan perintah:
   ```bash
   git commit
   ```
   yang menyimpan snapshot ke repository lokal.
4. **Push ke Remote Repository** dengan perintah:
   ```bash
   git push
   ```
   untuk menyinkronkan perubahan ke server GitHub.

---

## Perintah-Perintah Dasar Git

### 1. **Konfigurasi Awal**
- **Setel Nama dan Email Pengguna**:
  ```bash
  git config --global user.name "Username Anda"
  git config --global user.email "email@example.com"
  ```

### 2. **Inisialisasi Repository**
```bash
git init
```

### 3. **Menambahkan dan Commit File**
- Menambahkan file tertentu:
  ```bash
  git add [nama_file]
  ```
- Menambahkan semua file yang dimodifikasi:
  ```bash
  git add .
  ```
- Commit Perubahan:
  ```bash
  git commit -m "Pesan commit"
  ```

### 4. **Melihat Status dan Log**
- Menampilkan status file (termodifikasi, staged, dll.):
  ```bash
  git status
  ```
- Menampilkan riwayat commit secara detail:
  ```bash
  git log
  ```
  atau jika ingin lebih singkat bisa menggunakan
  ```bash
  git log --oneline
  ```

### 5. **Branching dan Merging**
- Membuat Branch Baru:
  ```bash
  git branch [nama_branch]
  ```
- Beralih ke Branch:
  ```bash
  git checkout [nama_branch]
  ```
- Membuat dan Beralih ke Branch Sekaligus:
  ```bash
  git checkout -b [nama_branch]
  ```
- Menggabungkan Branch (Merge):
  ```bash
  git merge [nama_branch]
  ```

### 6. **Sinkronisasi dengan Remote**
- Clone Repository dari Remote:
  ```bash
  git clone [url_repository]
  ```
- Menambahkan Remote Baru:
  ```bash
  git remote add origin [url_repository]
  ```
- Push Perubahan ke Remote:
  ```bash
  git push origin [nama_branch]
  ```
- Pull Perubahan dari Remote:
  ```bash
  git pull origin [nama_branch]
  ```

### 7. **Menghapus File**
- Menghapus File dari Repository:
  ```bash
  git rm [nama_file]
  ```

---

## Cara Menggunakan SSH

### 1. **Konfigurasi SSH di Komputer**
- Generate SSH Key (Jika belum memiliki kunci SSH, buat kunci baru):
  ```bash
  ssh-keygen -t rsa -b 4096 -C "email@example.com"
  ```

### 2. **Tambahkan SSH Key ke GitHub**
- Tampilkan kunci publik:
  ```bash
  cat ~/.ssh/id_rsa.pub 
  ```
- Masuk ke GitHub -> Settings -> SSH and GPG Keys -> New SSH Key.
- Paste kunci publik dan klik **Add SSH Key**.

### 3. **Gunakan SSH untuk Repository**
- Ubah URL remote menjadi SSH:
  ```bash
  git remote set-url origin git@github.com:username/StudyGroup-MP-Motionlab.git
  ```

### 4. **Uji Koneksi SSH ke GitHub**
- Uji koneksi dengan perintah:
  ```bash
  ssh -T git@github.com
  ```
- Jika berhasil, akan muncul pesan seperti ini:
  ```
  Hi [username]! You've successfully authenticated, but GitHub does not provide shell access.
  ```

---

