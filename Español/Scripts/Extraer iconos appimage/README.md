# 🎨 Extracción de iconos desde archivos AppImage

> **Autor:** 1973Sobreruedas
> **Repositorio:** [GitHub - Cuaderno de Bitácora Linuxero](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas)
> 
> 📁 Categoría: Integración y personalización de aplicaciones  
> 📅 Fecha: 29 de abril de 2025

---

## 🧭 Introducción

Los archivos `.AppImage` son una forma cómoda y portátil de ejecutar software en **Linux** sin necesidad de instalación. Sin embargo, al no integrarse de forma nativa en el sistema, muchas veces no incluyen su icono en el menú de aplicaciones o en el escritorio.

Si eres de los que cuidan el detalle visual de su entorno, este script es para ti: automatiza la **extracción de todos los iconos gráficos embebidos** en cualquier **AppImage**, organizándolos en un directorio dedicado.

---

## 🛠️ Requisitos previos

Asegúrate de tener los siguientes paquetes instalados:

```bash
sudo apt install binutils
```

> (Opcional pero recomendable)  
> Para otras tareas relacionadas con AppImage:  
> `sudo apt install p7zip-full libfuse2`

---

## 📝 Descripción

El script `extraer_iconos_appimage.sh`:

1. Verifica que se le pase un **AppImage** como argumento.
2. Crea un directorio temporal de extracción usando la opción `--appimage-extract`.
3. Busca y copia todos los archivos con extensiones `.png`, `.svg` o `.ico`.
4. Guarda los iconos extraídos en la carpeta `IconosExtraidos`.
5. Elimina el contenido temporal.

---

## ▶️ Uso paso a paso

### 1. Guarda el script con el nombre:

```bash
extraer_iconos_appimage.sh
```

### 2. Script ejecutable

> Nota: El script **ya está marcado como ejecutable** (`chmod +x` aplicado) para ahorrar tiempo y facilitar su uso o automatización.

---

### 3. Ejecuta el script pasándole el AppImage como argumento:

```bash
./extraer_iconos_appimage.sh nombre-app.AppImage
```

### 4. Revisa la carpeta `IconosExtraidos` en tu directorio actual. Allí estarán todos los iconos encontrados.

```bash
cd IconosExtraidos
ls -ls
```

**Recomendación:** visualizar con Caja (o el Gestor de Archivos que utilicéis) para visualizar los iconos.

---

## 📌 ¿Dónde suelen estar los iconos en un AppImage?

El script automatiza esta búsqueda, pero por si quieres inspeccionar a mano:

- `./usr/share/icons/hicolor/256x256/apps/`
- `./usr/share/pixmaps/`
- `./.DirIcon` (este es común en AppImage sencillos)

---

## 🧩 ¿Y luego qué?

Puedes mover el icono que quieras a tu carpeta local de iconos:

```bash
mkdir -p ~/.local/share/icons/
cp IconosExtraidos/loquesea.png ~/.local/share/icons/
```

Y luego crear un lanzador `.desktop` personalizado, apuntando a ese icono y al AppImage.

---

## Licencia

Este script se proporciona bajo los principios del software libre.
Úsalo, compártelo, y siéntete libre de adaptarlo según tus necesidades. 🐧
