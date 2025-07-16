#!/bin/bash

# LibreDrop Jekyll Website Setup Script
# This script creates the complete Jekyll structure for libredrop.org

set -e

echo "🚀 Creating LibreDrop Jekyll Website..."
echo "======================================"

# Create directory structure
echo "📁 Creating directory structure..."
mkdir -p _layouts _includes _data assets/css assets/images assets/js _docs

# Create _config.yml
echo "⚙️ Creating _config.yml..."
cat > _config.yml << 'EOF'
# Site settings
title: "LibreDrop"
description: "Privacy-first cross-platform file sharing"
baseurl: ""
url: "https://libredrop.org"
lang: en

# Build settings
markdown: kramdown
highlighter: rouge
theme: minima

plugins:
  - jekyll-feed
  - jekyll-sitemap
  - jekyll-seo-tag

# LibreDrop specific
github_username: pablojavier
repository: pablojavier/libredrop
latest_version: "1.0.0"
download_base_url: "https://github.com/pablojavier/libredrop/releases"

# SEO
author:
  name: "LibreDrop Team"
  email: "hello@libredrop.org"

social:
  name: LibreDrop
  links:
    - https://github.com/pablojavier/libredrop
    - https://twitter.com/LibreDropApp

# Collections
collections:
  docs:
    output: true
    permalink: /:collection/:name/

# Defaults
defaults:
  - scope:
      path: ""
      type: "pages"
    values:
      layout: "page"
  - scope:
      path: "_docs"
      type: "docs"
    values:
      layout: "page"

# Exclude from processing
exclude:
  - setup_site.sh
  - README.md
  - Gemfile
  - Gemfile.lock
  - node_modules
  - vendor
EOF

# Create Gemfile
echo "💎 Creating Gemfile..."
cat > Gemfile << 'EOF'
source "https://rubygems.org"

gem "github-pages", group: :jekyll_plugins
gem "jekyll-feed"
gem "jekyll-sitemap" 
gem "jekyll-seo-tag"

# Windows and JRuby does not include zoneinfo files
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :platforms => [:mingw, :mswin, :x64_mingw, :jruby]
EOF

# Create default layout
echo "🎨 Creating layouts..."
cat > _layouts/default.html << 'EOF'
<!DOCTYPE html>
<html lang="{{ page.lang | default: site.lang | default: "en" }}">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <title>{% if page.title %}{{ page.title | escape }} - {{ site.title | escape }}{% else %}{{ site.title | escape }}{% endif %}</title>
  <meta name="description" content="{{ page.description | default: site.description | strip_html | normalize_whitespace | truncate: 160 | escape }}">
  
  <link rel="stylesheet" href="{{ "/assets/css/style.css" | relative_url }}">
  <link rel="canonical" href="{{ page.url | replace:'index.html','' | absolute_url }}">
  
  {% seo %}
  {% feed_meta %}
  
  <!-- Favicon -->
  <link rel="icon" type="image/png" href="{{ "/assets/images/favicon.png" | relative_url }}">
  
  <!-- Open Graph -->
  <meta property="og:title" content="{% if page.title %}{{ page.title | escape }} - {{ site.title | escape }}{% else %}{{ site.title | escape }}{% endif %}">
  <meta property="og:description" content="{{ page.description | default: site.description | strip_html | normalize_whitespace | truncate: 160 | escape }}">
  <meta property="og:image" content="{{ "/assets/images/libredrop-og.png" | absolute_url }}">
  <meta property="og:url" content="{{ page.url | absolute_url }}">
  <meta property="og:type" content="website">
</head>

<body>
  {% include header.html %}
  
  <main class="page-content" aria-label="Content">
    <div class="wrapper">
      {{ content }}
    </div>
  </main>
  
  {% include footer.html %}
  
  <!-- Platform detection script -->
  <script src="{{ "/assets/js/platform-detect.js" | relative_url }}"></script>
</body>
</html>
EOF

# Create page layout
cat > _layouts/page.html << 'EOF'
---
layout: default
---

<article class="post">
  <header class="post-header">
    <h1 class="post-title">{{ page.title | escape }}</h1>
    {% if page.description %}
      <p class="post-description">{{ page.description }}</p>
    {% endif %}
  </header>

  <div class="post-content">
    {{ content }}
  </div>
</article>
EOF

# Create header include
echo "🧩 Creating includes..."
cat > _includes/header.html << 'EOF'
<header class="site-header" role="banner">
  <div class="wrapper">
    <a class="site-title" rel="author" href="{{ "/" | relative_url }}">
      <img src="{{ "/assets/images/logo.png" | relative_url }}" alt="LibreDrop" class="logo">
      {{ site.title | escape }}
    </a>

    <nav class="site-nav">
      <input type="checkbox" id="nav-trigger" class="nav-trigger" />
      <label for="nav-trigger">
        <span class="menu-icon">
          <svg viewBox="0 0 18 15" width="18px" height="15px">
            <path d="M18,1.484c0,0.82-0.665,1.484-1.484,1.484H1.484C0.665,2.969,0,2.304,0,1.484l0,0C0,0.665,0.665,0,1.484,0 h15.032C17.335,0,18,0.665,18,1.484L18,1.484z M18,7.516C18,8.335,17.335,9,16.516,9H1.484C0.665,9,0,8.335,0,7.516l0,0 c0-0.82,0.665-1.484,1.484-1.484h15.032C17.335,6.031,18,6.696,18,7.516L18,7.516z M18,13.516C18,14.335,17.335,15,16.516,15H1.484 C0.665,15,0,14.335,0,13.516l0,0c0-0.82,0.665-1.483,1.484-1.483h15.032C17.335,12.031,18,12.695,18,13.516L18,13.516z"/>
          </svg>
        </span>
      </label>

      <div class="trigger">
        <a class="page-link" href="{{ "/download" | relative_url }}">Download</a>
        <a class="page-link" href="{{ "/privacy" | relative_url }}">Privacy</a>
        <a class="page-link" href="{{ "/contribute" | relative_url }}">Contribute</a>
        <a class="page-link" href="{{ "/docs" | relative_url }}">Docs</a>
        <a class="page-link" href="{{ site.repository }}">GitHub</a>
      </div>
    </nav>
  </div>
