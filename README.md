# Clusterverse

Clusterverse is built on the reusable Laravel + shadcn application foundation.

## Stack

- Laravel 13
- Inertia 3
- React 19
- TypeScript
- Tailwind CSS 4
- shadcn/ui
- Laravel Fortify authentication
- Laravel Wayfinder
- Pest testing

## Setup

```bash
composer install
pnpm install
cp .env.example .env
php artisan key:generate
php artisan migrate
pnpm run build
```

## Checks

```bash
pnpm run types:check
pnpm run lint:check
pnpm run format:check
pnpm run build
php artisan test --compact
```

See `CONTRIBUTING.md` and `SECURITY.md` for project guidelines.
