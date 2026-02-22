---
marp: true
theme: rose-pine-moon
paginate: true
html: true
---

<!-- _class: lead -->
<!-- _paginate: false -->

# The Future of Software Engineering

### From Traditional Development to AI-Powered Engineering

---

## Apa Itu AI? (Simplified)

- **Artificial Intelligence** - Mesin yang bisa "berpikir" dan mengambil keputusan
- **Machine Learning** - AI yang belajar dari data
- **Deep Learning** - ML dengan neural networks berlapis
- **Large Language Models** - Model bahasa yang dilatih dengan data masif
- **Generative AI** - AI yang bisa menghasilkan konten baru

---

## Sejarah AI dalam Software Engineering

- **1950s** - Alan Turing: "Can machines think?"
- **1960s-80s** - Expert systems & rule-based programming
- **2010s** - Machine learning & deep learning revolution
- **2020** - GPT-3: kemampuan code generation pertama kali
- **2021** - GitHub Copilot: AI coding assistant pertama

---

## Era ChatGPT & LLM (2022–2023)

- **Nov 2022** - ChatGPT dirilis, 1 juta user dalam 5 hari
- **2023** - GPT-4, Claude, Gemini: model multimodal & reasoning
- **2023** - AI bisa menulis, menjelaskan, dan mendebug kode
- **2023** - Cursor IDE diluncurkan: AI-first code editor
- Paradigma berubah: developer mulai *pair-programming* dengan AI

---

## Era Agentic AI (2024–2025)

- **2024** - Claude Code, Devin, OpenHands: AI yang bisa koding mandiri
- **2024** - AI agent bisa akses terminal, browser, file system
- **2025** - Multi-agent workflows: beberapa AI bekerja paralel
- **2025** - Vibe coding: describe → AI builds full app
- **Kini** - AI bisa membuat **video** hanya dari teks singkat

---

## State Saat Ini: Seedance 2.0

- **Seedance 2.0** (ByteDance) — video generation dari prompt singkat
- Cukup ketik: *"Anak SD makan soto"*
- AI menghasilkan video HD berkualitas sinematik dalam hitungan detik
- Bukan hanya teks & kode — AI kini menguasai **semua media**
- Implikasi: barrier kreasi konten digital hampir nol

---

<!-- _class: lead -->
<!-- _paginate: false -->

<video src="anak_sd_makan_soto.mp4" controls width="100%" style="max-height: 80vh; border-radius: 8px;"></video>

---

## Demo: Mockup → HTML dengan AI

<iframe src="data_acquisition.html" width="100%" height="85%" style="border: none; border-radius: 8px;"></iframe>

---

## Traditional Development

- Manual coding dari requirements ke implementasi
- Waterfall & Agile sebagai framework utama
- Developer menulis setiap baris kode secara manual
- Testing, deployment, monitoring dilakukan terpisah
- Bottleneck: kecepatan development bergantung pada jumlah developer

---

## Kapabilitas AI Saat Ini

- Code generation (GitHub Copilot, Cursor, Claude Code)
- Automated testing & debugging
- Code review & refactoring
- Natural language to code
- Multi-modal AI (text, image, audio, video)

---

## Development di Era AI

- AI sebagai **pair programmer**, bukan pengganti developer
- Shift dari *writing code* ke *directing code*
- Developer sebagai **architect & reviewer**
- Faster prototyping & iteration
- Focus bergeser ke **problem solving** dan **system design**

---

## Skill yang Dibutuhkan di Era AI

- **Prompting & Context Engineering** - Komunikasi efektif dengan AI
- **System Design & Architecture** - Memahami big picture
- **Code Review & Critical Thinking** - Validasi output AI
- **Domain Knowledge** - AI butuh konteks bisnis dari manusia
- **Adaptability** - Tools dan paradigma berubah cepat

---

<!-- _class: lead -->

# Context Engineering

---

## Penjelasan LLM

- **Large Language Model** = model AI yang dilatih dengan miliaran teks
- Prediksi *next token* berdasarkan konteks sebelumnya
- Tidak benar-benar "mengerti", tapi sangat baik dalam pattern matching
- Memiliki **context window** (jumlah token yang bisa diproses sekaligus)
- Semakin baik konteks yang diberikan, semakin baik hasilnya

---

## Penjelasan Prompt

- **Prompt** = instruksi yang kita berikan ke AI
- Prompt adalah *interface* antara manusia dan LLM
- Kualitas output **berbanding lurus** dengan kualitas prompt
- Prompt yang baik: jelas, spesifik, dan memiliki konteks

> "Garbage in, garbage out" berlaku sangat kuat untuk AI

---

## Elemen-elemen Prompt

### Instruction
Apa yang kita ingin AI lakukan

### Context
Informasi latar belakang yang relevan

### Constraints
Batasan dan aturan yang harus diikuti AI

---

## Instruction

```
Buatkan REST API endpoint untuk user registration
menggunakan Node.js dan Express.
```

- Harus **spesifik** dan **actionable**
- Gunakan kata kerja yang jelas: *buatkan*, *analisis*, *refactor*, *jelaskan*
- Satu instruksi per task untuk hasil terbaik

---

## Context

```
Project ini menggunakan:
- Node.js v20 dengan TypeScript
- PostgreSQL sebagai database
- Prisma sebagai ORM
- Jest untuk testing
```