</header>
EOF

# Create footer include
cat > _includes/footer.html << 'EOF'
<footer class="site-footer h-card">
  <data class="u-url" href="{{ "/" | relative_url }}"></data>

  <div class="wrapper">
    <div class="footer-content">
      <div class="footer-section">
        <h3>LibreDrop</h3>
        <p>Privacy-first file sharing for everyone.</p>
        <p class="license">Licensed under <a href="https://www.gnu.org/licenses/gpl-3.0.html">GPL-3.0</a></p>
      </div>
      
      <div class="footer-section">
        <h3>Links</h3>
        <ul class="footer-links">
          <li><a href="{{ "/download" | relative_url }}">Download</a></li>
          <li><a href="{{ "/privacy" | relative_url }}">Privacy Policy</a></li>
          <li><a href="{{ "/contribute" | relative_url }}">Contribute</a></li>
          <li><a href="{{ "/docs" | relative_url }}">Documentation</a></li>
        </ul>
      </div>
      
      <div class="footer-section">
        <h3>Community</h3>
        <ul class="footer-links">
          <li><a href="{{ site.repository }}">GitHub</a></li>
          <li><a href="{{ site.repository }}/issues">Report Issues</a></li>
          <li><a href="{{ site.repository }}/discussions">Discussions</a></li>
          <li><a href="mailto:{{ site.author.email }}">Contact</a></li>
        </ul>
      </div>
    </div>
    
    <div class="footer-bottom">
      <p>&copy; {{ 'now' | date: "%Y" }} {{ site.title }}. Made with ❤️ for the libre software community.</p>
    </div>
  </div>
</footer>
EOF

# Create download buttons include
cat > _includes/download-buttons.html << 'EOF'
<div class="download-buttons">
  <div class="download-primary">
    <a href="{{ site.download_base_url }}/latest" class="btn btn-primary" id="download-auto">
      <span class="btn-icon">⬇️</span>
      <span class="btn-text">Download LibreDrop</span>
      <span class="btn-version">v{{ site.latest_version }}</span>
    </a>
  </div>
  
  <div class="download-alternatives">
    <a href="{{ "/download" | relative_url }}" class="link-secondary">All platforms & versions</a> • 
    <a href="{{ site.repository }}" class="link-secondary">View source code</a>
  </div>
</div>
EOF

# Create main index page
echo "📄 Creating pages..."
cat > index.md << 'EOF'
---
layout: default
title: "Share Files Freely and Privately"
description: "LibreDrop is a free, open-source app for secure file sharing across devices without cloud dependency."
---

<div class="hero">
  <div class="hero-content">
    <h1>Share Files Freely and Privately</h1>
    <p class="lead">LibreDrop enables secure, direct file transfers between devices without cloud services or data collection.</p>
    
    {% include download-buttons.html %}
    
    <p class="hero-sub">
      <a href="{{ site.repository }}">View Source Code</a> • 
      <a href="/privacy">Privacy Promise</a> • 
      <a href="/contribute">Join Community</a>
    </p>
  </div>
  
  <div class="hero-image">
    <img src="/assets/images/libredrop-hero.png" alt="LibreDrop cross-platform file sharing" />
  </div>
</div>

## Why Choose LibreDrop?

<div class="features-grid">
  <div class="feature">
    <div class="feature-icon">🔒</div>
    <h3>Privacy First</h3>
    <p>No data collection, no analytics, no cloud storage. Your files stay on your network, under your control.</p>
  </div>
  
  <div class="feature">
    <div class="feature-icon">🌍</div>
    <h3>Cross-Platform</h3>
    <p>Works seamlessly between Android, macOS, Linux, and Windows devices. One app, all platforms.</p>
  </div>
  
  <div class="feature">
    <div class="feature-icon">🆓</div>
    <h3>Completely Free</h3>
    <p>Open source under GPL-3.0. Free to use, modify, and distribute forever. No hidden costs.</p>
  </div>
  
  <div class="feature">
    <div class="feature-icon">⚡</div>
    <h3>Local Network Speed</h3>
    <p>Direct device-to-device transfers at full network speed without internet dependency.</p>
  </div>
  
  <div class="feature">
    <div class="feature-icon">🎯</div>
    <h3>Simple & Reliable</h3>
    <p>Modern GUI interface with automatic device discovery. Just select files and transfer.</p>
  </div>
  
  <div class="feature">
    <div class="feature-icon">🔓</div>
    <h3>Freedom</h3>
    <p>Built on libre software principles. Study, modify, and improve the code as you wish.</p>
  </div>
</div>

## How It Works

<div class="how-it-works">
  <div class="step">
    <div class="step-number">1</div>
    <h3>Install LibreDrop</h3>
    <p>Download and install on both devices you want to connect.</p>
  </div>
  
  <div class="step">
    <div class="step-number">2</div>
    <h3>Connect to Wi-Fi</h3>
    <p>Ensure both devices are on the same local network.</p>
  </div>
  
  <div class="step">
    <div class="step-number">3</div>
    <h3>Select & Transfer</h3>
    <p>Choose your files and send them instantly and securely.</p>
  </div>
</div>

<p class="text-center"><em>No accounts, no setup, no complexity. It just works.</em></p>

## LibreDrop vs. Alternatives

| Feature | LibreDrop | AirDrop | Google Nearby Share | WeTransfer |
|---------|-----------|---------|-------------------|------------|
| **Cross-platform** | ✅ All platforms | ❌ Apple only | ❌ Android/Windows | ✅ Browser-based |
| **Open Source** | ✅ GPL-3.0 | ❌ Proprietary | ❌ Proprietary | ❌ Proprietary |
| **Privacy** | ✅ No data collection | ⚠️ Apple ecosystem | ❌ Google tracking | ❌ Cloud storage |
| **No internet required** | ✅ Local only | ✅ Local | ⚠️ May use cloud | ❌ Requires internet |
| **File size limit** | ✅ Unlimited | ✅ Large files | ⚠️ Limited | ❌ 2GB limit |
| **Cost** | ✅ Free forever | ✅ For Apple users | ✅ Basic version | ❌ Premium features |

