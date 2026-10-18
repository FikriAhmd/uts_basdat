-- 1. Buat Schema SALAM
CREATE SCHEMA SALAM;

-- 2. Buat Tabel mahasiswas
CREATE TABLE SALAM.mahasiswas (
    id SERIAL PRIMARY KEY,
    nim VARCHAR(20) UNIQUE NOT NULL,
    nama VARCHAR(100) NOT NULL,
    angkatan INT CHECK (angkatan >= 2020)
);

-- 3. Insert Data Dummy
INSERT INTO SALAM.mahasiswas (nim, nama, angkatan) 
VALUES ('1247050003', 'Fikri Ahmad Ramdani', 2024);

-- 4. Buat User & Role
CREATE USER backend_dev WITH PASSWORD 'password123';
GRANT CONNECT ON DATABASE db_uts TO backend_dev;
GRANT USAGE ON SCHEMA SALAM TO backend_dev;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA SALAM TO backend_dev;

CREATE USER bi_dev WITH PASSWORD 'password123';
GRANT CONNECT ON DATABASE db_uts TO bi_dev;
GRANT USAGE ON SCHEMA SALAM TO bi_dev;
GRANT SELECT ON ALL TABLES IN SCHEMA SALAM TO bi_dev;

CREATE USER data_engineer WITH PASSWORD 'password123';
GRANT CONNECT ON DATABASE db_uts TO data_engineer;
GRANT USAGE, CREATE ON SCHEMA SALAM TO data_engineer;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA SALAM TO data_engineer;