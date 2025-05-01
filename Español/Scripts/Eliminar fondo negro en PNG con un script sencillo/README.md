# 🧽 Eliminar el fondo negro de imágenes PNG con un simple script

**Autor:** 1973Sobreruedas
**Repositorio:** [GitHub - Cuaderno de Bitácora Linuxero](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas)

---

## 🧾 Descripción

A veces descargamos iconos o imágenes en formato `.png` que, en lugar de tener fondo transparente, vienen con un fondo **negro sólido**. Esto puede afear la integración visual en escritorios, temas oscuros o páginas web. Pero como buenos linuxeros, lo resolvemos en un par de líneas 😎.

Aquí comparto un script sencillo que he puesto en marcha recientemente, y que **funciona sorprendentemente bien** en la mayoría de los casos:

## 🔧 Requisitos previos

Instalación (en caso de no tenerlo) de **Image Magick**.

```bash
sudo apt update && sudo apt install -y imagemagick
```

Con este comando actualizarás los repositorios y comenzarás la instalación.

---

## 🛠️ ¿Qué hace este script?

- Busca todos los archivos `.png` en la carpeta actual.
- Usa `convert` (de **ImageMagick**) para sustituir el color negro `#000000` por transparencia.
- Aplica `-fuzz 10%` para tolerar pequeños matices alrededor del negro puro (ideal para sombras o bordes).
- Guarda el resultado final en una carpeta `transparente`.

---

## 🔎 Resultado

En la mayoría de los casos los bordes quedan bastante limpios, aunque si el icono tiene negros muy mezclados en zonas importantes, puede que pierdas detalles.

---

## 🧪 Posibles mejoras e integración para usos particulares

Cada usuario puede modificar para su entorno de trabajo los siguientes ajustes:

- **Parámetro de color personalizable**, por si quieres eliminar otro color (como blanco, gris, etc.).
    Deberás sustituir "#000000" `(negro)` por el color hexadecimal correspondiente.
- **Selección de carpeta origen/destino**, para poder trabajar desde otras rutas.

`Nota:` - **Evita la sobreescritura** si ya existe una carpeta `transparente`.
---

¡Una herramienta más para tu cinturón linuxero! 💪

## Licencia

Este script se proporciona bajo los principios del software libre.
Úsalo, compártelo, y siéntete libre de adaptarlo según tus necesidades.
