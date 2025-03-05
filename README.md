# BP Project Documentation

## 1. Setup Instructions

### 1.1 Install Required Dependencies

1. **Ruby, Rails, PostgreSQL**  
   Follow this [guide](https://gorails.com/setup/macos/14-sonoma) to install Ruby, Rails, and PostgreSQL.

2. **ImageMagick**  
   If images are not displaying correctly, install [ImageMagick](https://guides.rubyonrails.org/active_storage_overview.html#requirements).


### 1.2 Clone the Repository
```bash
  git clone git@github.com:m-miskevych/bp.git
```

### 1.3 Navigate to the Project Directory
```bash
  cd bp
```

### 1.4 Install Dependencies
```bash
  bundle install
```

### 1.5 Set Up the Database
```bash
  rails db:create
  rails db:migrate
  rails db:seed
```

## 2 Run the Application
```bash
   bin/dev
```
> [!TIP]
> Accessing Localhost on Mobile
> 1. Find your local IP address
> 2. Start the Rails server  `bin/dev`
> 3. On your mobile device, open a browser and enter: `http://[YOUR_IP_ADDRESS]:3000`
> 4. Ensure your computer and mobile device are connected to the same Wi-Fi network


### 2.1 Login Credentials
You can log in with the following credentials:
+ Admin1: admin1@example.com / 123123
+ Admin2: admin2@example.com / 123123
+ Client1: client1@example.com / 123123
+ Client2: client2@example.com / 123123
+ Client3: client3@example.com / 123123
+ Client4: client4@example.com / 123123

## 3. Testing

### 3.1 Run RSpec model tests
```bash
bundle exec rspec spec/models
```

### 3.2 Run Capybara tests
```bash

```

## 4. PLANNING

BUGS
- [x] Delete Exercise Associated to a Plan - how to handle it ? can not delete if exercise is assigned to a plan
- [x] Plan - Exercise -> make it redirect to exercise detail page
- [x] Better visualization for Detail, Edit, Delete Buttons
- [x] In Plans, amdin can see only his clients assigned to the plan


🏋️ Exercise Model
- [x] Create `Exercise` and `Plan` models
- [x] Define a many-to-many relationship between `Exercise` and `Plan`
- [x] `Exercise` CRUD operations
- [x] Add an admin home page.
- [x] Add validations
  - [x] Exercise Model
- [x] Add Active Storage - images upload

📋 Plan Model
- [x] `Plan` CRUD operations
- [x] Add validations
  - [x] Plan Model

👤 User Model & Authentication
- [x] Divide admin / user namespaces

🌍 Translations & I18N
- [x] Add I18N support for sk/en language

🔔 Flash Messages 
- [x] Add Flash Messages for success and errors

🎨 Styling & UI (Tailwind)
- [x] Install and configure Tailwind CSS
- [x] Style
  - [x] style Admin page
  - [x] navbar mobile view

🔬 Testing
- [x] Add RSpec tests for models
   - [x] Exercise model
   - [x] Plan model
   - [x] ExercisesPlan model

--- 

🏋️ Exercise Model
- [ ] Implement video upload via Active Storage or link to YouTube ( iframe ) 
- [ ] Add pagination to the exercise index page
- [ ] Add search to the exercise index page

📋 Plan Model
- [ ] Add a timer functionality for plans
- [ ] Add a status bar for plans
- [ ] Add a progress bar for plans

👤 User Model & Authentication
- [x] Enable client registration via an invite link
- [ ] Add physiotherapist registration with profile (name, company)

💬 Comments Model
- [ ] Add comment system to plans

🗓️ Reservation System
- [ ] Add reservation system for booking physiotherapy sessions
- [ ] Implement calendar view for physiotherapists
- [ ] Allow clients to request appointments

🌍 Translations & I18N
- [ ] Add missing translations in locales
- [ ] Implement language switcher with SK/EN flags

🔔 Flash Messages 
- [ ] Flash messages - stimulus 

🎨 Styling & UI (Tailwind)
- [ ] Extract commonly used Tailwind classes into reusable components
- [ ] Views styling
  - [ ] Exercise Detail Page
  - [ ] Plan Detail Page

📦 Other
- [ ] Rethink redirections in controllers

🔬 Testing
- [ ] Add RSpec tests for models
   - [ ] User model
   - [ ] UserPlan model
- [ ] Add Capybara tests

