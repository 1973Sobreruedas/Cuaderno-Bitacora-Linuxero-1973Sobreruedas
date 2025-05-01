# 🧽 Remove the black background from PNG images with a simple script

**Author:** 1973Sobreruedas  
**Repository:** [GitHub - Cuaderno de Bitácora Linuxero](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas)

---

## 🧾 Description

Sometimes we download icons or `.png` images that come with a **solid black background** instead of being transparent. This can ruin the visual harmony on desktops, dark themes, or websites. But as good Linux users, we solve it in just a couple of lines 😎.

Here’s a simple script I recently put into action, and it works **surprisingly well** in most cases:

---

## 🔧 Prerequisites

Install **ImageMagick** (if not already installed):

sudo apt update && sudo apt install -y imagemagick

This command will update the repositories and begin the installation.

---

## 🛠️ What does this script do?

- Searches for all `.png` files in the current directory.
- Uses `convert` (from **ImageMagick**) to replace the color `#000000` with transparency.
- Applies `-fuzz 10%` to allow slight variations around pure black (ideal for shadows or borders).
- Saves the final result in a `transparent` folder.

---

## 🔎 Output

In most cases, the edges turn out pretty clean, although if the icon contains deep blacks in key areas, you might lose some detail.

---

## 🧪 Possible improvements and use case integration

You can adapt the following settings to better fit your workflow:

- **Custom color target**, if you want to remove another color (such as white, gray, etc.).  
  Replace `"#000000"` (black) with the desired hexadecimal color code.

- **Custom input/output folders**, to work in different locations or preserve originals.

**Note:** Avoid overwriting if a folder named `transparent` already exists.

---

Another tool for your Linux toolbox! 💪

---

## License

This script is provided under the principles of free software.  
Use it, share it, and feel free to adapt it to your needs.

