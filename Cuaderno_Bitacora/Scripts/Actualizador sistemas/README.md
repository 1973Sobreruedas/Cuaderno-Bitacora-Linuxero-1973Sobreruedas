# Actualizador de Sistemas Linux

**Autor:** 1973Sobreruedas
**Repositorio:** [GitHub - Cuaderno de Bitácora Linuxero](https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas)

---

## 🧾 Descripción

Este script permite actualizar su sistema Linux de manera sencilla y automatizada.

**Sistemas soportados:**

- Debian y derivados (Linux Mint, Ubuntu)
- Fedora
- openSUSE

---

## 🛠️ Uso

```bash
Antes del primer uso conceder permisos de ejecución:
chmod +x actualizador-sistemas.sh
```

Ejecute el script desde la Terminal:
```bash
./actualizador-sistemas.sh
```

### Opción alternativa
Si no aplicas permisos de ejecución:

```bash
bash actualizador-sistemas.sh
```

Verifica si hay disponible una nueva versión del script en GitHub.
```bash
./actualizador-sistemas.sh --verificar
```

o

```bash
./actualizador-sistemas.sh --check-version
```

## Nota sobre Arch Linux - Manjaro

Este script no incluye soporte para Arch Linux / Manjaro.
Debido a la alta personalización y a la filosofía de mantenimiento manual de Arch, se recomienda que los usuarios de esta distribución gestionen sus actualizaciones de forma manual, conforme a sus propias configuraciones y necesidades.

## Licencia

Licencia: CC BY-NC-SA 4.0 - Compartir igual, sin uso comercial y con atribución.
