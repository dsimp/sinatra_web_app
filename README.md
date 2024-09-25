
Here's a concise and clear README for your **City Weather Search** Ruby web app:

---

# City Weather Search

A simple Ruby/Sinatra web app that fetches and displays real-time weather data based on user input. The app suggests popular destinations as you type and dynamically updates the background based on the weather conditions.

## Features
- Search for current weather by city.
- Pre-populated suggestions for popular locations.

## Installation

 Clone the repository:
   ```bash
   git clone <repo-url>
   ```

3
   ```

## Usage

1. Run the app:
   ```bash
   ruby app.rb ... or bin/server
   ```
2. Open your browser and visit:
   ```
   http://localhost:4567
   ```

## Technologies Used
- Ruby
- Sinatra
- Weather API

## License
This project is licensed under the MIT License.

---


# sinatra-template

Use this repository to create new Sinatra apps. 

Optionally, to use `ActiveRecord` for database operations, add to the `app.rb`:

```ruby
require "sinatra/activerecord"
```

And in the `config/environment.rb` file add this code block:

```ruby
configure do
  # setup a database connection
  set(:database, { adapter: "sqlite3", database: "db/development.sqlite3" })
end
```
