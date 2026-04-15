function a0_0x8864() {
  const _0x374ec9 = [
    'exit',
    '8CBfSsM',
    '20bBDcoQ',
    'log',
    '253Anpety',
    'https://pusatwa.com/api/user/devices/',
    'argv',
    'black',
    '/pair',
    'json',
    'green',
    'ACL-WA-',
    'ACL WA SYNC',
    'gray',
    '\n ❌ Gagal membuat perangkat...',
    ' 📱 Layanan : Sinkronisasi Perangkat WhatsApp',
    ' ─────────────────────────────────────────',
    'bgGreen',
    'red',
    '*/*',
    'white',
    '\n >> Buka aplikasi WhatsApp di HP Anda.',
    ' ⚡ Status : Sistem Aktif (PusatWA)',
    '──────────────────────────────────',
    'POST',
    'chalk',
    'figlet',
    'clear',
    'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9
.eyJpZCI6MjQ0LCJlbWFpbCI6ImFzdUBnbWFpbC5jb20iLCJyb2xlIjoidXNlciIsImlhdCI6MTc3NjIxNjAyNSwiZXhwIjoxNzc2MjAyMDI1fQ
.YvYc83hdryf7b1y4ij3Pfr2PhsAhYH1ySOjhlRqLwts',
  ];
  return _0x374ec9;
}

const chalk = require('chalk');
const figlet = require('figlet');

console.clear();

console.log(
  chalk.green(
    figlet.textSync('ACL WA SYNC', {
      font: 'Standard',
      horizontalLayout: 'fitted'
    })
  )
);

console.log(chalk.gray('────────────────────────────'));
console.log(chalk.green.bold('Sistem Aktif'));
console.log(chalk.gray('────────────────────────────'));

const nomor = process.argv[2];

if (!nomor) {
  console.log(chalk.red("Nomor tidak ditemukan"));
  process.exit(1);
}

async function connectBlastServer() {
  try {
    console.log(chalk.white(`[○] Menyiapkan untuk nomor ${nomor}...`));

    const headers = {
      "accept": "*/*",
      "authorization": "Bearer TOKEN_KAMU",
      "content-type": "application/json",
      "user-agent": "Mozilla/5.0"
    };

    // 1. Create device
    const res = await fetch(
      "https://pusatwa.com/api/user/devices",
      {
        method: "POST",
        headers,
        body: JSON.stringify({
          name: "ACL-WA-" + nomor
        })
      }
    );

    const data = await res.json();
    const deviceId = data.id;

    if (!deviceId) {
      console.log(chalk.red("Gagal membuat device"));
      return;
    }

    // 2. Pair device
    await fetch(
      `https://pusatwa.com/api/user/devices/${deviceId}/pair`,
      {
        method: "POST",
        headers
      }
    );

    console.log(chalk.green("Device berhasil dibuat"));

    // 3. Request code
    const codeRes = await fetch(
      `https://pusatwa.com/api/user/devices/${deviceId}/scan-qr`,
      {
        method: "POST",
        headers,
        body: JSON.stringify({
          phone: nomor
        })
      }
    );

    const codeData = await codeRes.json();
    const code = codeData.code;

    if (code) {
      console.log(chalk.green("Kode pairing:"));
      console.log(chalk.bgGreen.black(` ${code} `));
    } else {
      console.log(chalk.red("Gagal ambil kode"));
    }

  } catch (err) {
    console.log(chalk.red("Error:", err.message));
  }
}

connectBlastServer();
