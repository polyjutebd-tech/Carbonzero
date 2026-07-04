# CarbonZero MVP

CarbonZero is a methodology-independent Blue Carbon Digital MRV platform MVP.

This repository contains a production-oriented monorepo scaffold for:

- Next.js 15 enterprise SaaS frontend
- NestJS REST API backend
- PostgreSQL + PostGIS normalized data model
- Prisma ORM
- Redis
- S3-compatible object storage
- Docker Compose deployment
- Audit logs, tenant isolation, soft delete, versioning, role-based access
- Methodology Profile, Parameter Library, Formula Registry and CARE Rule Engine extension points

## Important scientific boundary

This MVP does **not** hardcode scientific equations or carbon credit issuance logic.

All scientific calculations are controlled through configurable Methodology Profiles, Formula Registry entries, Parameter Sets and CARE Rules. If a formula, coefficient, conversion factor, or model assumption is not yet approved by a methodology owner, the system stores it as configuration and blocks final calculation/reporting until reviewed.

CarbonZero is a Digital MRV platform. It is not a carbon credit registry, not a marketplace, and not a credit issuance authority.

## Repository structure

```text
carbonzero-mvp/
├── apps/
│   ├── api/                 # NestJS backend
│   └── web/                 # Next.js frontend
├── packages/
│   └── shared/              # Shared TypeScript types
├── docker-compose.yml       # PostGIS, Redis, MinIO, API, Web
├── .env.example
├── Makefile
└── docs/
    ├── ARCHITECTURE.md
    ├── API-CONTRACT.md
    ├── DATABASE.md
    ├── CALCULATION-ENGINE.md
    ├── GIS.md
    └── SECURITY.md
```

## Quick start

```bash
cp .env.example .env
docker compose up -d postgres redis minio
npm install
npm run db:generate
npm run db:migrate
npm run db:seed
npm run dev
```

Frontend: http://localhost:3000  
API: http://localhost:4000/api/v1  
Swagger: http://localhost:4000/docs  
MinIO Console: http://localhost:9001

## MVP user

Seed creates one development tenant and admin user:

- Email: `admin@carbonzero.local`
- Password: `ChangeMe123!`

Change this immediately in any shared environment.

## MVP scope

The MVP implements the minimum vertical slice needed to register a blue carbon project, upload/validate boundary GeoJSON, configure methodology profiles and parameters, create monitoring events, capture field datasets, manage evidence, perform QA/QC, generate calculation plans, produce report records, and preserve audit logs.

Advanced science modules such as biomass estimation, land-cover AI classification, uncertainty modeling and satellite-derived change detection are prepared as extension points only.
