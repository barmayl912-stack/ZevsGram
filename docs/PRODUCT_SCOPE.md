# ZevsGram product scope

## Identity and accounts
- Independent ZevsGram account namespace.
- Email/phone verification strategy to be selected before production.
- Device/session management, recovery, abuse prevention and account deletion.

## Messaging
- Matrix homeserver as the independent messaging infrastructure.
- 1:1 and group rooms, media, typing/read receipts, presence.
- E2EE using the Matrix Dart SDK + vodozemac; do not invent cryptography.
- Push notifications through APNs and FCM.

## TON and collectibles
- Connect external TON wallets using TON Connect.
- Read collection/item metadata and verify ownership from chain/indexer data.
- Gift transfers require explicit wallet confirmation.
- Never custody users' seed phrases or private keys.

## Marketplace
- Listings, search, filters, history and seller reputation.
- Escrow/settlement contract design must be separately audited before mainnet.
- Rarity score is a transparent ZevsGram calculation based on published traits; do not imply an official universal rarity score.

## Moderation and safety
- Block/report, spam throttling, rate limits, content reporting and admin audit log.
- Marketplace fraud reporting and provenance checks.
- Privacy policy, terms, retention, export and deletion workflows.
