# 🧽 Mantenimiento de Limpieza

![Versión](https://img.shields.io/badge/Versión-1.0-brightgreen)
![Fecha](https://img.shields.io/badge/Fecha-01_·_Oct_·_2025-blue)
[![Licencia](https://img.shields.io/badge/Licencia-CC·BY·NC·SA·4.0-yellow)](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.es)
![Estado](https://img.shields.io/badge/Estado-Nuevo-success)

---

> [![Autor](https://img.shields.io/badge/👤%20Autor-1973Sobreruedas-orange)](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/tree/main)  
> [![Repositorio](https://img.shields.io/badge/GitHub-El%20Cuaderno%20de%20Bitácora%20Linuxero%20de%201973Sobreruedas-lightgrey?logo=github)](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/tree/main/Cuaderno_Bitacora/Scripts/Mantenimiento%20de%20limpieza)  
> [![Proyecto](https://img.shields.io/badge/🗃️%20Proyecto-Manual%20de%20Supervivencia%20Linux-cyan)](https://manualdesupervivencialinux.com)  
> [![Categoría](https://img.shields.io/badge/📁%20Categoría-Scripts%20–%20GitHub%20🎯%20Scripts%20específicos-cyan)](https://manualdesupervivencialinux.com)  
> [![Contacto](https://img.shields.io/badge/✍️%20Contacto-visita%20la%20sección-orange?style=social)](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/blob/main/Contacto.md)

---

## 🧾 Descripción

Mantener el sistema limpio de archivos innecesarios es una práctica esencial para conservar su estabilidad y rendimiento. Con el tiempo, el uso diario, las instalaciones, pruebas y configuraciones generan residuos digitales que pueden ralentizar procesos o interferir con otras funciones del sistema.

Este script de mantenimiento reúne varias tareas de limpieza y control, pensadas para ejecutarse de forma segura, selectiva e independiente:

- **A nivel de usuario:**
  - Vaciar la papelera.
  - Detectar y eliminar papeleras heredadas o en desuso (procedentes de otros sistemas o discos externos).
  - Limpiar la caché de usuario.
  - Borrar la carpeta de miniaturas (thumbnails).

Su objetivo es ofrecer una herramienta práctica, modular y transparente, que permita mantener un entorno Linux robusto, estable y libre de residuos.

---

## Sistemas soportados

![Debian](https://img.shields.io/badge/Debian-wheat?logo=debian&logoColor=black) y sus derivados ![Linux Mint](https://img.shields.io/badge/Linux%20Mint-wheat?logo=linuxmint&logoColor=black), ![Ubuntu](https://img.shields.io/badge/Ubuntu-wheat?logo=ubuntu&logoColor=black), etc.  
![Fedora](https://img.shields.io/badge/Fedora-wheat?logo=fedora&logoColor=black)  
![openSUSE](https://img.shields.io/badge/openSUSE-wheat?logo=opensuse&logoColor=black)  
![Arch Linux](https://img.shields.io/badge/Arch-wheat?logo=archlinux&logoColor=black) y sus derivadas ![Arch Linux](https://img.shields.io/badge/Manjaro-wheat?logo=manjaro&logoColor=black), ![Arch Linux](https://img.shields.io/badge/EndeavourOS-wheat?logo=Endeavouros&logoColor=black), etc..

### Entornos soportados

![MATE](https://img.shields.io/badge/MATE-wheat?logo=Mate&logoColor=black) ![GNOME](https://img.shields.io/badge/GNOME-wheat?logo=gnome&logoColor=black) ![Cinnamon](https://img.shields.io/badge/Cinnamon-wheat?logo=cinnamon&logoColor=black) ![XFCE](https://img.shields.io/badge/XFCE-wheat?logo=xfce&logoColor=black) ![LXQt](https://img.shields.io/badge/LXQt-wheat?logo=lxqt&logoColor=black)

#### Conclusión de compatibilidad

En ![KDE/Plasma](https://img.shields.io/badge/KDE/Plasma-wheat?logo=kde&logoColor=black), el script es parcialmente compatible con:

- Limpieza de papeleras.
- Purga de caché de usuario.

> Nota: la eliminación de miniaturas aún no está implementada en **KDE/Plasma** (previsto para futuras versiones).

---

## 🛠️ Uso

```bash
Antes del primer uso conceder permisos de ejecución:
chmod +x limpieza.sh
```

```bash
./limpieza.sh
```

### Opción alternativa

Si no aplicas permisos de ejecución:

```bash
bash ./limpieza.sh
```

---

## 🕒 Frecuencia recomendada de uso

La periodicidad depende del tipo de usuario:

- **Uso general:** una vez al mes es suficiente.
- **Uso intensivo (multimedia, edición, pruebas):** semanalmente, especialmente la limpieza de miniaturas.

También puedes automatizar la ejecución mediante `cron` para recibir recordatorios o ejecutar limpiezas programadas.  
El proceso dura apenas unos segundos y puede realizarse sin interrumpir tu flujo de trabajo.

---

## 🧩 Notas técnicas

El *script* ha sido desarrollado en **Bash** con una estructura modular y adaptable a distintos entornos. Cada tarea de limpieza se encuentra encapsulada en funciones independientes, lo que permite añadir, modificar o desactivar partes del código sin afectar al resto del conjunto.

### Estructura general

- **Variables globales:** definen rutas, colores y mensajes comunes para mantener una salida uniforme y clara.
- **Funciones dedicadas:** cada proceso de limpieza (papelera, caché, miniaturas, etc.) dispone de su propia función.
- **Menú interactivo:** el usuario puede elegir qué acción ejecutar mediante un menú numérico, intuitivo y seguro.
- **Mensajes de estado:** cada acción devuelve una respuesta visual (éxito, omisión o error) diferenciada por color.
- **Control de seguridad:** se solicita confirmación antes de proceder con operaciones destructivas (como vaciar la papelera o purgar caché).

### Comportamiento y portabilidad

- Compatible con **bash** ≥ 5.0.
- No requiere privilegios de *root* (actúa únicamente sobre archivos de usuario).
- Compatible con sistemas que usan rutas estándar de entorno: `/home/usuario/.cache`, `/home/usuario/.local/share/Trash`, `~/.thumbnails`.
- Detecta automáticamente papeleras heredadas del tipo `Trash-1000` o `.Trash-$(id -u)`.

### Errores conocidos y limitaciones

- En entornos **KDE/Plasma**, la limpieza de miniaturas no funciona por diferencias en la ubicación del sistema de caché. Se implementará en futuras versiones.
- Algunas distribuciones basadas en **Arch** o sistemas minimalistas pueden no tener predefinida la ruta de `~/.thumbnails`.
- Si el usuario cambia permisos o rutas de caché manualmente, el *script* podría omitir esas ubicaciones sin error visible.

### Recomendaciones

- Si deseas personalizar el *script*, antes de editar el código, asegúrate de conservar una copia original.
- Si deseas ampliar las funciones (por ejemplo, incluir limpieza de logs o temporales del sistema), hazlo dentro de nuevas funciones independientes siguiendo la convención `limpiar_*()`.
- Para entornos multiusuario, se aconseja ejecutar el script desde una cuenta personal, nunca desde **_root_**.

---

## 🧱 Estructura del archivo

El script está dividido en bloques bien delimitados para facilitar su lectura, mantenimiento y ampliación:

> #!/bin/bash  
> ─────────────────────────────────────────────────────────  
> Script de mantenimiento de limpieza  
> por 1973Sobreruedas · Proyecto MSL / CBL  
> ─────────────────────────────────────────────────────────  
>
>set -euo pipefail  
>clear
>
>╔════════════════════════════════════════════════════════╗  
>║ VARIABLES GLOBALES                                     ║  
>╚════════════════════════════════════════════════════════╝  
> • Declaración de colores ANSI y mensajes estándar.  
> • Rutas específicas:  
>   - Papelera local (~/.local/share/Trash)
>   - Caché de usuario (~/.cache)
>   - Miniaturas (subcarpetas de ~/.cache/thumbnails)
> • Control de idioma, versión y mensajes de confirmación.
> 
> ╔═══════════════════════════════════════════════════════╗  
> ║ FUNCIONES PRINCIPALES                                 ║  
> ╚═══════════════════════════════════════════════════════╝  
> • menu_version() → Encabezado con versión local.  
> • vaciar_papelera() → Limpieza completa de la papelera de usuario.  
> • limpiar_papeleras_externas() → Escaneo y purga de papeleras heredadas o externas.  
> • limpiar_carpeta() → Eliminación de miniaturas por patrón *.png.  
> • salidas_*() → Funciones de respuesta con códigos de éxito o error, y colores diferenciados.
> 
> ╔═══════════════════════════════════════════════════════╗  
> ║ MENÚ INTERACTIVO                                      ║  
> ╚═══════════════════════════════════════════════════════╝  
> • Muestra el encabezado con enlaces del proyecto (MSL / GitHub).  
> • Presenta opciones numeradas:  
>   1️⃣ Vaciar papelera  
>   2️⃣ Eliminar papeleras obsoletas  
>   3️⃣ Vaciar caché de usuario  
>   4️⃣ Borrar miniaturas  
>   5️⃣ Salir  
> • Solicita confirmación antes de cada acción destructiva.
> 
> ╔═══════════════════════════════════════════════════════╗  
> ║ BLOQUE PRINCIPAL (CASE)                               ║  
> ╚═══════════════════════════════════════════════════════╝  
> • Evalúa la opción introducida por el usuario.  
> • Llama a la función correspondiente.  
> • Muestra mensajes de resultado personalizados.  
> • Controla errores y salidas seguras.
> 
> ╔═══════════════════════════════════════════════════════╗  
> ║ SEGURIDAD Y PORTABILIDAD                              ║  
> ╚═══════════════════════════════════════════════════════╝  
> • Compatible con bash ≥ 5.0.  
> • Funciona sin privilegios root.  
> • Soporta estructuras de papelera en /media y /run/media.  
> • Usa `set -euo pipefail` para un control robusto de errores.

---

## 🤝 Créditos

- Autor: 1973Sobreruedas · Sobreruedas
- Supervisado y testado con ChatGPT🧠 (OpenAI)

---

## Licencia

Licencia: CC BY-NC-SA 4.0 - Compartir igual, sin uso comercial y con atribución.
