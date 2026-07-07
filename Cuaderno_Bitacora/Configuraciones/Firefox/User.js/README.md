# 🎛️ User.js para Firefox

![Versión](https://img.shields.io/badge/Versión-2.0-brightgreen)
![Fecha](https://img.shields.io/badge/Fecha-07_·_jul_·_2026-blue)
[![Licencia](https://img.shields.io/badge/Licencia-CC·BY·NC·SA·4.0-yellow)](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.es)
![Estado](https://img.shields.io/badge/Estado-Estable-success)

## · user.js ·

> [![Autor](https://img.shields.io/badge/👤_Autor-1973Sobreruedas-orange)](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/tree/main)  
> [![Repositorio](https://img.shields.io/badge/GitHub-El_Cuaderno_de_Bitácora_Linuxero_de_1973Sobreruedas-lightgrey?logo=github)](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/tree/main/Cuaderno_Bitacora/Scripts/Unir-canciones)  
> [![Proyecto](https://img.shields.io/badge/🗃️_Proyecto-Manual_de_Supervivencia_Linux-cyan)](https://manualdesupervivencialinux.com)  
> [![Categoría](https://img.shields.io/badge/📁_Categoría-💡_Conceptos_/_🔍_Análisis_de_aplicaciones-cyan)](https://manualdesupervivencialinux.com/zona-de-scripts)  
> [![Contacto](https://img.shields.io/badge/✍️_Contacto-visita_la_sección-orange?style=social)](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas/blob/main/Contacto.md)

---

## 🧾 Descripción

`user.js` es el archivo de configuración avanzada de Firefox que permite definir de forma permanente el comportamiento del navegador mediante preferencias internas.

Este proyecto nace con el objetivo de ofrecer una configuración centrada en la **privacidad**, el **control del navegador** y la eliminación de opciones innecesarias, evitando la acumulación de preferencias obsoletas o sin utilidad real.

Especialmente útil para quienes desean reforzar la configuración de Firefox en entornos donde la privacidad y el control del navegador son prioritarios.

Principales áreas de actuación:

• Privacidad  
• Reducción de la telemetría  
• Protección frente al rastreo  
• Control de comportamientos no deseados  
• Optimización de la configuración predeterminada

### 🧠 Filosofía del proyecto

A diferencia de otras recopilaciones disponibles en Internet, este `user.js` no pretende reunir el mayor número posible de ajustes, sino seleccionar únicamente aquellos que aportan un beneficio real y continúan siendo compatibles con las versiones actuales de Firefox.

Cada modificación se analiza antes de incorporarse y las revisiones futuras se realizan cuando resulta necesario para mantener el archivo limpio, coherente y compatible.

---

## 📂 Funcionamiento

Cierra Firefox si tienes algún perfil abierto.

Copia el archivo `user.js` dentro de la carpeta de tu perfil de Firefox: `~/.mozilla/<perfil>/`.

Abre Firefox.

Las preferencias definidas en el archivo `user.js` se aplicarán automáticamente al iniciar Firefox, sin necesidad de realizar ninguna configuración adicional.

> IMPORTANTE
>
> Si ya existe un archivo `user.js`, realiza antes una copia de seguridad o muévelo a otra ubicación segura. De este modo podrás restaurar fácilmente la configuración anterior si fuera necesario.

### 🔒 Permisos (opcional)

Normalmente no es necesario modificar los permisos del archivo. No obstante, puedes verificar que sean los habituales con:

```bash
$ chmod 644 ~/.mozilla/firefox/<perfil>/user.js
```

Este permiso permite que el propietario pueda leer y modificar el archivo, mientras que el resto de usuarios sólo podrá leerlo.

### 📤 Desinstalación

Cierra Firefox si está en ejecución.

Elimina el archivo `user.js` del perfil:

```bash
$ rm ~/.mozilla/<perfil>/user.js
```

> Si realizaste una copia de seguridad de tu anterior `user.js`, vuelve a copiarlo en la carpeta del perfil antes de iniciar Firefox.

Abre Firefox:

- Si has restaurado tu anterior `user.js`, Firefox volverá a utilizar esa configuración.  
- Si no existe ningún archivo `user.js`, Firefox empleará su configuración predeterminada.

---

## ✨ Características

- Configuración centrada en la privacidad y el control del navegador.
- Preferencias organizadas por bloques temáticos.
- Compatible con Firefox 146 o superior.
- Sin telemetría ni experimentos innecesarios.
- Basado en una experiencia de uso real.
- Proyecto en constante revisión y adaptación a las nuevas versiones de Firefox.

---

## 🌐 Compatibilidad

Este archivo `user.js` puede utilizarse en cualquier instalación de Firefox compatible con las preferencias incluidas. La única diferencia entre sistemas es la ubicación del perfil de usuario.

---

## 📜 Licencia

![Licencia CC BY-NC-SA 4.0](https://img.shields.io/badge/Licencia-CC_BY--NC--SA_4%2E0-wheat?logo=creativecommons&logoColor=wheat)

Licencia: CC BY-NC-SA 4.0 - Compartir igual, sin uso comercial y con atribución.

---

## 📦 CHANGELOG

Consulta el archivo [changelog.txt](./changelog.txt) para conocer el historial de cambios del proyecto.

---