---

<div class="cta-section">
  <h2>Ready to take control of your file sharing?</h2>
  <p>Join thousands of users who have chosen privacy and freedom over corporate surveillance.</p>
  
  {% include download-buttons.html %}
  
  <p class="cta-sub">
    <a href="/privacy">Read our Privacy Promise</a> • 
    <a href="{{ site.repository }}">View the Code</a>
  </p>
</div>
EOF

# Create download page
cat > download.md << 'EOF'
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
EOF

# Create privacy page
cat > privacy.md << 'EOF'
---
layout: page
title: "Privacy Policy"
description: "LibreDrop's commitment to your privacy and data protection"
---

# Privacy Policy

**Last updated: {{ 'now' | date: "%B %d, %Y" }}**

## Our Privacy Promise

LibreDrop is built with privacy-by-design principles. This isn't just marketing speak – it's fundamental to how the application works.

## The Simple Version

**We collect ZERO data about you.** Period.

LibreDrop doesn't collect, store, transmit, or analyze any personal information, usage data, analytics, or telemetry. Your files stay on your devices and your local network.

## The Detailed Version

### Data Collection: None

LibreDrop does not collect:
- ❌ Personal information (names, emails, phone numbers)
- ❌ Usage analytics or telemetry
- ❌ File contents, names, or metadata
- ❌ Device information or identifiers
- ❌ Network information beyond local discovery
- ❌ Location data
- ❌ Crash reports (unless manually sent)

### How File Transfers Work

1. **Local Network Only**: Files are transferred directly between devices on your local Wi-Fi network
2. **No Cloud Storage**: Files never touch our servers or any cloud service
3. **No Internet Required**: Transfers work without internet connectivity
4. **Temporary Connections**: Devices connect only during active transfers
5. **No Logging**: Transfer activities are not logged or recorded

### Data We Cannot Access

Because LibreDrop works locally:
- We cannot see what files you transfer
- We cannot see who you transfer files to
- We cannot see when you use the application
- We cannot see your device information
- We cannot access your local network

### Third-Party Services

LibreDrop does not integrate with any third-party analytics, advertising, or tracking services.

### Website Analytics

This website (libredrop.org) does not use Google Analytics, tracking cookies, or any analytics services. We may review server logs for security purposes only.

### Open Source Transparency

LibreDrop is open source software. You can:
- [Review the complete source code]({{ site.repository }})
- Verify our privacy claims yourself
- Build the application from source
- Contribute improvements to privacy and security

### Changes to Privacy Policy

We will never change our core privacy commitment. Any updates to this policy will only clarify existing practices or add additional privacy protections.

### Contact

Questions about privacy? Contact us at [{{ site.author.email }}](mailto:{{ site.author.email }}).

---

## Privacy by Design

LibreDrop implements privacy through technical design, not just policy:

<div class="privacy-features">
  <div class="privacy-feature">
    <h3>🔒 Local-Only Architecture</h3>
    <p>All transfers happen directly between your devices. No servers, no cloud, no intermediaries.</p>
  </div>
  
  <div class="privacy-feature">
    <h3>🚫 No Analytics Code</h3>
    <p>Zero tracking libraries, analytics SDKs, or telemetry frameworks in the application.</p>
  </div>
  
  <div class="privacy-feature">
    <h3>🔍 Open Source Auditing</h3>
    <p>Complete source code is available for security researchers and privacy advocates to verify.</p>
  </div>
  
  <div class="privacy-feature">
    <h3>🛡️ Minimal Permissions</h3>
    <p>LibreDrop requests only essential permissions needed for file transfer functionality.</p>
  </div>
</div>

---

<div class="privacy-commitment">
  <h2>Our Commitment</h2>
  <p>Privacy is not a feature you can turn on or off – it's the foundation of LibreDrop. We will never compromise on this principle.</p>
  
  <p><strong>Your files, your network, your privacy.</strong></p>
</div>
EOF

# Create contribute page
cat > contribute.md << 'EOF'
---
layout: page
title: "Contribute to LibreDrop"
description: "Help build the future of private, cross-platform file sharing"
---

# Contribute to LibreDrop

LibreDrop is a community-driven project that thrives on contributions from people like you. Whether you're a developer, designer, translator, or user, there are many ways to help.

## 🛠️ For Developers

### Getting Started

1. **Fork the repository** on [GitHub]({{ site.repository }})
2. **Set up your development environment**:
   ```bash
   git clone https://github.com/yourusername/libredrop
   cd libredrop
   flutter pub get
   flutter run
   ```
3. **Read the contributing guidelines** in `CONTRIBUTING.md`
4. **Pick an issue** labeled `good first issue`

### What We Need

- **🪟 Windows Support**: Help improve Windows compatibility
- **🔒 Security Features**: Implement encryption and security enhancements  
- **🎨 UI/UX Improvements**: Better interface and user experience
- **🐛 Bug Fixes**: Fix issues reported by users
- **📱 Mobile Features**: Android and iOS specific improvements
- **🧪 Testing**: Write unit tests and integration tests

### Development Guidelines

