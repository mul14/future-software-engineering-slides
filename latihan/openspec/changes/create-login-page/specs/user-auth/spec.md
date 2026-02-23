## ADDED Requirements

### Requirement: User registration
The system SHALL allow new users to register with an email and password. The email MUST be unique. The password MUST be at least 8 characters. The password SHALL be hashed with argon2id using `Bun.password.hash()` before storage.

#### Scenario: Successful registration
- **WHEN** a user submits the registration form with a valid email and password (≥8 chars)
- **THEN** the system creates a new user record with the hashed password, creates a session, sets a session cookie, and redirects to the dashboard

#### Scenario: Duplicate email
- **WHEN** a user submits the registration form with an email that already exists
- **THEN** the system displays an error message "Email already registered" and does not create a new user

#### Scenario: Password too short
- **WHEN** a user submits the registration form with a password shorter than 8 characters
- **THEN** the system displays an error message "Password must be at least 8 characters"

#### Scenario: Missing fields
- **WHEN** a user submits the registration form with empty email or password
- **THEN** the system displays an error message indicating the missing fields

### Requirement: User login
The system SHALL authenticate users by verifying their email and password against stored credentials using `Bun.password.verify()`.

#### Scenario: Successful login
- **WHEN** a user submits the login form with a valid email and correct password
- **THEN** the system creates a new session, sets an HttpOnly session cookie, and redirects to the dashboard

#### Scenario: Invalid credentials
- **WHEN** a user submits the login form with an incorrect email or password
- **THEN** the system displays an error message "Invalid email or password" without revealing which field is wrong

### Requirement: User logout
The system SHALL allow authenticated users to log out, destroying their server-side session.

#### Scenario: Successful logout
- **WHEN** an authenticated user triggers logout
- **THEN** the system deletes the session from the database, clears the session cookie, and redirects to the login page

### Requirement: Session management
The system SHALL manage user sessions using server-side session records in SQLite and HttpOnly cookies.

#### Scenario: Session creation
- **WHEN** a user successfully logs in or registers
- **THEN** the system generates a cryptographically random session ID, stores it in the `sessions` table with the user ID and expiration timestamp, and sets it as an HttpOnly cookie

#### Scenario: Session validation
- **WHEN** a request arrives with a session cookie
- **THEN** the system looks up the session ID in the database, verifies it has not expired, and associates the request with the corresponding user

#### Scenario: Expired session
- **WHEN** a request arrives with a session cookie that has expired
- **THEN** the system deletes the expired session, clears the cookie, and treats the request as unauthenticated

### Requirement: Route protection
The system SHALL protect certain routes so only authenticated users can access them.

#### Scenario: Unauthenticated access to protected route
- **WHEN** an unauthenticated user requests a protected page (e.g., `/dashboard`)
- **THEN** the system redirects the user to `/login`

#### Scenario: Authenticated access to protected route
- **WHEN** an authenticated user requests a protected page
- **THEN** the system serves the requested page

### Requirement: Database schema
The system SHALL use SQLite with a `users` table and a `sessions` table.

#### Scenario: Database initialization
- **WHEN** the server starts and the database does not exist
- **THEN** the system creates the SQLite database file and runs migrations to create `users` (id, email, password_hash, created_at) and `sessions` (id, user_id, expires_at) tables

#### Scenario: Email uniqueness constraint
- **WHEN** an insert into `users` is attempted with a duplicate email
- **THEN** the database rejects the insert with a unique constraint violation
