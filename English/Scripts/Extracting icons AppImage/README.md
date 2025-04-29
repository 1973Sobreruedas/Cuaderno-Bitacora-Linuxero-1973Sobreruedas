# 🎨 Extracting Icons from AppImage Files

> **Author:** 1973Sobreruedas  
> **Repository:** [GitHub - Cuaderno de Bitácora Linuxero](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas)  
> 
> 📁 Category: Application Integration and Customization  
> 📅 Date: Apr 29, 2025

---

## 🧭 Introduction

`.AppImage` files are a convenient and portable way to run software on **Linux** without installing it. However, since they don't integrate natively into the system, they often don't include their icon in the application menu or on the desktop.

If you're the kind of person who pays attention to visual details in your environment, this script is for you: it automates the **extraction of all embedded graphic icons** from any **AppImage**, organizing them into a dedicated folder.

---

## 🛠️ Requirements

Make sure you have the following packages installed:

```bash
sudo apt install binutils
```

> (Optional but recommended)  
> For other tasks related to AppImage:  
> `sudo apt install p7zip-full libfuse2`

---

## 📝 Description

The `extracting_icons_appimage.sh` script:

1. Verifies that an **AppImage** is passed as an argument.
2. Creates a temporary extraction directory using the `--appimage-extract` option.
3. Searches and copies all files with extensions `.png`, `.svg`, or `.ico`.
4. Saves the extracted icons into the `ExtractedIcons` folder.
5. Deletes the temporary contents.

---

## ▶️ Step-by-step usage

### 1. Save the script with the name:

```bash
extraer_iconos_appimage.sh
```

### 2. Script is already executable

> Note: The script is **already marked as executable** (`chmod +x` applied) to save time and ease use or automation.

---

### 3. Run the script by passing the AppImage as an argument:

```bash
./extracting_icons_appimage.sh your-app.AppImage
```

### 4. Check the `ExtractedIcons` folder in your current directory. All found icons will be there.

```bash
cd ExtractedIcons
ls -ls
```

**Recommendation:** use Caja (or your File Manager) to visually browse the icons.

S---

## 📌 Where are icons usually located in an AppImage?

The script automates this search, but if you want to inspect manually:

- `./usr/share/icons/hicolor/256x256/apps/`
- `./usr/share/pixmaps/`
- `./.DirIcon` (this one is common in simple AppImages)

---

## 🧩 What next?

You can move any icon you want to your local icons folder:

```bash
mkdir -p ~/.local/share/icons/
cp ExtractedIcons/whatever.png ~/.local/share/icons/
```

Then create a custom `.desktop` launcher pointing to that icon and the AppImage.

---

## License

This script is provided under the principles of free software.  
Use it, share it, and feel free to adapt it to your needs. 🐧