- Follow [Flutter style guide](https://dart.dev/guides/language/effective-dart/style)
- Write clear commit messages
- Add tests for new features
- Update documentation
- Respect our [Code of Conduct]({{ site.repository }}/blob/main/CODE_OF_CONDUCT.md)

## 🎨 For Designers

### Design Contributions
- **App Icons**: Create beautiful, consistent icons
- **UI Mockups**: Design new features and improvements
- **Marketing Materials**: Graphics for website and social media
- **Logo Variations**: Different formats and sizes of the LibreDrop logo

### Design Guidelines
- Follow platform-specific design guidelines (Material Design, Human Interface Guidelines)
- Maintain consistency with existing design language
- Consider accessibility in all designs
- Create scalable, high-resolution assets

## 🌍 For Translators

Help make LibreDrop available in more languages:

### Currently Needed
- Spanish
- French  
- German
- Portuguese
- Chinese (Simplified)
- Japanese
- Arabic

### How to Translate
1. Check existing translations in `/lib/l10n/`
2. Create new translation files for your language
3. Submit a pull request with your translations
4. Join our translation team for ongoing maintenance

## 📝 For Writers

### Documentation
- **User Guides**: Help users get started with LibreDrop
- **Developer Docs**: Technical documentation for contributors
- **Tutorials**: Step-by-step guides for common tasks
- **FAQ**: Answer frequently asked questions

### Blog Content
- **Technical Posts**: Explain how LibreDrop works
- **Privacy Articles**: Educate users about digital privacy
- **Use Cases**: Share interesting ways people use LibreDrop

## 🧪 For Testers

### Beta Testing
- Test pre-release versions on your devices
- Report bugs and usability issues
- Verify fixes work correctly
- Test on different platforms and configurations

### Quality Assurance
- Create detailed bug reports
- Test edge cases and unusual scenarios
- Verify privacy and security claims
- Performance testing on various hardware

## 💰 Financial Support

LibreDrop is developed by volunteers, but there are costs:

### What Funding Helps With
- **Domain Registration**: Keep libredrop.org running
- **Code Signing Certificates**: Sign releases for security
- **App Store Fees**: Publish to official app stores
- **Development Tools**: Software licenses for development

### How to Support
- **GitHub Sponsors**: [Sponsor the project]({{ site.repository }})
- **OpenCollective**: Transparent funding at [opencollective.com/libredrop]()
- **Bitcoin**: `bc1qexampleaddresshere` (coming soon)

## 📢 Spread the Word

### Social Media
- Share LibreDrop with friends and family
- Post about it on social media
- Write reviews on app stores
- Mention it in relevant online discussions

### Community Building
- Answer questions in GitHub Discussions
- Help new users in support forums
- Organize local meetups about privacy tools
- Present LibreDrop at conferences and events

## 🏆 Recognition

### Contributors Hall of Fame
All contributors are recognized in:
- `CONTRIBUTORS.md` file in the repository
- Website credits page
- Release notes acknowledgments
- Annual contributor highlights

### Contributor Benefits
- **Direct access** to the development team
- **Early access** to new features
- **Influence** on project direction
- **Learning opportunities** in open source development

## 📋 Getting Started Checklist

Ready to contribute? Here's how to start:

- [ ] ⭐ Star the [GitHub repository]({{ site.repository }})
- [ ] 👀 Read the [Contributing Guidelines]({{ site.repository }}/blob/main/CONTRIBUTING.md)
- [ ] 💬 Join [GitHub Discussions]({{ site.repository }}/discussions)
- [ ] 🔍 Browse [good first issues]({{ site.repository }}/issues?q=is%3Aissue+is%3Aopen+label%3A%22good+first+issue%22)
- [ ] 🍴 Fork the repository and make your first contribution

## ❓ Questions?

- 💬 **Discussions**: [GitHub Discussions]({{ site.repository }}/discussions)
- 📧 **Email**: [{{ site.author.email }}](mailto:{{ site.author.email }})
- 🐛 **Issues**: [GitHub Issues]({{ site.repository }}/issues)

---

<div class="contribute-cta">
  <h2>Every Contribution Matters</h2>
  <p>Whether you fix a typo, translate a string, or implement a major feature – every contribution helps build a more private, secure digital world.</p>
  
  <p><strong>Thank you for considering contributing to LibreDrop!</strong></p>
  
  <a href="{{ site.repository }}" class="btn btn-primary">Get Started on GitHub</a>
</div>
EOF

# Create docs index
cat > docs.md << 'EOF'
---
layout: page
title: "Documentation"
description: "Complete guide to using and understanding LibreDrop"
---

# LibreDrop Documentation

## Quick Start

### Installation
1. [Download LibreDrop](/download) for your platform
2. Install following platform-specific instructions
3. Launch the application

### First Transfer
1. **Connect devices** to the same Wi-Fi network
2. **Open LibreDrop** on both devices  
3. **Select files** on the sender device
4. **Choose recipient** from discovered devices
5. **Confirm transfer** on receiving device
6. **Wait for completion** - files saved to Downloads folder

## User Guide

### Device Discovery
LibreDrop automatically discovers other LibreDrop devices on your local network using:
- **UDP Broadcast**: Devices announce their presence
- **mDNS/Bonjour**: Service discovery protocol
- **Manual IP Entry**: Connect directly if auto-discovery fails

### File Transfer Process
1. **File Selection**: Choose files using platform file picker
2. **Recipient Selection**: Pick target device from list
3. **Transfer Initiation**: WebRTC connection established
4. **Progress Monitoring**: Real-time progress and speed display
5. **Completion**: Files saved to designated folder

### Settings

#### Transfer Folder
- **Default**: Downloads folder
- **Custom**: Choose any accessible folder
- **Persistence**: Setting saved between sessions

#### Network Interface
- **Automatic**: Let LibreDrop choose best interface
- **Manual**: Select specific network adapter
- **Multiple Networks**: Specify preferred networks

#### Privacy Options
- **Device Name**: How your device appears to others
- **Auto-Accept**: Automatically accept incoming transfers
- **Notifications**: Transfer completion alerts

## Troubleshooting

### Common Issues

#### "No devices found"
**Causes:**
- Devices on different networks
- Firewall blocking UDP ports
- Wi-Fi isolation enabled

**Solutions:**
1. Verify both devices on same Wi-Fi network
2. Check firewall settings (allow LibreDrop)
3. Disable Wi-Fi isolation in router settings
4. Try manual IP connection

#### "Transfer failed"
**Causes:**
- Network interruption
- Insufficient storage space
- File permissions issues

**Solutions:**
1. Ensure stable network connection
2. Check available storage space
3. Verify folder write permissions
4. Restart transfer

#### "Connection timeout"
**Causes:**
- Network congestion
- Distance between devices
- Interference

**Solutions:**
1. Move devices closer together
2. Switch to 5GHz Wi-Fi if available
3. Reduce network traffic
4. Restart LibreDrop on both devices

### Platform-Specific Issues

#### Android
- **Battery Optimization**: Disable for LibreDrop
- **Wi-Fi Sleep**: Set to "Never" during transfers
- **Storage Permissions**: Grant access to file system

#### Windows
- **Windows Defender**: Add LibreDrop to exclusions
- **Network Profile**: Set to "Private" not "Public"
- **UAC**: Run as administrator if needed

#### macOS
- **Gatekeeper**: Allow app from unidentified developer
- **Network Permissions**: Grant in Security preferences
- **Sandboxing**: May limit file access in some cases

#### Linux
- **AppImage**: Make executable after download
- **Permissions**: May need to run with elevated privileges
- **Network Manager**: Some configurations may block discovery

## Technical Details

### Network Protocols
- **Discovery**: UDP broadcast on port 7777
- **Transfer**: WebRTC data channels
- **Signaling**: HTTP on random port
- **Encryption**: DTLS (WebRTC standard)

### Security Model
- **Local Network Only**: No internet traffic
- **No Central Server**: Direct peer-to-peer
- **Ephemeral Connections**: No persistent connections
- **No Data Logging**: Zero transfer records

### File Handling
- **Streaming**: Large files transferred in chunks
- **Integrity**: Built-in checksum verification  
- **Resume**: Interrupted transfers can be resumed
- **Cleanup**: Temporary files automatically removed

### Privacy Features
- **No Analytics**: Zero telemetry or tracking
- **Local Storage**: All data remains on device
- **Open Source**: Verifiable privacy claims
- **Minimal Permissions**: Only essential system access

## Advanced Usage

### Command Line Interface
```bash
# Start LibreDrop in headless mode
libredrop --headless

# Specify custom port
libredrop --port 8888

# Enable debug logging
libredrop --debug --verbose

# Send file via CLI
libredrop send --ip 192.168.1.100 --file document.pdf
```

### Configuration Files
```
~/.config/libredrop/config.json    # Linux
~/Library/LibreDrop/config.json    # macOS  
%APPDATA%/LibreDrop/config.json    # Windows
```

### Network Configuration
For enterprise networks:
- **Ports**: UDP 7777 (discovery), TCP random (WebRTC)
- **Firewall Rules**: Allow LibreDrop executable
- **VLAN**: Devices must be on same broadcast domain
- **Proxy**: Direct connections required (no proxy support)

## API Documentation

### REST API (Future)
LibreDrop will expose a REST API for integration:
```
GET /api/devices          # List discovered devices
POST /api/transfer        # Initiate transfer
GET /api/transfer/:id     # Check transfer status
```

### Plugin System (Planned)
Extensibility through plugins:
- Custom transfer protocols
- Additional security layers
- Integration with other apps
- Automated workflows

## FAQ

### General

**Q: Is LibreDrop really free?**
A: Yes, completely free forever. Open source under GPL-3.0.

**Q: How is this different from AirDrop?**
A: LibreDrop works across all platforms, not just Apple devices.

**Q: Do I need internet?**
A: No, works entirely on your local Wi-Fi network.

**Q: Is it secure?**
A: Yes, uses WebRTC encryption and never leaves your network.

### Privacy

**Q: Do you collect any data?**
A: Absolutely zero data collection. See our [Privacy Policy](/privacy).

**Q: Can you see my files?**
A: No, files transfer directly between your devices.

**Q: Is the source code auditable?**
A: Yes, completely open source on [GitHub]({{ site.repository }}).

### Technical

**Q: What file size limits exist?**
A: No artificial limits - depends on your storage space.

**Q: Which platforms are supported?**
A: Android, macOS, Linux, Windows. iOS coming soon.

**Q: Can I use this commercially?**
A: Yes, GPL-3.0 allows commercial use.

## Support

### Community Support
- **GitHub Discussions**: [{{ site.repository }}/discussions]({{ site.repository }}/discussions)
- **Issues**: [{{ site.repository }}/issues]({{ site.repository }}/issues)
- **Email**: [{{ site.author.email }}](mailto:{{ site.author.email }})

### Contributing
Help improve LibreDrop:
- [Contributing Guide](/contribute)
- [Developer Setup]({{ site.repository }}/blob/main/CONTRIBUTING.md)
- [Good First Issues]({{ site.repository }}/issues?q=label%3A%22good+first+issue%22)

---

*LibreDrop is developed by volunteers committed to digital privacy and freedom. Your support helps keep the project alive.*
EOF

# Create custom CSS
echo "🎨 Creating custom styles..."
cat > assets/css/style.scss << 'EOF'
---
---

@import "minima";

// LibreDrop brand colors
$primary-color: #2E7D32;     // Green for libre/freedom
$secondary-color: #1976D2;   // Blue for technology  
$accent-color: #FF6F00;      // Orange for call-to-action
$success-color: #4CAF50;     // Success green
$warning-color: #FF9800;     // Warning orange
$error-color: #F44336;       // Error red

// Typography
$font-family-base: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
$font-family-mono: "SFMono-Regular", Consolas, "Liberation Mono", Menlo, monospace;

// Spacing
$spacing-unit: 1rem;

body {
  font-family: $font-family-base;
  line-height: 1.6;
}

// Header customization
.site-header {
  border-bottom: 1px solid #e8e8e8;
  background: white;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  
  .site-title {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    font-weight: 600;
    color: $primary-color;
    
    .logo {
      height: 32px;
      width: auto;
    }
  }
  
  .site-nav .page-link {
    color: #424242;
    font-weight: 500;
    
    &:hover {
      color: $primary-color;
      text-decoration: none;
    }
  }
}

// Hero section
.hero {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 3rem;
  align-items: center;
  padding: 4rem 0;
  
  @media (max-width: 768px) {
    grid-template-columns: 1fr;
    text-align: center;
    gap: 2rem;
  }
  
  h1 {
    font-size: 3rem;
    font-weight: 700;
    color: $primary-color;
    margin-bottom: 1rem;
    line-height: 1.2;
    
    @media (max-width: 768px) {
      font-size: 2.5rem;
    }
  }
  
  .lead {
    font-size: 1.25rem;
    color: #666;
    margin-bottom: 2rem;
    line-height: 1.5;
  }
  
  .hero-sub {
    margin-top: 1rem;
    
    a {
      color: $secondary-color;
      text-decoration: none;
      font-weight: 500;
      
      &:hover {
        text-decoration: underline;
      }
    }
  }
  
  .hero-image img {
    width: 100%;
    height: auto;
    border-radius: 12px;
    box-shadow: 0 8px 32px rgba(0,0,0,0.1);
  }
}

// Download buttons
.download-buttons {
  margin: 2rem 0;
  
  .btn {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    padding: 1rem 2rem;
    background: $primary-color;
    color: white;
    text-decoration: none;
    border-radius: 8px;
    font-weight: 600;
    font-size: 1.1rem;
    transition: all 0.3s ease;
    border: none;
    cursor: pointer;
    
    &:hover {
      background: darken($primary-color, 10%);
      color: white;
      text-decoration: none;
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(46, 125, 50, 0.3);
    }
    
    &.btn-secondary {
      background: $secondary-color;
      
      &:hover {
        background: darken($secondary-color, 10%);
      }
    }
    
    &.btn-disabled {
      background: #ccc;
      cursor: not-allowed;
      
      &:hover {
        transform: none;
        box-shadow: none;
      }
    }
  }
  
  .btn-version {
    background: rgba(255,255,255,0.2);
    padding: 0.25rem 0.5rem;
    border-radius: 4px;
    font-size: 0.875rem;
  }
  
  .download-alternatives {
    margin-top: 1rem;
    
    .link-secondary {
      color: $secondary-color;
      text-decoration: none;
      font-size: 0.9rem;
      
      &:hover {
        text-decoration: underline;
      }
    }
  }
}

// Features grid
.features-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
  margin: 4rem 0;
  
  .feature {
    text-align: center;
    padding: 2rem 1.5rem;
    border-radius: 12px;
    background: #f8f9fa;
    border: 1px solid #e9ecef;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    
    &:hover {
      transform: translateY(-4px);
      box-shadow: 0 8px 24px rgba(0,0,0,0.1);
    }
    
    .feature-icon {
      font-size: 3rem;
      margin-bottom: 1rem;
    }
    
    h3 {
      color: $primary-color;
      margin-bottom: 1rem;
      font-size: 1.25rem;
      font-weight: 600;
    }
    
    p {
      color: #666;
      line-height: 1.6;
    }
  }
}

