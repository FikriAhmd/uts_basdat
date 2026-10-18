# UTS Manajemen Basis Data - Konfigurasi Docker & SQL Roles

**Nama:** Fikri Ahmad Ramdani  
**NIM:** 1247050003  
**Kelas:** Teknik Informatika - UIN Sunan Gunung Djati Bandung  

---

## 1. Arsitektur Lingkungan (Docker Compose)
Aplikasi dikonfigurasi menggunakan Docker Compose dengan spesifikasi port khusus berbasis NIM (`1247050003`):
* **PostgreSQL Port:** `22003`
* **pgAdmin4 Port:** `44003`

### Menjalankan Environment
```bash
docker compose up -d

2. Struktur Basis Data (Schema & Constraints)
Schema: SALAM

Tabel: SALAM.mahasiswas
DDL Script
CREATE SCHEMA SALAM;

CREATE TABLE SALAM.mahasiswas (
    id SERIAL PRIMARY KEY,
    nim VARCHAR(20) UNIQUE NOT NULL,
    nama VARCHAR(100) NOT NULL,
    angkatan INT CHECK (angkatan >= 2020)
);

-- Insert Data Dummy
INSERT INTO SALAM.mahasiswas (nim, nama, angkatan) 
VALUES ('1247050003', 'Fikri Ahmad Ramdani', 2024);

3. Manajemen Pengguna dan Hak Akses (User & Roles)
backend_dev: Hak akses CRUD (SELECT, INSERT, UPDATE, DELETE).

bi_dev: Hak akses Read-Only (SELECT).

data_engineer: Hak akses penuh (CREATE, MODIFY, DROP, CRUD).

DCL Script
-- backend_dev
CREATE USER backend_dev WITH PASSWORD 'password123';
GRANT CONNECT ON DATABASE db_uts TO backend_dev;
GRANT USAGE ON SCHEMA SALAM TO backend_dev;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA SALAM TO backend_dev;

-- bi_dev
CREATE USER bi_dev WITH PASSWORD 'password123';
GRANT CONNECT ON DATABASE db_uts TO bi_dev;
GRANT USAGE ON SCHEMA SALAM TO bi_dev;
GRANT SELECT ON ALL TABLES IN SCHEMA SALAM TO bi_dev;

-- data_engineer
CREATE USER data_engineer WITH PASSWORD 'password123';
GRANT CONNECT ON DATABASE db_uts TO data_engineer;
GRANT USAGE, CREATE ON SCHEMA SALAM TO data_engineer;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA SALAM TO data_engineer;