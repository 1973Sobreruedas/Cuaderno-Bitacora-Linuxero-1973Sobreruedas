# 🎶 Unir canciones

![Versión](https://img.shields.io/badge/Versión-1.0-brightgreen)
![Fecha](https://img.shields.io/badge/Fecha-10_·_jun_·_2025-blue)
[![Licencia](https://img.shields.io/badge/Licencia-CC·BY·NC·SA·4.0-yellow)](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.es)
![Estado](https://img.shields.io/badge/Estado-Estable-success)

## · unir_canciones.sh ·

> [![Autor](https://img.shields.io/badge/👤_Autor-1973Sobreruedas-orange)](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/tree/main)    
> [![Repositorio](https://img.shields.io/badge/GitHub-El_Cuaderno_de_Bitácora_Linuxero_de_1973Sobreruedas-lightgrey?logo=github)](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/tree/main/Cuaderno_Bitacora/Scripts/Unir-canciones)  
> [![Proyecto](https://img.shields.io/badge/🗃️_Proyecto-Manual_de_Supervivencia_Linux-cyan)](https://manualdesupervivencialinux.com)  
> [![Categoría](https://img.shields.io/badge/📁_Categoría-🖥️_Zona_Scripts-cyan)](https://manualdesupervivencialinux.com/zona-de-scripts)  
> [![Contacto](https://img.shields.io/badge/✍️_Contacto-visita_la_sección-orange?style=social)](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/blob/main/Contacto.md)

---

## 🧾 Descripción

**unir_canciones.sh** es un *script* en **Bash** que automatiza la unión de varios archivos de audio `MP3` contenidos en un mismo directorio para generar un único archivo de salida.

El programa solicita al usuario el nombre del archivo resultante, crea de forma automática una lista temporal con todos los `MP3` encontrados y utiliza **FFmpeg** para concatenarlos sin volver a codificar el audio, conservando la calidad original y acelerando el proceso.

Al finalizar, elimina automáticamente el archivo temporal utilizado durante el proceso.

Conserva intactos los archivos `MP3` originales.

## 📂 Funcionamiento

El script trabaja sobre todos los archivos `.mp3` presentes en el directorio desde el que se ejecuta.

El archivo generado se crea en esa misma ubicación con el nombre indicado por el usuario.

### Características

- Une todos los archivos `.mp3` del directorio actual.
- Solicita el nombre del archivo de salida.
- Utiliza **FFmpeg** en modo concatenación.
- No vuelve a codificar el audio (`-c copy`).
- Elimina automáticamente el archivo temporal utilizado durante el proceso.

---

## Sistemas soportados

![Linux Mint MATE](https://img.shields.io/badge/Linux_Mint_MATE-wheat?logo=linuxmint&logoColor=black) (Base principal)  
![Debian](https://img.shields.io/badge/Debian-wheat?logo=debian&logoColor=black) y sus derivados ![Ubuntu](https://img.shields.io/badge/Ubuntu-wheat?logo=ubuntu&logoColor=black), ![MX_Linux](https://img.shields.io/badge/MX_Linux-wheat?logo=mxlinux&logoColor=black), ![LMDE](https://img.shields.io/badge/LMDE-wheat?logo=lmde&logoColor=black), etc.  
![Fedora](https://img.shields.io/badge/Fedora-wheat?logo=fedora&logoColor=black)  
![openSUSE](https://img.shields.io/badge/openSUSE-wheat?logo=opensuse&logoColor=black)  
![Arch Linux](https://img.shields.io/badge/Arch-wheat?logo=archlinux&logoColor=black) y sus derivadas ![Arch Linux](https://img.shields.io/badge/Manjaro-wheat?logo=manjaro&logoColor=black), ![Arch Linux](https://img.shields.io/badge/EndeavourOS-wheat?logo=Endeavouros&logoColor=black), ![Garuda](https://img.shields.io/badge/Garuda-wheat?logo=garuda&logoColor=black), etc.

### Entornos soportados

![MATE](https://img.shields.io/badge/MATE-wheat?logo=Mate&logoColor=black) ![GNOME](https://img.shields.io/badge/GNOME-wheat?logo=gnome&logoColor=black) ![Cinnamon](https://img.shields.io/badge/Cinnamon-wheat?logo=cinnamon&logoColor=black) ![XFCE](https://img.shields.io/badge/XFCE-wheat?logo=xfce&logoColor=black) ![LXQt](https://img.shields.io/badge/LXQt-wheat?logo=lxqt&logoColor=black) ![KDE/Plasma](https://img.shields.io/badge/KDE/Plasma-wheat?logo=kde&logoColor=black)

---

## 🔧 Requisitos

- FFmpeg (accesible desde el PATH)
- Bash 4.0 o superior

## 🛠️ Uso

**Antes del primer uso conceder permisos de ejecución:**

```bash
chmod +x unir_canciones.sh
```

```bash
./unir_canciones.sh
```

### Opción alternativa

Si no aplicas permisos de ejecución:

```bash
bash unir_canciones.sh
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

- Versión entorno gráfico Zenity
- Multilenguaje.
