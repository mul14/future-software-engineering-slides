## Why

The application needs user authentication. A login page is the entry point for authenticated access — without it, there's no way to identify users or protect resources. This is a greenfield project using Bun, Tailwind CSS v4, and SQLite.

## What Changes

- Add a login page with email/password form styled with Tailwind CSS v4
- Add a registration page for new user sign-up
- Add a Bun HTTP server with auth API endpoints (`POST /api/register`, `POST /api/login`, `POST /api/logout`)
- Add a SQLite database with `users` table for credential storage
- Add password hashing using Bun's built-in `Bun.password` API
- Add cookie-based session management
- Add a protected dashboard page that requires authentication

## Capabilities

### New Capabilities

- `user-auth`: Covers user registration, login, logout, password hashing, session management, and route protection
- `login-ui`: Covers the login and registration page UI — forms, validation feedback, and styling with Tailwind CSS v4

### Modified Capabilities

_None — this is a greenfield project with no existing specs._

## Impact

- **New dependencies**: `tailwindcss` v4
- **New files**: Server entry point, HTML pages (login, register, dashboard), CSS, database initialization script
- **Database**: New SQLite database file with `users` and `sessions` tables
- **APIs**: New auth endpoints under `/api/`