- Berikan informasi tentang **tech stack**
- Sertakan **code yang sudah ada** jika relevan
- Jelaskan **business logic** dan requirements

---

## Constraints

```
Requirements:
- Gunakan Express.js router
- Validasi input menggunakan Zod
- Password harus di-hash dengan bcrypt
- Return format harus JSON API standard
- Jangan gunakan library tambahan selain yang disebutkan
```

- Batasi format output
- Tentukan apa yang **boleh** dan **tidak boleh** dilakukan
- Tentukan standar dan konvensi yang harus diikuti

---

## Basic Prompting (1/2)

**Zero-shot** - Langsung bertanya tanpa contoh
```
Buatkan fungsi untuk validasi email
```

**One-shot** - Memberikan satu contoh
```
Contoh: validatePhone("+628123") -> true
Buatkan fungsi serupa untuk validasi email
```

---

## Basic Prompting (2/2)

**Few-shot** - Memberikan beberapa contoh
```
Input: "hello world" -> Output: "Hello World"
Input: "foo bar baz" -> Output: "Foo Bar Baz"
Buatkan fungsi untuk transformasi ini
```

**Chain-of-thought** - Minta AI berpikir step-by-step
```
Jelaskan langkah-langkah untuk membuat
fitur autentikasi, kemudian implementasikan.
```

---

## Teknik Prompting

- **Chain of Thought** - Minta AI berpikir langkah demi langkah
- **Role Prompting** - "Kamu adalah senior backend engineer..."
- **Structured Output** - Minta output dalam format tertentu (JSON, XML)
- **Iterative Refinement** - Perbaiki prompt berdasarkan hasil sebelumnya
- **Decomposition** - Pecah masalah besar jadi sub-masalah kecil

---

## AI Agent

- AI yang bisa **mengambil aksi** secara otonom
- Memiliki akses ke **tools**: file system, terminal, browser, API
- Loop: *Think* -> *Act* -> *Observe* -> *Repeat*
- Contoh: OpenCode, AntiGravity, Claude Code, Cursor Agent, Devin
- Bisa melakukan multi-step tasks tanpa intervensi manual

---

## Context Management

- **Context window** terbatas, harus dikelola dengan baik
- Gunakan file referensi: `CLAUDE.md`, `AGENTS.md`, `.cursorrules`
- Sediakan **documentation** dan **specs** yang jelas
- Berikan hanya konteks yang **relevan**, jangan berlebihan
- Teknik: **RAG**, file tree, code snippets, error logs
- Context engineering > prompt engineering

---

<!-- _class: lead -->

# Spec Driven Development

---

## Apa Itu Spec Driven Development?

- Menulis **spesifikasi** sebelum menulis kode
- Spec menjadi *single source of truth* untuk AI dan manusia
- Format: Markdown, YAML, atau structured documents
- AI menggunakan spec sebagai **context** untuk generate code

---

## Mengapa Spec Driven?

- AI bekerja lebih baik dengan **instruksi terstruktur**
- Mengurangi ambiguitas dan miskomunikasi
- Spec bisa di-review sebelum coding dimulai
- Reproducible: spec yang sama = hasil yang konsisten
- Dokumentasi otomatis tersedia sejak awal

---

## Komponen Spec

- **Overview** - Deskripsi singkat fitur
- **Requirements** - Functional & non-functional requirements
- **Data Model** - Schema, types, dan relasi
- **API Contract** - Endpoints, request/response format
- **UI/UX Flow** - User journey dan wireframe description
- **Acceptance Criteria** - Definition of done

---

## Workflow Spec Driven Development

1. **Define** - Tulis spec dari requirements
2. **Review** - Review spec bersama tim
3. **Generate** - Gunakan AI untuk generate code dari spec
4. **Validate** - Review dan test generated code
5. **Iterate** - Perbaiki spec jika hasil belum sesuai

---

<!-- _class: lead -->

# Building Applications Without Writing Code

---

## Praktek: Agentic AI + Spec Driven Development

- Membuat aplikasi **end-to-end** menggunakan AI agent
- Developer berperan sebagai **architect & director**
- AI agent mengeksekusi berdasarkan spec
- Focus pada **what to build**, bukan **how to code**

---

## Tools yang Digunakan

- **OpenCode** / **AntiGravity** - AI coding agent (free model tersedia)
- **Markdown** - Untuk menulis spec
- **Git** - Version control tetap penting
- **Terminal** - Untuk running & testing
- Spec files sebagai **panduan utama** AI

---

## Live Demo Flow

1. Tulis **project spec** dalam Markdown
2. Setup project menggunakan AI agent
3. Generate **data model** dari spec
4. Generate **API endpoints** dari spec
5. Generate **UI components** dari spec
6. Review, test, dan iterate

---

## Best Practices

- Selalu **review** code yang dihasilkan AI
- Gunakan **version control** dari awal
- Tulis spec yang **detail** dan **tidak ambigu**
- Iterasi kecil lebih baik dari satu langkah besar
- Pahami code yang dihasilkan, jangan *blindly accept*
- AI adalah **tool**, bukan pengganti critical thinking

---

<!-- _class: lead -->

## Key Takeaway

> Software engineering bukan lagi tentang
> **menulis kode**, tapi tentang **mengarahkan AI**
> dengan konteks yang tepat untuk
> **membangun solusi** yang benar.

---

<!-- _class: lead -->
<!-- _paginate: false -->

# Thank You

### Questions?
