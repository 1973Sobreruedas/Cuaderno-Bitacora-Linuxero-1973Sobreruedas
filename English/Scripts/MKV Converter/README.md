# 🎬 **MKV Converter**
# · H265 ·

> **Author:** 1973Sobreruedas  
> **Repository:** [GitHub - Cuaderno de Bitácora Linuxero](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas)  
> **Project:** [Manual de Supervivencia Linux](https://manualdesupervivenciaLinux.com) (Web only in Spanish)  
> 📁 **Category:** Scripts – GitHub 🎯 Specific Scripts  
> 🆚 **Version:** 1.3  
> 📅 **Date:** august 15, 2025

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

```bash
./mkv-converter.sh --check-version
```
or
```bash
./mkv-converter.sh --verificar
```
Checks if a newer version of the script is available on GitHub.

---

## 🤝 Credits

- Author: 1973Sobreruedas · Sobreruedas

- Supervised and tested with ChatGPT 🧠 (OpenAI)

---

## 📜 License

License: CC BY-NC-SA 4.0 – Share alike, non-commercial use, with attribution.

---

## 📦 CHANGELOG

## v1.3 – Version check system and various fixes

- New: Automatic version check to detect available updates.
- Fixed: Error causing the script to stop when the file had no subtitles.
- Fixed: Incorrect indexes in audio track selection.
- Fixed: Improved formatting and clarity in the log output (.log file).

### v1.2 – Critical fix in index of audio

- Fixed: Failure in detecting single audio track, preventing conversion.

### v1.1 – Usability improvements and output enhancements

- Fixed: More accurate logic in audio track selection.
- Improved: More intuitive track numbering (starting from 1).
- Improved: Colored output for better visual clarity in terminal.
- New: Final summary with output filename, compression percentage, and total processing time.

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

## 🧪 In development for future versions

- Support for `.mp4`, `.avi`, `.mov` formats.
- Option to ignore subtitles in output.
- Folder-based automation (recursive processing).

---

## 🚀 Planned for future versions

- GUI version (future phase).
- Other features...