// How it works section
.how-it-works {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
  margin: 3rem 0;
  
  .step {
    text-align: center;
    padding: 1.5rem;
    
    .step-number {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      width: 48px;
      height: 48px;
      background: $primary-color;
      color: white;
      border-radius: 50%;
      font-weight: 700;
      font-size: 1.25rem;
      margin-bottom: 1rem;
    }
    
    h3 {
      color: $primary-color;
      margin-bottom: 0.5rem;
    }
  }
}

// Comparison table
table {
  width: 100%;
  margin: 2rem 0;
  border-collapse: collapse;
  background: white;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  
  th, td {
    padding: 1rem;
    text-align: left;
    border-bottom: 1px solid #e9ecef;
  }
  
  th {
    background: $primary-color;
    color: white;
    font-weight: 600;
    
    &:first-child {
      background: darken($primary-color, 10%);
    }
  }
  
  tr:nth-child(even) {
    background: #f8f9fa;
  }
  
  tr:hover {
    background: #e8f5e8;
  }
  
  // Checkmarks and X marks styling
  td {
    &:has(✅) {
      color: $success-color;
      font-weight: 600;
    }
    
    &:has(❌) {
      color: $error-color;
      font-weight: 600;
    }
    
    &:has(⚠️) {
      color: $warning-color;
      font-weight: 600;
    }
  }
}

