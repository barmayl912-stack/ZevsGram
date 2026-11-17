# ZevsGram — project starter

ZevsGram is an independent cross-platform messenger concept for iOS and Android.

## Architecture

- `apps/mobile`: Flutter client (shared iOS/Android UI).
- `services/api`: Node.js/TypeScript API starter for ZevsGram-specific profiles, catalog and marketplace metadata.
- `infra`: Docker Compose for a self-hosted Matrix homeserver (Synapse + PostgreSQL).

## Important design/security decisions

1. Messaging is based on the open Matrix protocol rather than custom cryptography. The mobile app will use the Dart Matrix SDK and `flutter_vodozemac` for end-to-end encryption.
2. TON wallets are connected through TON Connect. ZevsGram must never ask users to paste or upload seed phrases/private keys.
3. NFT ownership and transfers must be verified against TON chain data; never trust client-supplied ownership claims.
4. The marketplace in this starter is metadata-only. Listing, escrow, fees and transfers require audited smart contracts and a separate security review.
5. This repository is a development scaffold, not a production-ready messenger and not an installable IPA/APK yet.

## Start the mobile app

Install Flutter, then:

```bash
cd apps/mobile
flutter create . --platforms=android,ios
flutter pub get
flutter run
```

The initial screen is a ZevsGram visual shell. Matrix login, registration, sync and E2EE are the next implementation milestone.

## Start the API

Requires Node.js 20+:

```bash
cd services/api
npm install
npm run dev
```

Health endpoint: `http://localhost:3000/health`

## Start a local Matrix server

```bash
cd infra
docker compose up -d postgres
docker compose run --rm synapse generate
```

The Synapse configuration is written to `infra/synapse-data`. Then run:

```bash
docker compose up -d
```

For local development only. Before public deployment, configure a real domain, HTTPS reverse proxy, registration policy, email, backups, rate limits, abuse reporting, retention policy and monitoring.

## Planned milestones

- M1: account creation, login, Matrix sync, 1:1 chats, groups, E2EE, push notifications.
- M2: ZevsGram profiles, avatar frames, premium themes and profile cosmetics.
- M3: TON Connect wallet linking, NFT collection display and on-chain ownership verification.
- M4: gift minting/transfer flows, rarity metadata and marketplace contracts/indexer.
- M5: moderation, reporting, anti-spam, backups, observability, App Store / Play Store release.

## Required secrets (do not commit)

- Matrix server signing/config secrets.
- Database passwords.
- TON API provider key (if used).
- Push notification credentials (APNs / FCM).
- Any marketplace operator keys (prefer multisig; never store user seed phrases).
