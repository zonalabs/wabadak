#!/data/data/com.termux/files/usr/bin/bash

# --- Palet Warna WhatsApp High-Performance ---
G='\e[1;32m'   # Hijau WhatsApp (Aksen Utama)
W='\e[1;37m'   # Putih Bersih (Teks Utama)
D='\e[90m'     # Abu-abu Gelap (Sub-teks/Keterangan)
LG='\e[1;92m'  # Hijau Terang (Status Aktif)
R='\e[1;31m'   # Merah (Peringatan Sistem)
N='\e[0m'      # Reset Warna

# --- Sistem Deteksi & Auto-Install Modul Lengkap ---
# Mengecek apakah modul 'ai' atau 'firebase-admin' belum ada
if [ ! -d "node_modules/ai" ] || [ ! -d "node_modules/firebase-admin" ]; then
    clear
    echo -e "${G}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${N}"
    echo -e " ${LG}AUTO-INSTALLER: MENGUNDUH CORE ENGINE...${N}"
    echo -e "${G}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${N}"
    echo -e "\n ${G}●${N} ${W}Mendeteksi ada modul yang kurang!${N}"
    echo -e " ${G}●${N} ${W}Sistem sedang mengunduh library AI & Firebase...${N}"
    echo -e " ${D}(Proses ini butuh waktu beberapa menit tergantung internet)${N}\n"
    
    # Instalasi seluruh modul yang dibutuhkan Wa.js
    npm install @whiskeysockets/baileys ai @ai-sdk/google firebase-admin pino chalk@4.1.2 figlet --no-bin-links
    
    echo -e "\n ${G}✔${N} ${W}Semua Core System Berhasil Diperkuat!${N}"
    sleep 2
fi

while true; do
    clear
    echo -e "${G}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${N}"
    echo -e " ${LG}ACL XCODE${N} ${W}- PREMIUM WHATSAPP ENGINE${N}"
    echo -e "${G}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${N}"
    echo -e " ${D}Dashboard Optimasi: Buat WhatsApp Anda lebih kuat & stabil.${N}"
    echo ""
    
    echo -e "  ${G}[01]${N} ${W}Aktivasi Mode Turbo (Hubungkan WhatsApp)${N}"
    echo -e "  ${G}[02]${N} ${W}Setup Profil WhatsApp Baru (High-Security)${N}"
    echo -e "  ${G}[03]${N} ${W}Jalankan Mode Auto-Pilot (Stay Online 24/7)${N}"
    echo -e "  ${G}[04]${N} ${W}Monitor Kesehatan Jaringan & Sesi${N}"
    echo ""
    echo -e "  ${G}[05]${N} ${W}Lepas Tautan Profil (Log Out Perangkat)${N}"
    echo -e "  ${G}[06]${N} ${W}Pembersihan Total Sistem (Factory Reset)${N}"
    echo -e "  ${D}[00] Tutup Control Center${N}"
    echo ""
    
    echo -e "${G}─────────────────────────────────────────────────${N}"
    echo -ne " ${W}Pilih Operasi Jaringan${N} ${G}>>${N} "
    read menu

    case $menu in
        1)
            echo -e "\n ${G}●${N} ${W}MEMULAI PROSES AKSELERASI WHATSAPP...${N}"
            echo -ne " ${W}Masukkan Nomor WhatsApp (Contoh: 628x):${N} "
            read nomor_blast
            echo ""
            # Menjalankan mesin optimasi (Blast_enc.js)
            node Blast_enc.js "$nomor_blast"
            echo -e "\n ${D}Tekan Enter untuk kembali ke Dashboard...${N}"
            read
            ;;
        2)
            echo -e "\n ${G}●${N} ${W}MEMBUAT PROFIL WHATSAPP BARU...${N}"
            echo -ne " ${W}Nama Identitas Profil (Contoh: utama):${N} "
            read sesi
            if [ -d "auth_info_$sesi" ]; then
                echo -e " ${G}[!]${N} ${W}Identitas '$sesi' sudah terdaftar dalam sistem.${N}"
                echo -ne " ${W}Ingin mengkalibrasi ulang profil ini? (y/n):${N} "
                read hapus_lama
                if [ "$hapus_lama" == "y" ]; then
                    rm -rf "auth_info_$sesi"
                else
                    continue
                fi
            fi
            echo ""
            echo -e " ${D}>> PENTING: Masukkan nomor WA, lalu tunggu sampai muncul 'AI Engine Aktif'.${N}"
            echo -e " ${D}>> Jika sudah, tekan CTRL+C di keyboard untuk kembali ke menu ini.${N}"
            echo ""
            node wa_enc.js "$sesi"
            echo -e "\n ${D}Tekan Enter untuk kembali ke Dashboard...${N}"
            read
            ;;
        3)
            echo -e "\n ${G}●${N} ${W}MENGAKTIFKAN MODE AUTO-PILOT...${N}"
            echo -ne " ${W}Pilih Nama Profil WhatsApp:${N} "
            read sesi
            echo -e " ${D}Sedang memindahkan proses ke latar belakang...${N}"
            pm2 start wa_enc.js --name "$sesi" -- "$sesi"
            pm2 save
            echo -e " ${G}✔${N} ${W}Sistem Berhasil! WhatsApp Anda kini aktif 24 jam.${N}"
            read -p "..." 
            ;;
        4)
            echo -e "\n ${G}●${N} ${W}STATISTIK KESEHATAN SISTEM (PM2)${N}"
            pm2 list
            echo -e "\n ${D}Tekan Enter untuk kembali ke Dashboard...${N}"
            read
            ;;
        5)
            echo -e "\n ${G}●${N} ${W}PENGHAPUSAN IDENTITAS PROFIL${N}"
            echo -ne " ${W}Nama profil yang akan dilepas:${N} "
            read sesi
            pm2 delete "$sesi"
            rm -rf "auth_info_$sesi"
            echo -e " ${G}✔${N} ${W}Profil berhasil dibersihkan dari memori.${N}"
            read
            ;;
        6)
            echo -e "\n ${R}●${N} ${W}MEMBERSIHKAN SELURUH DATA SISTEM...${N}"
            echo -ne " ${W}Kembalikan sistem ke performa awal? (y/n):${N} "
            read confirm
            if [ "$confirm" == "y" ]; then
                pm2 delete all
                rm -rf auth_info_*
                echo -e " ${G}✔${N} ${W}Sistem berhasil di-reset total.${N}"
            fi
            read
            ;;
        0)
            echo -e "\n ${G}✔${N} ${W}Koneksi aman ditutup. Sampai jumpa!${N}\n"
            exit 0
            ;;
        *)
            echo -e "\n ${G}!${N} ${W}Perintah tidak dikenali oleh engine.${N}"
            sleep 1
            ;;
    esac
done
