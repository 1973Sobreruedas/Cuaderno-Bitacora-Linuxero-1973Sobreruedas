# Recomprimir vídeos a MKV

**Versión:** 1.1

# · H265 ·

**Autor:** 1973Sobreruedas

**Repositorio:** [GitHub - Cuaderno de Bitácora Linuxero](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas)

**Proyecto**: [Manual de Supervivencia Linux](https://manualdesupervivenciaLinux.com)

---

## 🧾 Descripción

Conversor de archivos con formato H.264 `.mkv` al códec H.265 con selección interactiva de pista de audio. Este script permite convertir de manera fácil los archivos MKV para ahorrar espacio físico en el disco duro.

**Sistemas soportados:**

- Debian y derivados (Linux Mint, Ubuntu)
- Fedora
- openSUSE

> Nota: El script **ya está marcado como ejecutable** (`chmod +x` aplicado) para ahorrar tiempo y facilitar su uso o automatización.

---

## 🔧 Requisitos

- ffmpeg
- bash ≥ 4.0
- ffprobe (viene con ffmpeg)

---

## 🛠️Uso

```bash
./recomprimir-mkv.sh
```

Trabajará sobre todos los MKV del directorio donde se ejecute el script.

1. Detecta pistas de audio.
2. Si hay una sola, la selecciona automáticamente.
3. Si hay varias, pregunta cuál conservar (el usuario deberá escoger el idioma, según su preferencia: spa/eng u otros).
4. Reconvierte el archivo usando x265, manteniendo subtítulos y todo el encapsulado.
5. Genera un log detallado por cada archivo en `logs/`.

## 🤝 Créditos

- Autor: 1973Sobreruedas · Sobreruedas
- Supervisado y testado con ChatGPT🧠 (OpenAI)

## 📜 Licencia

Licencia: CC BY-NC-SA 4.0 - Compartir igual, sin uso comercial y con atribución.

## 📦 CHANGELOG

### v1.1 – Navegación mejorada y feedback final

- Corrección en la selección de pista de audio.
- Numeración de índices más intuitiva (comienza desde 1).
- Salida de información más clara y coloreada.
- Resumen al finalizar: archivo convertido, tiempo y compresión.

### v1.0 – Primera publicación

- Conversión de archivos MKV (H.264) a H.265.
- Detección de pistas de audio y selección interactiva.
- Registro por archivo en el directorio `logs/`.

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

## 🧪 En desarrollo para v1.2

- Soporte para formatos `.mp4`, `.avi`, `.mov`.
- Posibilidad de ignorar subtítulos en la salida.
- Automatización por carpeta (recursivo).

## 🚀 En desarrollo para v1.3

- Versión GUI (futura fase).
- Otros...
