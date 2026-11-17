import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import { z } from 'zod';

const app = express();
app.use(helmet());
app.use(cors());
app.use(express.json({ limit: '256kb' }));

app.get('/health', (_req, res) => {
  res.json({ ok: true, service: 'zevsgram-api', version: '0.1.0' });
});

// Public profile metadata only. Authentication and persistent storage are next milestones.
app.get('/v1/profile/:username', (req, res) => {
  const username = z.string().min(3).max(32).safeParse(req.params.username);
  if (!username.success) return res.status(400).json({ error: 'Invalid username' });
  return res.status(404).json({ error: 'Profile not found', username: username.data });
});

// Marketplace catalog placeholder. Never treat this response as proof of on-chain ownership.
app.get('/v1/market/items', (_req, res) => {
  res.json({ items: [], note: 'Catalog/indexer integration is not configured yet.' });
});

const port = Number(process.env.PORT ?? 3000);
app.listen(port, () => {
  console.log(`ZevsGram API listening on :${port}`);
});
