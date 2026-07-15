# Local WordPress + Elementor

Spins up a local WordPress site (via Docker) with the Elementor plugin
installed and activated automatically.

## Requirements

- Docker and Docker Compose installed on your machine.

## Usage

```bash
cp .env.example .env   # optional: edit credentials/port
docker compose up -d
```

Wait a minute for the one-off `wpcli` service to finish installing
WordPress and Elementor (check with `docker compose logs -f wpcli`).

Then open:

- Site: http://localhost:8080
- Admin: http://localhost:8080/wp-admin (default user/pass: `admin` / `admin`,
  or whatever you set in `.env`)

Elementor will already be installed and active — open any page/post and
click "Edit with Elementor" to start building.

## Stopping / resetting

```bash
docker compose down        # stop, keep data
docker compose down -v     # stop and wipe the database/site files
```
