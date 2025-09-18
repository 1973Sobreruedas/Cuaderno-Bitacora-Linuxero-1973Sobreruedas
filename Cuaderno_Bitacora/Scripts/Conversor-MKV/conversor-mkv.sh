# 🎬 Conversor MKV

# · H265 ·

> **Autor:** 1973Sobreruedas  
> **Repositorio:** [GitHub - Cuaderno de Bitácora Linuxero](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas)  
> **Proyecto**: [Manual de Supervivencia Linux](https://manualdesupervivenciaLinux.com)  
> 📁 **Categoría:** Scripts – GitHub 🎯 Scripts específicos  
> 🆚 **Version:** 1.4  
> 📅 **Fecha:** 18 de septiembre de 2025

---

## 🧾 Descripción

Conversor de archivos con formato H.264 `.mkv` al códec H.265 con selección interactiva de pista de audio. Este script permite convertir de manera fácil los archivos MKV para ahorrar espacio físico en el disco duro.

**Sistemas soportados:**

- Debian y derivados (Linux Mint, Ubuntu)
- Fedora
- openSUSE

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

Trabajará sobre todos los MKV del directorio donde se ejecute el script.

1. Detecta pistas de audio.
2. Si hay una sola, la selecciona automáticamente.
3. Si hay varias, pregunta cuál conservar (el usuario deberá escoger el idioma, según su preferencia: spa/eng u otros).
4. Reconvierte el archivo usando x265, manteniendo subtítulos y todo el encapsulado.
5. Genera un log detallado por cada archivo en `logs/`.

```bash
./mkv-converter.sh --verificar
```

o

```bash
./mkv-converter.sh --check-version
```

Verifica si hay disponible una nueva versión del script en GitHub.

---

## 🤝 Créditos

- Autor: 1973Sobreruedas · Sobreruedas
- Supervisado y testado con ChatGPT🧠 (OpenAI)

---

## 📜 Licencia

Licencia: CC BY-NC-SA 4.0 - Compartir igual, sin uso comercial y con atribución.

---

## 📦 CHANGELOG

Revisar el changelog.txt para el control de cambios de versión.

---

### 🧾 Ejemplo de log generado

```
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

## 🚀 Proyectado para versiones futuras

- Versión GUI (futura fase).
- Otros...
