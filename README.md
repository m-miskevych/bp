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
   rails s
```
> [!TIP]
> Accessing Localhost on Mobile
> 1. Find your local IP address
> 2. Start the Rails server  `rails s -b 0.0.0.0`
> 3. On your mobile device, open a browser and enter: `http://[YOUR_IP_ADDRESS]:3000`
> 4. Ensure your computer and mobile device are connected to the same Wi-Fi network


### 2.1 Login Credentials

You can log in with the following credentials:

### 2.1 Login Credentials

| Role   | User     | Email                | Password |
|--------|----------|----------------------|----------|
| Admin  | Admin1   | `admin1@example.com` | `123123` |
| Admin  | Admin2   | `admin2@example.com` | `123123` |
| Client | Client1  | `client1@example.com`| `123123` |
| Client | Client2  | `client2@example.com`| `123123` |
| Client | Client3  | `client3@example.com`| `123123` |
| Client | Client4  | `client4@example.com`| `123123` |

## 3. Testing

### 3.1 Run RSpec model tests
```bash
bundle exec rspec spec/models
```

### 3.2 Run RSpec request tests
```bash
bundle exec rspec spec/requests
```

### 3.3 Run 
```bash

```

## 4. PLANNING

BUGS
+ Delete Exercise Associated to a Plan - how to handle it ? can not delete if exercise is assigned to a plan
+ Plan - Exercise -> make it redirect to exercise detail page
+ Better visualization for Detail, Edit, Delete Buttons
+ In Plans, amdin can see only his clients assigned to the plan
- [x] exercise -> set and repetition are required
- [ ] exercise show detial -> if img or video are missing, adjust the view

🏋️ Exercise Model
**✅ Done**

📋 Plan Model
**✅ Done**

👤 User Model & Authentication
**✅ Done**

💬 Comments Model
**✅ Done**

🗓️ Reservation System
**✅ Done**

🌍 Translations & I18N
**✅ Done**

🔔 Flash Messages 
**✅ Done**

🎨 Styling & UI (Tailwind)
**✅ Done**

📦 Other
**✅ Done**

🔬 Testing
**✅ Done**