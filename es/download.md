---
layout: page
title: "Descargar LibreDrop"
description: "Descarga LibreDrop para tu plataforma - compartir archivos gratuito y de código abierto"
lang: es
---

## Descargar LibreDrop

Elige tu plataforma para descargar la última versión de LibreDrop:

<div class="download-grid">
  <div class="download-option">
    <div class="download-platform">
      <h3>🤖 Android</h3>
      <p>Android 5.0+ (API 21+)</p>
    </div>
    <div class="download-links">
      <a href="{{ site.download_base_url }}/latest/download/libredrop-android.apk" class="btn btn-primary">Descargar APK</a>
      <a href="#" class="btn btn-secondary">Google Play Store</a>
      <a href="#" class="btn btn-secondary">F-Droid</a>
    </div>
  </div>

  <div class="download-option">
    <div class="download-platform">
      <h3>🪟 Windows</h3>
      <p>Windows 10+ (64-bit)</p>
    </div>
    <div class="download-links">
      <a href="{{ site.download_base_url }}/latest/download/libredrop-windows.exe" class="btn btn-primary">Descargar EXE</a>
      <a href="#" class="btn btn-secondary">Microsoft Store</a>
      <a href="#" class="btn btn-secondary">Chocolatey</a>
    </div>
  </div>

  <div class="download-option">
    <div class="download-platform">
      <h3>🍎 macOS</h3>
      <p>macOS 10.14+ (Mojave)</p>
    </div>
    <div class="download-links">
      <a href="{{ site.download_base_url }}/latest/download/libredrop-macos.dmg" class="btn btn-primary">Descargar DMG</a>
      <a href="#" class="btn btn-secondary">Mac App Store</a>
      <a href="#" class="btn btn-secondary">Homebrew</a>
    </div>
  </div>

  <div class="download-option">
    <div class="download-platform">
      <h3>🐧 Linux</h3>
      <p>La mayoría de distribuciones</p>
    </div>
    <div class="download-links">
      <a href="{{ site.download_base_url }}/latest/download/libredrop-linux.AppImage" class="btn btn-primary">AppImage</a>
      <a href="#" class="btn btn-secondary">Snap Store</a>
      <a href="#" class="btn btn-secondary">Flathub</a>
    </div>
  </div>
</div>

## Requisitos del Sistema

### Requisitos Mínimos
- **Memoria**: 512 MB RAM
- **Almacenamiento**: 100 MB de espacio libre
- **Red**: Conexión Wi-Fi o Ethernet
- **SO**: Ver requisitos específicos por plataforma arriba

### Recomendado
- **Memoria**: 2 GB RAM o más
- **Red**: Wi-Fi 802.11n o Ethernet Gigabit para mejor rendimiento

## Instrucciones de Instalación

### Android
1. Descarga el archivo APK
2. Habilita "Instalar desde fuentes desconocidas" en Configuración
3. Abre el archivo APK y sigue las instrucciones de instalación

### Windows
1. Descarga el instalador EXE
2. Ejecuta como administrador si se solicita
3. Sigue el asistente de instalación

### macOS
1. Descarga el archivo DMG
2. Abre y arrastra LibreDrop a la carpeta Aplicaciones
3. Clic derecho y "Abrir" la primera vez (Gatekeeper)

### Linux
1. Descarga el archivo AppImage
2. Hazlo ejecutable: `chmod +x libredrop-linux.AppImage`
3. Ejecuta: `./libredrop-linux.AppImage`

## Compilaciones de Desarrollo

¿Quieres las últimas características? Compila desde el código fuente:

```bash
git clone {{ site.repository }}
cd libredrop
flutter pub get
flutter run
```

**Requisitos**: Flutter 3.4 o posterior

## Versiones Anteriores

Todas las versiones con registro de cambios están disponibles en nuestra [página de Versiones de GitHub]({{ site.repository }}/releases).

## Verificar Descargas

Por seguridad, verifica la integridad de tu descarga:

```bash
# Sumas de verificación SHA256 disponibles en:
# {{ site.repository }}/releases/latest
sha256sum libredrop-*
```

---

## ¿Necesitas Ayuda?

- 📖 [Guía de Usuario](/es/docs)
- 🐛 [Reportar Problemas]({{ site.repository }}/issues)
- 💬 [Discusiones de la Comunidad]({{ site.repository }}/discussions)
- 📧 [Soporte por Email](mailto:{{ site.author.email }})

<div class="help-note">
  <p><strong>Nota:</strong> LibreDrop es desarrollado por voluntarios. Por favor ten paciencia y considera <a href="/es/contribute">contribuir</a> para ayudar a mejorar el proyecto.</p>
</div>
