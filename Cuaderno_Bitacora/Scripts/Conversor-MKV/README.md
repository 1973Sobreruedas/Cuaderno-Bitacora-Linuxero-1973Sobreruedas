# 🎬 Conversor MKV

![Versión](https://img.shields.io/badge/Versión-1.5-brightgreen)
![Fecha](https://img.shields.io/badge/Fecha-11_·_oct_·_2025-blue)
[![Licencia](https://img.shields.io/badge/Licencia-CC·BY·NC·SA·4.0-yellow)](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.es)
![Estado](https://img.shields.io/badge/Estado-Estable-success)

## · H265 ·

> [![Autor](https://img.shields.io/badge/👤_Autor-1973Sobreruedas-orange)](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/tree/main)  
> ![Asistencia](https://img.shields.io/badge/👥_Asistencia_técnica-ChatGPT🧠_(OpenAI)-orange)  
> [![Repositorio](https://img.shields.io/badge/GitHub-El_Cuaderno_de_Bitácora_Linuxero_de_1973Sobreruedas-lightgrey?logo=github)](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/tree/main/Cuaderno_Bitacora/Scripts/Conversor-MKV)  
> [![Proyecto](https://img.shields.io/badge/🗃️_Proyecto-Manual_de_Supervivencia_Linux-cyan)](https://manualdesupervivencialinux.com)  
> [![Categoría](https://img.shields.io/badge/📁_Categoría-Scripts_–_GitHub_🎯_Scripts_específicos-cyan)](https://manualdesupervivencialinux.com)  
> [![Contacto](https://img.shields.io/badge/✍️_Contacto-visita_la_sección-orange?style=social)](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/blob/main/Contacto.md)

---

## 🧾 Descripción

Conversor de archivos con formato H.264 `.mkv` al códec H.265 con selección interactiva de pista de audio. Este script permite convertir de manera fácil los archivos MKV para ahorrar espacio físico en el disco duro, sin pérdida perceptible en la calidad de imagen.

Trabajará sobre todos los MKV del directorio donde se ejecute el script.

1. Detecta pistas de audio.
2. Si hay una sola, la selecciona automáticamente.
3. Si hay varias, pregunta cuál conservar (el usuario deberá escoger el idioma, según su preferencia: `spa/eng` u otros).
4. Reconvierte el archivo usando x265, manteniendo subtítulos y todo el encapsulado.
5. Genera un log detallado por cada archivo en `logs/`.
  - Ejemplo de log generado:
> ```text
> =======================================
> Archivo: Prueba.mkv
>
> Pistas de audio encontradas: 2
>  Índice mostrado: 1
>    Idioma detectado: TAG:language=spa
>  Índice mostrado: 2
>    Idioma detectado: TAG:language=eng
> Usuario seleccionó: 1
> Finalizado: 05-10-2025 14:36:26
> Tamaño original: 1658 MB
> Tamaño final: 937 MB
> Compresión: 43.45%
> Tiempo: 2479s
> ```

---

## Sistemas soportados

![Linux Mint MATE](https://img.shields.io/badge/Linux_Mint_MATE-wheat?logo=linuxmint&logoColor=black) (Base principal)  
![Debian](https://img.shields.io/badge/Debian-wheat?logo=debian&logoColor=black) y sus derivados ![Ubuntu](https://img.shields.io/badge/Ubuntu-wheat?logo=ubuntu&logoColor=black), ![MX_Linux](https://img.shields.io/badge/MX_Linux-wheat?logo=mxlinux&logoColor=black), ![Ubuntu](https://img.shields.io/badge/LMDE-wheat?logo=lmde&logoColor=black),etc.  
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
- x265 / libx265

### 🎬 Compatibilidad del códec x265 por distribución

- 🟢 **Linux Mint MATE** (base principal)
- 🟢 **Debian** y derivadas: Ubuntu, LMDE, MX Linux, etc.
  - Viene incluido en los repos oficiales, pero como librería aparte, cuando instalas ffmpeg desde repositorios oficiales (paquete completo, no **Snap**), trae soporte porque depende del paquete `libx265`.
  
**Instalación si no lo tienes:**

```bash
sudo apt install ffmpeg libx265-dev
```

- 🟡 **Fedora**
  - Fedora incluye ffmpeg con soporte parcial debido a las políticas de software con patentes.
  - Desde Fedora 38+, los repositorios **rpmfusion-free** y **rpmfusion-nonfree** ofrecen `ffmpeg` completo con `x265` habilitado.

  **Habilita, si no lo has hecho aún, `rpmfusion-free` y `rpmfusion-nonfree`**

> Nota: copia y pega en una sola línea:

```bash
sudo dnf install \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

  **Actualiza índices**

```bash
sudo dnf update
```

  **Instalación de x265:**

```bash
sudo dnf install ffmpeg ffmpeg-libs
```

  **Añade códecs extra (recomendado)**
  - Si usas GStreamer, Totem, Celluloid o GNOME vídeos:

```bash
sudo dnf install gstreamer1-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld gstreamer1-plugins-ugly
```

- 🟡 **openSUSE** (Leap y Tumbleweed)
  - Depende del repositorio multimedia adicional **Packman**, que es el que trae soporte completo de códecs y es necesario activarlo.
  
  **Habilita, si no lo has hecho aún, el repo `Packman`**

  - 👉 Para **openSUSE Leap**

  > Nota: copia y pega como un comando único:

```bash
sudo zypper addrepo --refresh \
https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Leap_$(grep VERSION_ID /etc/os-release | cut -d'"' -f2)/ \
packman
```

  - 👉 Para **openSUSE Tumbleweed**

  > Nota: copia y pega como un comando único:

```bash
sudo zypper addrepo --refresh \
https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/ \
packman
```

  - **Actualiza la información de repositorios**

```bash
sudo zypper refresh
```

  - **Packman debe priorizar sobre tus otros repos oficiales**

  > Nota: ⚠️ Esto no reinstalará tu sistema, sólo sustituirá los paquetes multimedia (como ffmpeg, gstreamer, libavcodec, x264, x265, etc.) por sus versiones completas de Packman.

```bash
sudo zypper dup --from packman --allow-vendor-change
```

  - **Instala `ffmpeg` con soporte completo**

  > Nota: los números de versión pueden variar ligeramente según la release actual de openSUSE, verifícalo antes con:
  - `zypper search --details ffmpeg x265 | grep packman`
    - Posible ejemplo de salida
    > | v | nombre    | tipo    | versión | repositorio
    > |---|-----------|---------|---------|-----------------
    > |   | ffmpeg-6  | paquete | 6.1-1.3 | packman
    > | i | ffmpeg-5  | paquete | 5.1-2.1 | packman
    > |   | libx265-199 | paquete | 3.5-150400.1.12 | packman

  > Nota: si en la columna V (versión instalada) hay una i, indica que ese códec ya está instalado y puedes omitirlo en el siguiente comando.
  
```bash
sudo zypper install ffmpeg-6 libx265-199
```

- 🟢 **Arch Linux** y derivadas: Manjaro, EndeavourOS, Garuda, etc.
  - Todas compilan `ffmpeg` con soporte completo (`x264`, `x265`, `VP9`, `AV1`, etc.).
  - Los binarios oficiales incluyen `--enable-libx265`.

```bash
sudo pacman -S ffmpeg x265
```

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

## 📜 Licencia

![Licencia CC BY-NC-SA 4.0](https://img.shields.io/badge/Licencia-CC_BY--NC--SA_4%2E0-wheat?logo=creativecommons&logoColor=wheat)

Licencia: CC BY-NC-SA 4.0 - Compartir igual, sin uso comercial y con atribución.

---

## 📦 CHANGELOG

Revisar el [changelog.txt](./changelog.txt) para el control de cambios.

---

## 🧪 En desarrollo para versiones futuras

- Soporte para formatos `.mp4`, `.avi`, `.mov`.
- Posibilidad de ignorar subtítulos en la salida.
- Automatización por carpeta (recursivo).
- Multilenguaje.

## 🚀 Proyectado para versiones futuras

- Versión GUI (futura fase).
- Otros...