// Call to action section
.cta-section {
  text-align: center;
  padding: 4rem 2rem;
  background: linear-gradient(135deg, $primary-color, $secondary-color);
  color: white;
  border-radius: 12px;
  margin: 4rem 0;
  
  h2 {
    color: white;
    margin-bottom: 1rem;
    font-size: 2rem;
  }
  
  p {
    font-size: 1.1rem;
    margin-bottom: 2rem;
    opacity: 0.9;
  }
  
  .btn {
    background: white;
    color: $primary-color;
    
    &:hover {
      background: #f0f0f0;
      color: $primary-color;
    }
  }
  
  .cta-sub {
    margin-top: 1rem;
    
    a {
      color: rgba(255,255,255,0.8);
      text-decoration: none;
      
      &:hover {
        color: white;
        text-decoration: underline;
      }
    }
  }
}

// Download grid (download page)
.download-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
  margin: 3rem 0;
  
  .download-option {
    background: white;
    border: 1px solid #e9ecef;
    border-radius: 12px;
    padding: 2rem;
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    
    &:hover {
      transform: translateY(-4px);
      box-shadow: 0 8px 24px rgba(0,0,0,0.1);
    }
    
    .download-platform h3 {
      color: $primary-color;
      margin-bottom: 0.5rem;
    }
    
    .download-links {
      margin-top: 1.5rem;
      display: flex;
      flex-direction: column;
      gap: 0.5rem;
      
      .btn {
        justify-content: center;
        font-size: 0.9rem;
        padding: 0.75rem 1.5rem;
      }
    }
  }
}

// Privacy features (privacy page)
.privacy-features {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
  margin: 3rem 0;
  
  .privacy-feature {
    padding: 1.5rem;
    background: #f8f9fa;
    border-radius: 8px;
    border-left: 4px solid $primary-color;
    
    h3 {
      color: $primary-color;
      margin-bottom: 1rem;
    }
  }
}

