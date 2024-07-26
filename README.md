
# README

This repo contains the implementation for the ruby back-end challenge.

The main focus of this implementation is the effectiveness of a simple ruby app when it comes to solving problems quickly.

Another focus is a clean and easy build/execution.



## Stack

**Ruby:** 2.7.0

**Rails:** 5.0.7

**DB:** PostgreSQL

**Test:** RSpec

**Lint:** Rubocop

## App Scope

- City search based on State and City name (full or partial)
-   The home screen will list all cities in the database
-   Searching: 
    -   Choose the state on the dropdown menu
    -   Type the city name fully or partially
    -   The results will be shown onscreen


## Running

Clone the project

```bash
  git clone https://github.com/kasyd/backend_challenge.git
```

Change to project directory

```bash
  cd backend_challenge
```

Run the app with docker compose, database will be created and populated automatically

```bash
  docker compose up
```
App will be accessible at:
```bash
  http://localhost:3000/cities
```

## Testing

Run the following commands to test the app with RSpec

```bash
  docker compose exec web rspec
```
Or you can run the following command to get more details on the tests
```bash
  docker compose exec web rspec --format documentation 
```
To verify code standards with Rubocop you can run
```bash
  docker compose exec web rubocop 
```

