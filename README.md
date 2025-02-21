# README

## Run the Application

```bash
   bin/dev
```

## Run RSpec model tests

```bash
bundle exec rspec spec/models
```

## PLANNING

### 1
- [x] Create `Exercise` and `Plan` models
- [x] Define a many-to-many relationship between `Exercise` and `Plan`
- [x] `Exercise` CRUD operations
- [x] `Plan` CRUD operations
- [x] Add an admin home page.

- [x] Add validations
  - [x] Exercise Model
  - [x] Plan Model

- [x] Add I18N support for sk/en language
- [x] Add Active Storage - images upload
  - [ ] Image Upload - style
- [ ] Add Active Storage - video upload - or via link to YT ?
- [ ] Add ActionText gem for descriptions

- [x] Install and configure Tailwind CSS
- [x] Style
  - [x] style Admin page
  - [ ] style Exercise
  - [ ] style Plans
  - [ ] navbar

- [ ] Divide admin / user namespaces
- [ ] Add Flash Messages for success and errors

- Exercise
  - [ ] index page - implement search
  - [ ] index page - implement pagination
  - [ ] index page - order by name
  - [x] index page - add cover img

### 2 - Auth and Authorization, Users - admin, client
- [x] Add authentication and authorization - Device gem
- [x] Add `User` model - role: admin, client
- [ ] Add attribute name to User model
- [ ] Add `User` controller 2x - admin::user, client::user
- [ ] user-admin one-to-many relationship with user-client
- [ ] Physiotherapist registration with profile (name, company)
- [ ] Client registration via invite link

### 3 - Reservations
- [ ] Add Reservation system

### 4 - Testing
- [ ] Add RSpec
  - [x] model test Exercise
  - [x] model test Plan
  - [x] model test ExercisesPlan
  - [ ] model User
- [ ] Add Capybara


BUGS
- [x] Delete Exercise Associated to a Plan - how to handle it ? can not delete if exercise is assigned to a plan
- [ ] Missing translations for error messages
- [ ] Plan - Exercise -> make it redirect to exercise detail page
- [ ] Better visualization for Detail, Edit, Delete Buttons
