---
layout: page
title: "Download LibreDrop"
description: "Download LibreDrop for your platform - free, open-source file sharing"
---

## Download LibreDrop

Choose your platform to download the latest version of LibreDrop:

<div class="download-grid">
  <div class="download-option">
    <div class="download-platform">
      <h3>🤖 Android</h3>
      <p>Android 5.0+ (API 21+)</p>
    </div>
    <div class="download-links">
      <a href="{{ site.download_base_url }}/latest/download/libredrop-android.apk" class="btn btn-primary">Download APK</a>
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
      <a href="{{ site.download_base_url }}/latest/download/libredrop-windows.exe" class="btn btn-primary">Download EXE</a>
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
      <a href="{{ site.download_base_url }}/latest/download/libredrop-macos.dmg" class="btn btn-primary">Download DMG</a>
      <a href="#" class="btn btn-secondary">Mac App Store</a>
      <a href="#" class="btn btn-secondary">Homebrew</a>
    </div>
  </div>

  <div class="download-option">
    <div class="download-platform">
      <h3>🐧 Linux</h3>
      <p>Most distributions</p>
    </div>
    <div class="download-links">
      <a href="{{ site.download_base_url }}/latest/download/libredrop-linux.AppImage" class="btn btn-primary">AppImage</a>
      <a href="#" class="btn btn-secondary">Snap Store</a>
      <a href="#" class="btn btn-secondary">Flathub</a>
    </div>
  </div>
</div>

## System Requirements

### Minimum Requirements
- **Memory**: 512 MB RAM
- **Storage**: 100 MB free space
- **Network**: Wi-Fi or Ethernet connection
- **OS**: See platform-specific requirements above

### Recommended
- **Memory**: 2 GB RAM or more
- **Network**: 802.11n Wi-Fi or Gigabit Ethernet for best performance

## Installation Instructions

### Android
1. Download the APK file
2. Enable "Install from unknown sources" in Settings
3. Open the APK file and follow installation prompts

### Windows
1. Download the EXE installer
2. Run as administrator if prompted
3. Follow the installation wizard

### macOS
1. Download the DMG file
2. Open and drag LibreDrop to Applications folder
3. Right-click and "Open" first time (Gatekeeper)

### Linux
1. Download AppImage file
2. Make executable: `chmod +x libredrop-linux.AppImage`
3. Run: `./libredrop-linux.AppImage`

## Development Builds

Want the latest features? Build from source:

```bash
git clone {{ site.repository }}
cd libredrop
flutter pub get
flutter run
```

**Requirements**: Flutter 3.4 or later

## Previous Versions

All releases with changelog are available on our [GitHub Releases page]({{ site.repository }}/releases).

## Verify Downloads

For security, verify your download integrity:

```bash
# SHA256 checksums available at:
# {{ site.repository }}/releases/latest
sha256sum libredrop-*
```

---

## Need Help?

- 📖 [User Guide](/docs)
- 🐛 [Report Issues]({{ site.repository }}/issues)
- 💬 [Community Discussions]({{ site.repository }}/discussions)
- 📧 [Email Support](mailto:{{ site.author.email }})

<div class="help-note">
  <p><strong>Note:</strong> LibreDrop is developed by volunteers. Please be patient and consider <a href="/contribute">contributing</a> to help improve the project.</p>
</div>
