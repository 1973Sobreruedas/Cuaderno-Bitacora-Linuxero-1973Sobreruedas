# 🎬 **MKV Converter**

**Version:** 1.1

# · H265 ·

> **Author:** 1973Sobreruedas
> **Repository:** [GitHub - Cuaderno de Bitácora Linuxero](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas)
> **Project:** [Manual de Supervivencia Linux](https://manualdesupervivenciaLinux.com) (Web only in Spanish)
> 📁 **Category:** Scripts – GitHub 🎯 Specific Scripts
> 📅 **Date:** july 27, 2025

---

## 🧾 Description

Script to convert H.264 `.mkv` video files to H.265 codec with interactive audio track selection.  
This tool makes it easy to recompress MKV files and save disk space without losing quality.

**Supported systems:**

- Debian and derivatives (Linux Mint, Ubuntu)
- Fedora
- openSUSE

> Note: The script is **already executable** (`chmod +x` applied) to save time and simplify usage or automation.

---

## 🔧 Requirements

- ffmpeg  
- bash ≥ 4.0  
- ffprobe (included with ffmpeg)

---

## 🛠️ Usage

```bash
./mkv-converter.sh
```

It will work on all MKV files in the directory where the script is executed.

1. Detects audio tracks.

2. If there's only one, it is selected automatically.

3. If there are several, you’ll be asked which one to keep (choose by language: spa/eng or others).

4. Re-encodes the video using x265, keeping subtitles and full MKV structure.

5. Generates a detailed log for each file in the `logs/` folder.

## 🤝 Credits

- Author: 1973Sobreruedas · Sobreruedas

- Supervised and tested with ChatGPT 🧠 (OpenAI)

---

## 📜 License

License: CC BY-NC-SA 4.0 – Share alike, non-commercial use, with attribution.

---

## 📦 CHANGELOG

### v1.1 – Improved navigation and final feedback

- Fixed audio track selection.

- More intuitive index numbering (starts from 1).

- Cleaner and colored output.

- Summary at the end: converted file, time and compression achieved.

---

### v1.0 – First public release

- Conversion from MKV (H.264) to H.265.

- Audio track detection with interactive selection.

- Per-file logging inside `logs/` directory.

---

### 🧾 Example of generated log

```
File: 1x01.mkv
Audio tracks found: 2

User selected: 1

Original size: 845 MB
Final size: 430 MB
Compression achieved: 49.11%
Time: 142s
```

---

## 🧪 In development for v1.2

- Support for `.mp4`, `.avi`, `.mov` formats.

- Option to ignore subtitles in output.

- Folder-based automation (recursive processing).

---

## 🚀 Planned for v1.3

- GUI version (future phase).

- Other features...
