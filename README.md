# 🚀 Panel WA Badak (Enc Version)

WhatsApp automation berbasis Node.js (multi session + blast)

---

## ⚙️ 1. Download Termux
https://f-droid.org/id/packages/com.termux/

---

## 🚀 2. Install (Full Auto)

Jalankan di Termux:

```bash
pkg update && pkg upgrade -y && \
pkg install git nodejs -y && \
git clone https://github.com/zonalabs/wabadak.git && \
cd wabadak && \
npm init -y && \
npm install && \
npm install chalk@4.1.2 figlet dotenv @whiskeysockets/baileys pino libsignal-node @ai-sdk/google ai axios && \
npm install -g pm2 && \
chmod +x New.sh && \
bash New.sh
