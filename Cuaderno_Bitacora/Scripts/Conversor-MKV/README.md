# 🎬 Conversor MKV

![Versión](https://img.shields.io/badge/Versión-1.5-brightgreen)
![Fecha](https://img.shields.io/badge/Fecha-18_·_oct_·_2025-blue)
[![Licencia](https://img.shields.io/badge/Licencia-CC·BY·NC·SA·4.0-yellow)](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.es)
![Estado](https://img.shields.io/badge/Estado-Estable-success)

## · H265 ·

> [![Autor](https://img.shields.io/badge/👤%20Autor-1973Sobreruedas-orange)](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/tree/main)  
> [![Repositorio](https://img.shields.io/badge/GitHub-El%20Cuaderno%20de%20Bitácora%20Linuxero%20de%201973Sobreruedas-lightgrey?logo=github)](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/tree/main/Cuaderno_Bitacora/Scripts/Conversor-MKV)  
> [![Proyecto](https://img.shields.io/badge/🗃️%20Proyecto-Manual%20de%20Supervivencia%20Linux-cyan)](https://manualdesupervivencialinux.com)  
> [![Categoría](https://img.shields.io/badge/📁%20Categoría-Scripts%20–%20GitHub%20🎯%20Scripts%20específicos-cyan)](https://manualdesupervivencialinux.com)  
> [![Contacto](https://img.shields.io/badge/✍️%20Contacto-visita%20la%20sección-orange?style=social)](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/blob/main/Contacto.md)

---

## 🧾 Descripción

Conversor de archivos con formato H.264 `.mkv` al códec H.265 con selección interactiva de pista de audio. Este script permite convertir de manera fácil los archivos MKV para ahorrar espacio físico en el disco duro.

Trabajará sobre todos los MKV del directorio donde se ejecute el script.

1. Detecta pistas de audio.
2. Si hay una sola, la selecciona automáticamente.
3. Si hay varias, pregunta cuál conservar (el usuario deberá escoger el idioma, según su preferencia: spa/eng u otros).
4. Reconvierte el archivo usando x265, manteniendo subtítulos y todo el encapsulado.
5. Genera un log detallado por cada archivo en `logs/`.

---

## Sistemas soportados

![Debian](https://img.shields.io/badge/Debian-wheat?logo=debian&logoColor=black) y sus derivados ![Linux Mint](https://img.shields.io/badge/Linux%20Mint-wheat?logo=linuxmint&logoColor=black), ![Ubuntu](https://img.shields.io/badge/Ubuntu-wheat?logo=ubuntu&logoColor=black), etc.  
![Fedora](https://img.shields.io/badge/Fedora-wheat?logo=fedora&logoColor=black) ![openSUSE](https://img.shields.io/badge/openSUSE-wheat?logo=opensuse&logoColor=black)  
![Arch Linux](https://img.shields.io/badge/Arch-wheat?logo=archlinux&logoColor=black) y sus derivadas ![Arch Linux](https://img.shields.io/badge/Manjaro-wheat?logo=manjaro&logoColor=black), ![Arch Linux](https://img.shields.io/badge/EndeavourOS-wheat?logo=Endeavouros&logoColor=black), ![Garuda](https://img.shields.io/badge/Garuda-wheat?logo=garuda&logoColor=black), etc.

### Entornos soportados

![MATE](https://img.shields.io/badge/MATE-wheat?logo=Mate&logoColor=black) ![GNOME](https://img.shields.io/badge/GNOME-wheat?logo=gnome&logoColor=black) ![Cinnamon](https://img.shields.io/badge/Cinnamon-wheat?logo=cinnamon&logoColor=black) ![XFCE](https://img.shields.io/badge/XFCE-wheat?logo=xfce&logoColor=black) ![LXQt](https://img.shields.io/badge/LXQt-wheat?logo=lxqt&logoColor=black)

Compatibilidad parcial:

Con ![KDE/Plasma](https://img.shields.io/badge/KDE/Plasma-wheat?logo=kde&logoColor=black) puede mostrar pequeñas diferencias visuales en los colores ANSI o en el efecto del comando `clear`, pero el funcionamiento del script no se ve afectado.

---

## 🔧 Requisitos

- ffmpeg
- bash ≥ 4.0
- ffprobe (viene con ffmpeg)

---

## 🛠️ Uso

```bash
Antes del primer uso conceder permisos de ejecución:
chmod +x conversor-mkv.sh
```

```bash
./conversor-mkv.sh
```

### Opción alternativa

Si no aplicas permisos de ejecución:

```bash
bash conversor-mkv.sh
```

### Verifica si hay disponible una nueva versión del script en GitHub

**Dos opciones disponibles:**

```bash
./mkv-converter.sh --verificar

---

./mkv-converter.sh --check-version
```

---

## 🤝 Créditos

- Autor: 1973Sobreruedas · Sobreruedas
- Supervisado y testado con ChatGPT🧠 (OpenAI)

---

## 📜 Licencia

Licencia: CC BY-NC-SA 4.0 - Compartir igual, sin uso comercial y con atribución.

---

## 📦 CHANGELOG

Revisar el changelog.txt para el control de cambios.

---

### 🧾 Ejemplo de log generado

```text
Archivo: 1x01.mkv
Pistas de audio encontradas: 2

Usuario seleccionó: 1

Tamaño original: 845 MB
Tamaño final:    430 MB
Compresión lograda: 49.11%
Tiempo:          142s
```

---

## 🧪 En desarrollo para versiones futuras

- Soporte para formatos `.mp4`, `.avi`, `.mov`.
- Posibilidad de ignorar subtítulos en la salida.
- Automatización por carpeta (recursivo).
- Multilenguaje.

## 🚀 Proyectado para versiones futuras

- Versión GUI (futura fase).
- Otros...