.privacy-commitment {
  background: linear-gradient(135deg, $primary-color, $secondary-color);
  color: white;
  padding: 3rem;
  border-radius: 12px;
  text-align: center;
  margin: 3rem 0;
  
  h2 {
    color: white;
    margin-bottom: 1rem;
  }
}

// Contribute page
.contribute-cta {
  background: $primary-color;
  color: white;
  padding: 3rem 2rem;
  border-radius: 12px;
  text-align: center;
  margin: 3rem 0;
  
  h2 {
    color: white;
    margin-bottom: 1rem;
  }
  
  .btn {
    background: white;
    color: $primary-color;
    margin-top: 1rem;
    
    &:hover {
      background: #f0f0f0;
    }
  }
}

// Help note
.help-note {
  background: #fff3cd;
  border: 1px solid #ffeaa7;
  border-radius: 8px;
  padding: 1rem;
  margin: 2rem 0;
  
  p {
    margin: 0;
    color: #856404;
  }
}

// Footer
.site-footer {
  background: #2c3e50;
  color: white;
  
  .footer-content {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 2rem;
    margin-bottom: 2rem;
  }
  
  .footer-section h3 {
    color: white;
    margin-bottom: 1rem;
  }
  
  .footer-links {
    list-style: none;
    margin: 0;
    padding: 0;
    
    li {
      margin-bottom: 0.5rem;
    }
    
    a {
      color: #bdc3c7;
      text-decoration: none;
      
      &:hover {
        color: white;
        text-decoration: underline;
      }
    }
  }
  
  .license {
    color: #bdc3c7;
    font-size: 0.9rem;
  }
  
  .footer-bottom {
    border-top: 1px solid #34495e;
    padding-top: 2rem;
    text-align: center;
    color: #bdc3c7;
    font-size: 0.9rem;
  }
}

// Utility classes
.text-center {
  text-align: center;
}

.text-muted {
  color: #666;
}

// Responsive improvements
@media (max-width: 768px) {
  .wrapper {
    padding: 0 1rem;
  }
  
  .hero {
    padding: 2rem 0;
  }
  
  .features-grid {
    grid-template-columns: 1fr;
    gap: 1.5rem;
  }
  
  .download-grid {
    grid-template-columns: 1fr;
  }
  
  .footer-content {
    grid-template-columns: 1fr;
    gap: 1.5rem;
  }
}

// Code blocks
pre, code {
  font-family: $font-family-mono;
  background: #f8f9fa;
  border-radius: 4px;
}

pre {
  padding: 1rem;
  overflow-x: auto;
  border: 1px solid #e9ecef;
}

code {
  padding: 0.2rem 0.4rem;
  font-size: 0.875em;
}

pre code {
  padding: 0;
  background: none;
}

// Highlight.js custom theme (if used)
.highlight {
  background: #f8f9fa;
  border-radius: 8px;
  padding: 1rem;
  overflow-x: auto;
  margin: 1rem 0;
}
EOF

# Create platform detection JavaScript
echo "🧠 Creating platform detection script..."
cat > assets/js/platform-detect.js << 'EOF'
// Platform detection and download customization
(function() {
    'use strict';
    
    function detectPlatform() {
        const userAgent = navigator.userAgent.toLowerCase();
        const platform = navigator.platform.toLowerCase();
        
        if (userAgent.includes('android')) return 'android';
        if (userAgent.includes('iphone') || userAgent.includes('ipad')) return 'ios';
        if (platform.includes('win')) return 'windows';
        if (platform.includes('mac')) return 'macos';
        if (platform.includes('linux')) return 'linux';
        
        return 'unknown';
    }
    
    function updateDownloadButton() {
        const platform = detectPlatform();
        const downloadBtn = document.getElementById('download-auto');
        
        if (!downloadBtn) return;
        
        const platformLabels = {
            'android': 'Download for Android',
            'windows': 'Download for Windows', 
            'macos': 'Download for macOS',
            'linux': 'Download for Linux',
            'ios': 'Coming Soon for iOS'
        };
        
        const btnText = downloadBtn.querySelector('.btn-text');
        if (btnText && platformLabels[platform]) {
            btnText.textContent = platformLabels[platform];
        }
        
        // Handle iOS special case
        if (platform === 'ios') {
            downloadBtn.classList.add('btn-disabled');
            downloadBtn.href = '#';
            downloadBtn.onclick = function(e) {
                e.preventDefault();
                alert('iOS support is coming soon! Sign up for updates at hello@libredrop.org');
            };
        }
        
        // Add platform class to body for CSS targeting
        document.body.classList.add('platform-' + platform);
    }
    
    // Initialize when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', updateDownloadButton);
    } else {
        updateDownloadButton();
    }
    
    // GitHub API integration for latest release info
    function fetchLatestRelease() {
        const repoUrl = 'https://api.github.com/repos/pablojavier/libredrop/releases/latest';
        
        fetch(repoUrl)
            .then(response => response.json())
            .then(data => {
                // Update version numbers
                const versionElements = document.querySelectorAll('.btn-version');
                versionElements.forEach(el => {
                    el.textContent = data.tag_name || 'v1.0.0';
                });
                
                // Update download links with actual release assets
                const downloadLinks = document.querySelectorAll('a[href*="releases/latest"]');
                downloadLinks.forEach(link => {
                    if (data.html_url) {
                        link.href = data.html_url;
                    }
                });
            })
            .catch(error => {
                console.log('Could not fetch latest release info:', error);
                // Fallback to default links
            });
    }
    
    // Fetch release info after page load
    window.addEventListener('load', fetchLatestRelease);
    
})();
EOF

# Create placeholder images directory and README
echo "🖼️ Creating assets structure..."
cat > assets/images/README.md << 'EOF'
# LibreDrop Website Images

This directory contains images for the LibreDrop website.

## Required Images

Please add the following images to make the website complete:

### Essential Images
- `logo.png` - LibreDrop logo (32x32px for header)
- `favicon.png` - Favicon (32x32px)
- `libredrop-hero.png` - Hero section image showing app interface
- `libredrop-og.png` - Open Graph image for social media (1200x630px)

