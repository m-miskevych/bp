# README

## Set up the Application
Install Ruby, Rails, PostgreSQL: https://gorails.com/setup/macos/14-sonoma

If the images are not displayed, install: ImageMagick 
https://guides.rubyonrails.org/active_storage_overview.html#requirements

Clone the repository
```bash
  git clone git@github.com:m-miskevych/bp.git
```

Navigate to the repository
```bash
  cd bp
```

Install dependencies
```bash
  bundle install
```

Set up database
```bash
  rails db:create
  rails db:migrate
  rails db:seed
```

## Run the Application
```bash
   bin/dev
```

### Log in data
admin1@example.com, 123123
admin2@example.com, 123123
client1@example.com, 123123
client2@example.com, 123123
client3@example.com, 123123
client4@example.com, 123123

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
  - [x] navbar

- [x] Divide admin / user namespaces
- [ ] Add Flash Messages for success and errors - stimulus

- Exercise
  - [ ] index page - implement search
  - [ ] index page - implement pagination
  - [x] index page - add cover img

 ### 2 Commnets
  - [ ] Add comment system

- User_Plan - associaion M:N between User and Plan
  - [x] Add User_Plan model
  - [ ] Add status - assigned, in-progress, completed

### 3 - Auth and Authorization, Users - admin, client
- [x] Add authentication and authorization - Device gem
- [x] Add `User` model - role: admin, client
- [x] Add attribute name to User model
- [x] Add `User` controller 2x - admin::user, client::user
- [x] user-admin one-to-many relationship with user-client
- [ ] Physiotherapist registration with profile (name, company)
- [ ] Client registration via invite link

### 4 - Reservations
- [ ] Add Reservation system

### 5 - Testing
- [ ] Add RSpec
  - [x] model test Exercise
  - [x] model test Plan
  - [x] model test ExercisesPlan
  - [ ] model User
- [ ] Add Capybara


BUGS
- [x] Delete Exercise Associated to a Plan - how to handle it ? can not delete if exercise is assigned to a plan
- [ ] Missing translations for error messages
- [x] Plan - Exercise -> make it redirect to exercise detail page
- [x] Better visualization for Detail, Edit, Delete Buttons
- [ ] In Plans, amdin can see only his clients assigned to the plan