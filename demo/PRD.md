# PRD: User Management App

## Overview

Aplikasi web sederhana untuk manajemen user dengan sistem login dan role-based access control (RBAC).
Tujuan utama: demo **Spec Driven Development** menggunakan AI agent.

## Tech Stack

- **Framework**: Next.js (App Router)
- **Database**: SQLite via Prisma ORM
- **Auth**: NextAuth.js (Credentials Provider)
- **Styling**: Tailwind CSS
- **Language**: TypeScript

## Data Model

### User

| Field | Type | Keterangan |
|-------|------|------------|
| id | Int | Primary key, auto-increment |
| name | String | Nama lengkap |
| email | String | Unique, untuk login |
| password | String | Hashed dengan bcrypt |
| role | Enum | ADMIN \| USER |
| createdAt | DateTime | Otomatis saat dibuat |
| updatedAt | DateTime | Otomatis saat diupdate |

### Seed Data

| Email | Password | Role |
|-------|----------|------|
| admin@demo.com | admin123 | ADMIN |
| user@demo.com | user123 | USER |

## Halaman

| Route | Akses | Deskripsi |
|-------|-------|-----------|
| `/login` | Public | Halaman login |
| `/dashboard` | Semua role | Dashboard utama, tampilkan info user yang login |
| `/users` | ADMIN only | List semua user + CRUD |
| `/users/new` | ADMIN only | Form tambah user baru |
| `/users/[id]/edit` | ADMIN only | Form edit user |

## API Endpoints

| Method | Endpoint | Akses | Deskripsi |
|--------|----------|-------|-----------|
| POST | `/api/auth/signin` | Public | Login |
| GET | `/api/users` | ADMIN | List semua user |
| POST | `/api/users` | ADMIN | Tambah user baru |
| PUT | `/api/users/:id` | ADMIN | Update user |
| DELETE | `/api/users/:id` | ADMIN | Hapus user |

## Acceptance Criteria

### Feature: Login

```gherkin
Feature: Login

  Scenario: Login berhasil dengan kredensial yang valid
    Given user berada di halaman "/login"
    When user mengisi email "admin@demo.com"
    And user mengisi password "admin123"
    And user menekan tombol "Login"
    Then user diarahkan ke halaman "/dashboard"
    And user melihat pesan "Selamat datang, Admin"

  Scenario: Login gagal dengan password salah
    Given user berada di halaman "/login"
    When user mengisi email "admin@demo.com"
    And user mengisi password "wrongpassword"
    And user menekan tombol "Login"
    Then user tetap di halaman "/login"
    And user melihat pesan error "Email atau password salah"

  Scenario: Login gagal dengan email yang tidak terdaftar
    Given user berada di halaman "/login"
    When user mengisi email "nobody@demo.com"
    And user mengisi password "anything"
    And user menekan tombol "Login"
    Then user tetap di halaman "/login"
    And user melihat pesan error "Email atau password salah"
```

### Feature: Dashboard

```gherkin
Feature: Dashboard

  Scenario: Admin melihat dashboard
    Given user login sebagai "admin@demo.com"
    When user mengakses halaman "/dashboard"
    Then user melihat nama "Admin"
    And user melihat role "ADMIN"
    And user melihat menu "User Management"

  Scenario: User biasa melihat dashboard
    Given user login sebagai "user@demo.com"
    When user mengakses halaman "/dashboard"
    Then user melihat nama "User"
    And user melihat role "USER"
    And user tidak melihat menu "User Management"

  Scenario: User belum login diarahkan ke login
    Given user belum login
    When user mengakses halaman "/dashboard"
    Then user diarahkan ke halaman "/login"
```

### Feature: User Management (Admin Only)

```gherkin
Feature: User Management

  Background:
    Given user login sebagai "admin@demo.com"

  Scenario: Admin melihat daftar user
    When user mengakses halaman "/users"
    Then user melihat tabel berisi semua user
    And setiap baris menampilkan nama, email, dan role

  Scenario: Admin menambah user baru
    Given user berada di halaman "/users/new"
    When user mengisi nama "Budi Santoso"
    And user mengisi email "budi@demo.com"
    And user mengisi password "budi123"
    And user memilih role "USER"
    And user menekan tombol "Simpan"
    Then user diarahkan ke halaman "/users"
    And user melihat "Budi Santoso" di daftar user

  Scenario: Admin mengedit user
    Given user berada di halaman edit untuk "user@demo.com"
    When user mengubah nama menjadi "User Updated"
    And user menekan tombol "Simpan"
    Then user diarahkan ke halaman "/users"
    And user melihat "User Updated" di daftar user

  Scenario: Admin menghapus user
    Given user berada di halaman "/users"
    When user menekan tombol "Hapus" pada "budi@demo.com"
    And user mengkonfirmasi penghapusan
    Then "budi@demo.com" tidak lagi muncul di daftar user

  Scenario: User biasa tidak bisa akses user management
    Given user login sebagai "user@demo.com"
    When user mengakses halaman "/users"
    Then user diarahkan ke halaman "/dashboard"
```

## Constraints

- Semua password harus di-hash menggunakan bcrypt
- Gunakan server components untuk data fetching
- Gunakan server actions untuk mutasi data
- Validasi input menggunakan Zod
- Tampilkan loading state dan error state yang proper
- Responsive design (mobile-friendly)