### Optional Images
- `libredrop-demo.gif` - Animated demo of file transfer process
- `screenshot-android.png` - Android app screenshot
- `screenshot-windows.png` - Windows app screenshot
- `screenshot-macos.png` - macOS app screenshot  
- `screenshot-linux.png` - Linux app screenshot

## Image Guidelines

### Formats
- Use PNG for logos and screenshots
- Use GIF for animations
- Use WebP for photos (with PNG fallback)

### Sizes
- Logo: 256x256px (will be scaled down)
- Screenshots: 1080p or higher resolution
- Hero image: 800x600px minimum
- Open Graph: 1200x630px exactly

### Style
- Use consistent color scheme (green #2E7D32, blue #1976D2)
- Include LibreDrop branding
- Show modern, clean interface design
- Demonstrate cross-platform compatibility

## Creating Images

1. Extract screenshots from actual LibreDrop app
2. Create logo using vector graphics (SVG preferred)
3. Use screen recording tools for demo GIFs
4. Optimize images for web (compress without quality loss)

## Temporary Placeholders

Until real images are created, the website will:
- Show alt text for missing images
- Use CSS to create placeholder backgrounds
- Display properly without images (progressive enhancement)
EOF

# Create data file for downloads
cat > _data/downloads.yml << 'EOF'
platforms:
  - name: Android
    icon: 🤖
    requirements: "Android 5.0+ (API 21+)"
    primary:
      name: "APK Direct"
      url: "/download/android.apk"
    alternatives:
      - name: "Google Play Store"
        url: "#"
        coming_soon: true
      - name: "F-Droid"
        url: "#" 
        coming_soon: true
        
  - name: Windows  
    icon: 🪟
    requirements: "Windows 10+ (64-bit)"
    primary:
      name: "EXE Installer"
      url: "/download/windows.exe"
    alternatives:
      - name: "Microsoft Store"
        url: "#"
        coming_soon: true
      - name: "Chocolatey"
        url: "#"
        coming_soon: true
        
  - name: macOS
    icon: 🍎  
    requirements: "macOS 10.14+ (Mojave)"
    primary:
      name: "DMG Package"
      url: "/download/macos.dmg"
    alternatives:
      - name: "Mac App Store"
        url: "#"
        coming_soon: true
      - name: "Homebrew"
        url: "#"
        coming_soon: true
        
  - name: Linux
    icon: 🐧
    requirements: "Most distributions"  
    primary:
      name: "AppImage"
      url: "/download/linux.AppImage"
    alternatives:
      - name: "Snap Store"
        url: "#"
        coming_soon: true
      - name: "Flathub"
        url: "#"
        coming_soon: true
EOF

# Create GitHub workflow for automated deployment
mkdir -p .github/workflows
cat > .github/workflows/deploy.yml << 'EOF'
name: Deploy Jekyll site to Pages

on:
  push:
    branches: ["main"]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Setup Ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: '3.1'
          bundler-cache: true
          cache-version: 0
      - name: Setup Pages
        id: pages
        uses: actions/configure-pages@v5
      - name: Build with Jekyll
        run: bundle exec jekyll build --baseurl "${{ steps.pages.outputs.base_path }}"
        env:
          JEKYLL_ENV: production
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
EOF

# Create CNAME file for custom domain
echo "libredrop.org" > CNAME

# Create robots.txt
cat > robots.txt << 'EOF'
User-agent: *
Allow: /

Sitemap: https://libredrop.org/sitemap.xml
EOF

# Create final commit script
cat > commit_and_deploy.sh << 'EOF'
#!/bin/bash

echo "🚀 Committing LibreDrop website to Git..."

git add .
git commit -m "Initial LibreDrop website

- Complete Jekyll setup with custom theme
- Landing page with hero section and features
- Download page with platform detection
- Privacy policy and contribution guidelines
- Documentation and FAQ
- Responsive design with LibreDrop branding
- GitHub Pages deployment configuration"

echo "📤 Pushing to GitHub..."
git push origin main

echo "✅ Website deployed!"
echo "🌐 Your site will be available at: https://libredrop.org"
echo "⏱️  Allow 5-10 minutes for deployment and DNS propagation"
echo ""
echo "Next steps:"
echo "1. Add real images to assets/images/"
echo "2. Update download links with actual releases"
echo "3. Customize content as needed"
echo "4. Configure custom domain DNS if not done already"
EOF

chmod +x commit_and_deploy.sh
chmod +x setup_site.sh

echo ""
echo "🎉 LibreDrop Jekyll website created successfully!"
echo "======================================================"
echo ""
echo "📁 Structure created:"
echo "   ├── _config.yml (Jekyll configuration)"
echo "   ├── index.md (Landing page)"
echo "   ├── download.md (Download page)" 
echo "   ├── privacy.md (Privacy policy)"
echo "   ├── contribute.md (Contribution guide)"
echo "   ├── docs.md (Documentation)"
echo "   ├── _layouts/ (Page layouts)"
echo "   ├── _includes/ (Reusable components)"
echo "   ├── assets/ (CSS, JS, images)"
echo "   └── .github/workflows/ (Deployment)"
echo ""
echo "🚀 To deploy:"
echo "   1. Run: bundle install"
echo "   2. Test locally: bundle exec jekyll serve"
echo "   3. Deploy: ./commit_and_deploy.sh"
echo ""
echo "🖼️  Don't forget to add images to assets/images/"
echo "🌐 Site will be live at: https://libredrop.org"
echo ""
echo "✨ Website is ready for LibreDrop!"
EOF

chmod +x setup_site.sh

echo "✅ LibreDrop Jekyll setup script created successfully!"
echo ""
echo "🚀 To create your website:"
echo "   1. cd to your GitHub Pages repository directory"
echo "   2. Run: bash setup_site.sh"
echo "   3. Follow the instructions to deploy"
echo ""
echo "The script will create a complete, professional website for LibreDrop!"
