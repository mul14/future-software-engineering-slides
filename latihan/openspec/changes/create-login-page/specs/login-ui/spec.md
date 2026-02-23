## ADDED Requirements

### Requirement: Login page
The system SHALL serve a login page at `/login` with an email field, password field, and submit button styled with Tailwind CSS v4.

#### Scenario: Login page rendering
- **WHEN** a user navigates to `/login`
- **THEN** the system serves an HTML page with a centered login form containing email input, password input, and a "Sign In" button

#### Scenario: Login page error display
- **WHEN** a login attempt fails and the user is redirected back to `/login`
- **THEN** the page displays the error message from the server (e.g., "Invalid email or password")

#### Scenario: Link to registration
- **WHEN** the login page is displayed
- **THEN** there is a visible link to the registration page with text like "Don't have an account? Sign up"

### Requirement: Registration page
The system SHALL serve a registration page at `/register` with email, password, and password confirmation fields styled with Tailwind CSS v4.

#### Scenario: Registration page rendering
- **WHEN** a user navigates to `/register`
- **THEN** the system serves an HTML page with a centered registration form containing email input, password input, confirm password input, and a "Sign Up" button

#### Scenario: Registration error display
- **WHEN** a registration attempt fails
- **THEN** the page displays the specific error message (e.g., "Email already registered", "Password must be at least 8 characters")

#### Scenario: Link to login
- **WHEN** the registration page is displayed
- **THEN** there is a visible link to the login page with text like "Already have an account? Sign in"

### Requirement: Dashboard page
The system SHALL serve a protected dashboard page at `/dashboard` that displays the user's email and a logout button.

#### Scenario: Dashboard rendering
- **WHEN** an authenticated user navigates to `/dashboard`
- **THEN** the system serves an HTML page showing a welcome message with the user's email and a "Logout" button

### Requirement: Responsive design
All pages SHALL be responsive and display correctly on mobile and desktop viewports.

#### Scenario: Mobile viewport
- **WHEN** a user views any page on a viewport width of 375px
- **THEN** the form is full-width with appropriate padding, and all elements are usable without horizontal scrolling

#### Scenario: Desktop viewport
- **WHEN** a user views any page on a viewport width of 1280px
- **THEN** the form is centered with a max-width constraint, maintaining a clean and readable layout

### Requirement: Tailwind CSS v4 styling
All pages SHALL use Tailwind CSS v4 with the CSS-first configuration approach.

#### Scenario: CSS source file
- **WHEN** the Tailwind CSS source file is created
- **THEN** it uses `@import "tailwindcss"` as the entry point (v4 syntax, not v3's `@tailwind` directives)

#### Scenario: Built CSS output
- **WHEN** the CSS is built via `@tailwindcss/cli`
- **THEN** all HTML pages reference the built CSS file and styles render correctly
