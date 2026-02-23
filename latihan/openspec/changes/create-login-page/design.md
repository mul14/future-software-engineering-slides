## Context

Greenfield project. No existing backend, frontend, or database. The goal is a working login system with:
- **Backend**: Bun (native HTTP server via `Bun.serve()`, native SQLite via `bun:sqlite`)
- **Frontend**: Static HTML pages styled with Tailwind CSS v4 (CSS-first config, no `tailwind.config.js`)
- **Database**: SQLite — single file, zero config, ideal for this scale

## Goals / Non-Goals

**Goals:**
- Working login and registration flow with server-side session management
- Password hashing with Bun's built-in `Bun.password` API (argon2)
- Clean, responsive UI using Tailwind CSS v4
- Protected routes that redirect unauthenticated users to login
- SQLite database for user and session storage

**Non-Goals:**
- OAuth / social login (future enhancement)
- Email verification or password reset flow
- JWT tokens (using cookie-based sessions instead for simplicity)
- Rate limiting or brute-force protection (future enhancement)
- Client-side SPA framework (plain HTML + forms)

## Decisions

### 1. Bun.serve() for HTTP server (over Hono/Elysia)

**Choice**: Use Bun's native `Bun.serve()` with manual routing.
**Why**: Zero dependencies, full control, the app has only a handful of routes. A framework adds overhead without meaningful benefit at this scale.
**Alternative considered**: Hono or Elysia — overkill for ~5 routes.

### 2. Cookie-based sessions (over JWT)

**Choice**: Server-side sessions stored in SQLite with a session ID in an HttpOnly cookie.
**Why**: Simpler to implement, revocable (logout actually works), no token refresh complexity. HttpOnly + Secure cookies prevent XSS token theft.
**Alternative considered**: JWT — stateless but harder to revoke, requires refresh token strategy.

### 3. Bun.password for hashing (over bcrypt/external lib)

**Choice**: `Bun.password.hash()` and `Bun.password.verify()` with argon2id.
**Why**: Built into Bun, no external dependency, argon2id is the current best-practice algorithm.
**Alternative considered**: bcrypt via npm — unnecessary dependency when Bun has built-in support.

### 4. Tailwind CSS v4 with CLI build (over CDN)

**Choice**: Install Tailwind CSS v4 as a dev dependency, build CSS via `@tailwindcss/cli`.
**Why**: Production-ready output, tree-shaking, proper v4 CSS-first workflow.
**Alternative considered**: CDN — good for prototyping but ships full CSS bundle in production.

### 5. Plain HTML with form submissions (over SPA)

**Choice**: Server-rendered HTML pages with standard `<form>` POST submissions.
**Why**: No JavaScript framework needed. Login/register are simple form flows. Progressive enhancement is free.
**Alternative considered**: React/Vue SPA — massive overhead for two forms.

### 6. Project structure

```
├── src/
│   ├── server.ts          # Bun.serve() entry point, routing
│   ├── db.ts              # SQLite initialization, queries
│   ├── auth.ts            # Auth logic (register, login, logout, session)
│   └── middleware.ts       # Session validation, auth guards
├── public/
│   ├── styles.css         # Tailwind CSS v4 source (uses @import "tailwindcss")
│   ├── login.html         # Login page
│   ├── register.html      # Registration page
│   └── dashboard.html     # Protected page
├── dist/
│   └── styles.css         # Built Tailwind CSS output
├── package.json
└── data.db                # SQLite database file (gitignored)
```

## Risks / Trade-offs

- **[No CSRF protection]** → Plain form POST is vulnerable to CSRF. Mitigation: Add a CSRF token to forms in a follow-up. Acceptable for initial implementation since this is a learning project.
- **[Session fixation]** → Mitigation: Regenerate session ID on login.
- **[No input sanitization library]** → Mitigation: Use parameterized SQL queries (bun:sqlite supports this natively). Validate email format and password length server-side.
- **[SQLite single-writer]** → Acceptable for single-server deployment. Not an issue at this scale.
- **[No HTTPS in dev]** → Secure cookie flag requires HTTPS. Mitigation: Disable `Secure` flag in development, enable in production.
