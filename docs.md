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
