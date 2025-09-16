# 🧽 Eliminar el fondo negro de imágenes PNG

> **Autor:** 1973Sobreruedas  
> **Repositorio:** [GitHub - Cuaderno de Bitácora Linuxero](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas)  
> **Proyecto**: [Manual de Supervivencia Linux](https://manualdesupervivenciaLinux.com)  
> 📁 **Categoría:** Scripts – GitHub 🎯 Scripts específicos  
> 🆚 **Version:** 1.1  
> 📅 **Fecha:** 16 de septiembre de 2025

---

---

## 🧾 Descripción

A veces descargamos iconos o imágenes en formato `.png` que, en lugar de tener fondo transparente, vienen con un fondo **negro sólido**. Esto puede afear la integración visual en escritorios, temas oscuros o páginas web. Pero como buenos linuxeros, lo resolvemos en un par de líneas 😎.

Aquí comparto un script que **funciona sorprendentemente bien** en la mayoría de los casos.

**Sistemas soportados:**

- Debian y derivados (Linux Mint, Ubuntu, etc.)

## 🔧 Requisitos previos

Instalación (en caso de no tenerlo) de **Image Magick**.

```bash
sudo apt-get update && sudo apt-get install -y imagemagick
```

Con este comando actualizarás los repositorios y comenzarás la instalación de las dependencias.

---

## 🛠️ ¿Qué hace este script?

- Busca todos los archivos `.png` en la carpeta actual.
- Usa `convert` (de **ImageMagick**) para sustituir el color negro `#000000` por transparencia.
- Aplica `-fuzz 10%` para tolerar pequeños matices alrededor del negro puro (ideal para sombras o bordes).
- Guarda el resultado final en una carpeta llamada `PNG con transparencia`.
- Mantiene tus archivos originales intactos.

---

## 🔎 Resultado

En la mayoría de los casos los bordes quedan bastante limpios, aunque si el icono tiene negros muy mezclados en zonas importantes, puede que pierdas detalles.

---

## 🧪 Posibles mejoras e integración para usos particulares

Cada usuario puede modificar para su entorno de trabajo los siguientes ajustes:

- **Parámetro de color personalizable**, por si quieres eliminar otro color (como blanco, gris, etc.).
    Deberás sustituir "#000000" `(negro)` por el color hexadecimal correspondiente.
- **Selección de carpeta origen/destino**, para poder trabajar desde otras rutas.

`Nota:` - **Evita la sobreescritura** si ya existe la carpeta `PNG con transparencia`. Será necesario que la borres, muevas o renombres para ejecutar el script.

---

¡Una herramienta más para tu cinturón linuxero! 💪

## Licencia

Licencia: CC BY-NC-SA 4.0 - Compartir igual, sin uso comercial y con atribución.
