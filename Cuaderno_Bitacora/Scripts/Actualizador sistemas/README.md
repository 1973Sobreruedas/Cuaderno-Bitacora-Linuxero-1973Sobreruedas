# ⚰️ Recuperar Caja

> **Autor:** 1973Sobreruedas  
> **Repositorio:** [GitHub - Cuaderno de Bitácora Linuxero](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas)  
> **Proyecto**: [Manual de Supervivencia Linux](https://manualdesupervivenciaLinux.com)  
> 📁 **Categoría:** Scripts – GitHub 🎯 Scripts específicos  
> 🆚 **Version:** 1.0  
> 📅 **Fecha:** 14 de septiembre de 2025

---

## 🧾 Descripción

Recuperación del gestor de archivos, **Caja**, cuando se comporta con errores de ejecución.  

Se propone este script para evitar reiniciar el sistema o la sesión del usuario y recuperar su estabilidad.

---

## ⚠️ Problema

**Caja** a veces se queda colgado: el panel lateral izquierdo muestra la información sin interación y el panel principal aparece en blanco o con **…** en los contadores de carpetas. No responde al clic ni funcionan los menús.  
Aunque mates el proceso del gestor de archivos, al reabrirlo sigue muerto-viviente.
Este caso no es un fallo aislado, es algo que ya se ha reportado en distintos foros de **Mint/MATE**:  
- Después de un tiempo en ejecución, **Caja** se queda en un estado «zombi».

---

## ❗ Causa
Dos posibles enfoques experimentados:
1. **Primera posibilidad:**
- Integración con el escritorio
  - Caja no es sólo un gestor de archivos, también gestiona el escritorio (fondos, iconos, clic derecho en el escritorio). A veces se queda enganchado al proceso de **mate-settings-daemon** o **marco**.
- Extensiones/*plugins*
  - Si tienes activados complementos (p. ej. caja-share, caja-sendto, caja-dropbox, etc.), alguno puede bloquear la vista principal.
- GLX/XRender y el compositor **marco**
  - Si se usa **marco** sin composición y **Caja** intenta refrescar la vista puede entrar en conflicto con **GTK**.
- Archivos corruptos
  > ~/.config/caja
  > ~/.cache/mate.
2. **Segunda posibilidad:**
- El problema no está en Caja, sino en **gvfs** (el conjunto de demonios que maneja montajes, papelera, red, contadores de elementos, etc.). Cuando **gvfs** se cuelga, **Caja** queda como «zombificado», sin reacción y sin poder realizar ninguna interacción.

---

## 📝 Propuesta

### **🐧 Sistemas soportados:**

> Nota: Sólo para escritorio MATE instalado
- Linux Mint, Ubuntu.
- Debian (si se instala el meta-paquete mate-desktop-environment)
- Fedora MATE-Compiz (trae **Caja** y **gvfs** por defecto)
- OpenSUSE
- Arch y Manjaro (si instalas **Caja** y **gvfs** desde los repositorios).

### **🔧 Propongo dos soluciones distintas**

1. Recuperar **Caja** por fallos puntuales de integración con el escritorio, extensiones/*plugins*, GLX/XRender y **marco**, y archivos corruptos.
2. Recuperar **Caja** por problema del *daemon* **gvfs**.

---

## 🛠️ Uso

```bash
Antes del primer uso conceder permisos de ejecución:
chmod +x recuperar_caja.sh
```

```bash
Modo de empleo:
./recuperar_caja.sh
```

### Opción alternativa
Si no aplicas permisos de ejecución:

```bash
bash recuperar_caja.sh
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

## v1.0 – Versión inicial pública
- Nuevo: Recupera el funcionamiento de **Caja** si arranca «zombificado»
- Nuevo: selección de opciones para elegir funcionalidad
