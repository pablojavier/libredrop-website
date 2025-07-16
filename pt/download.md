---
layout: page
title: "Baixar LibreDrop"
description: "Baixe LibreDrop para sua plataforma - compartilhamento de arquivos gratuito e de código aberto"
lang: pt
---

## Baixar LibreDrop

Escolha sua plataforma para baixar a versão mais recente do LibreDrop:

<div class="download-grid">
  <div class="download-option">
    <div class="download-platform">
      <h3>🤖 Android</h3>
      <p>Android 5.0+ (API 21+)</p>
    </div>
    <div class="download-links">
      <a href="{{ site.download_base_url }}/latest/download/libredrop-android.apk" class="btn btn-primary">Baixar APK</a>
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
      <a href="{{ site.download_base_url }}/latest/download/libredrop-windows.exe" class="btn btn-primary">Baixar EXE</a>
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
      <a href="{{ site.download_base_url }}/latest/download/libredrop-macos.dmg" class="btn btn-primary">Baixar DMG</a>
      <a href="#" class="btn btn-secondary">Mac App Store</a>
      <a href="#" class="btn btn-secondary">Homebrew</a>
    </div>
  </div>

  <div class="download-option">
    <div class="download-platform">
      <h3>🐧 Linux</h3>
      <p>Maioria das distribuições</p>
    </div>
    <div class="download-links">
      <a href="{{ site.download_base_url }}/latest/download/libredrop-linux.AppImage" class="btn btn-primary">AppImage</a>
      <a href="#" class="btn btn-secondary">Snap Store</a>
      <a href="#" class="btn btn-secondary">Flathub</a>
    </div>
  </div>
</div>

## Requisitos do Sistema

### Requisitos Mínimos
- **Memória**: 512 MB RAM
- **Armazenamento**: 100 MB de espaço livre
- **Rede**: Conexão Wi-Fi ou Ethernet
- **SO**: Ver requisitos específicos por plataforma acima

### Recomendado
- **Memória**: 2 GB RAM ou mais
- **Rede**: Wi-Fi 802.11n ou Ethernet Gigabit para melhor performance

## Instruções de Instalação

### Android
1. Baixe o arquivo APK
2. Habilite "Instalar de fontes desconhecidas" nas Configurações
3. Abra o arquivo APK e siga as instruções de instalação

### Windows
1. Baixe o instalador EXE
2. Execute como administrador se solicitado
3. Siga o assistente de instalação

### macOS
1. Baixe o arquivo DMG
2. Abra e arraste LibreDrop para a pasta Aplicativos
3. Clique com botão direito e "Abrir" na primeira vez (Gatekeeper)

### Linux
1. Baixe o arquivo AppImage
2. Torne executável: `chmod +x libredrop-linux.AppImage`
3. Execute: `./libredrop-linux.AppImage`

## Compilações de Desenvolvimento

Quer os recursos mais recentes? Compile do código fonte:

```bash
git clone {{ site.repository }}
cd libredrop
flutter pub get
flutter run
```

**Requisitos**: Flutter 3.4 ou posterior

## Versões Anteriores

Todas as versões com changelog estão disponíveis em nossa [página de Releases do GitHub]({{ site.repository }}/releases).

## Verificar Downloads

Por segurança, verifique a integridade do seu download:

```bash
# Checksums SHA256 disponíveis em:
# {{ site.repository }}/releases/latest
sha256sum libredrop-*
```

---

## Precisa de Ajuda?

- 📖 [Guia do Usuário](/pt/docs)
- 🐛 [Reportar Problemas]({{ site.repository }}/issues)
- 💬 [Discussões da Comunidade]({{ site.repository }}/discussions)
- 📧 [Suporte por Email](mailto:{{ site.author.email }})

<div class="help-note">
  <p><strong>Nota:</strong> LibreDrop é desenvolvido por voluntários. Por favor seja paciente e considere <a href="/pt/contribute">contribuir</a> para ajudar a melhorar o projeto.</p>
</div>
