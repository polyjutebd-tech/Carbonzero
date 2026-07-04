.PHONY: up down logs install db-generate db-migrate db-seed dev build test

up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs -f

install:
	npm install

db-generate:
	npm run db:generate

db-migrate:
	npm run db:migrate

db-seed:
	npm run db:seed

dev:
	npm run dev

build:
	npm run build

test:
	npm run test
