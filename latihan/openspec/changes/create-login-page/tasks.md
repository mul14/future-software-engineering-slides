## 1. Project Setup

- [ ] 1.1 Initialize project with `bun init`, create `package.json` with project name and scripts
- [ ] 1.2 Install Tailwind CSS v4 and `@tailwindcss/cli` as dev dependencies
- [ ] 1.3 Create directory structure: `src/`, `public/`, `dist/`
- [ ] 1.4 Add npm scripts: `dev` (Bun server with --watch), `build:css` (Tailwind CSS build), `dev:css` (Tailwind CSS watch)
- [ ] 1.5 Create `public/styles.css` with `@import "tailwindcss"` (v4 syntax)
- [ ] 1.6 Add `.gitignore` with `node_modules/`, `data.db`, `dist/`

## 2. Database Layer

- [ ] 2.1 Create `src/db.ts` — initialize SQLite database using `bun:sqlite`, create `users` table (id INTEGER PRIMARY KEY, email TEXT UNIQUE NOT NULL, password_hash TEXT NOT NULL, created_at TEXT DEFAULT CURRENT_TIMESTAMP)
- [ ] 2.2 Add `sessions` table to `src/db.ts` (id TEXT PRIMARY KEY, user_id INTEGER REFERENCES users(id), expires_at TEXT NOT NULL)
- [ ] 2.3 Verify database auto-creates on first run and both tables exist

## 3. Auth Logic

- [ ] 3.1 Create `src/auth.ts` — implement `register(email, password)`: validate email format + password length (≥8), check uniqueness, hash with `Bun.password.hash()`, insert user, return user or error
- [ ] 3.2 Implement `login(email, password)`: look up user by email, verify with `Bun.password.verify()`, return user or error
- [ ] 3.3 Implement `createSession(userId)`: generate crypto-random session ID, insert into sessions table with 24h expiration, return session ID
- [ ] 3.4 Implement `getSession(sessionId)`: look up session, check expiration, return user ID or null. Delete expired sessions.
- [ ] 3.5 Implement `deleteSession(sessionId)`: remove session from database

## 4. HTTP Server & Routing

- [ ] 4.1 Create `src/server.ts` — set up `Bun.serve()` with request handler
- [ ] 4.2 Implement static file serving: serve files from `public/` for GET requests to static assets, serve built CSS from `dist/`
- [ ] 4.3 Implement route: `GET /login` — serve login.html (redirect to /dashboard if already authenticated)
- [ ] 4.4 Implement route: `GET /register` — serve register.html (redirect to /dashboard if already authenticated)
- [ ] 4.5 Implement route: `POST /api/register` — parse form body, call register(), create session, set cookie, redirect to /dashboard or back to /register with error
- [ ] 4.6 Implement route: `POST /api/login` — parse form body, call login(), create session, set cookie, redirect to /dashboard or back to /login with error
- [ ] 4.7 Implement route: `POST /api/logout` — delete session, clear cookie, redirect to /login
- [ ] 4.8 Implement route: `GET /dashboard` — auth guard, serve dashboard.html with user email injected
- [ ] 4.9 Implement route: `GET /` — redirect to /dashboard (or /login if unauthenticated)
- [ ] 4.10 Implement cookie parsing helper: extract session ID from `Cookie` header
- [ ] 4.11 Implement `Set-Cookie` helper: set HttpOnly, SameSite=Lax, Path=/ cookie

## 5. HTML Pages (Tailwind CSS v4)

- [ ] 5.1 Create `public/login.html` — centered card layout with email input, password input, "Sign In" button, link to /register, error message area. Reference `/dist/styles.css`
- [ ] 5.2 Create `public/register.html` — centered card layout with email input, password input, confirm password input, "Sign Up" button, link to /login, error message area
- [ ] 5.3 Create `public/dashboard.html` — layout with welcome message placeholder for user email, "Logout" button (form POST to /api/logout)
- [ ] 5.4 Build Tailwind CSS and verify all pages render correctly with styles
- [ ] 5.5 Verify responsive design: forms are usable at 375px and centered at 1280px

## 6. Integration & Verification

- [ ] 6.1 Start the server, verify database auto-initialization
- [ ] 6.2 Test full registration flow: register → auto-login → dashboard
- [ ] 6.3 Test full login flow: login → dashboard → logout → redirected to login
- [ ] 6.4 Test error cases: duplicate email, short password, wrong credentials, missing fields
- [ ] 6.5 Test route protection: accessing /dashboard without session redirects to /login
