---
layout: page
title: "Documentación"
description: "Guía completa para usar y entender LibreDrop"
lang: es
---

# Documentación de LibreDrop

## Inicio Rápido

### Instalación
1. [Descarga LibreDrop](/es/download) para tu plataforma
2. Instala siguiendo las instrucciones específicas de la plataforma
3. Inicia la aplicación

### Primera Transferencia
1. **Conecta dispositivos** a la misma red Wi-Fi
2. **Abre LibreDrop** en ambos dispositivos
3. **Selecciona archivos** en el dispositivo emisor
4. **Elige destinatario** de los dispositivos descubiertos
5. **Confirma transferencia** en el dispositivo receptor
6. **Espera completación** - archivos guardados en carpeta Descargas

## Guía de Usuario

### Descubrimiento de Dispositivos
LibreDrop descubre automáticamente otros dispositivos LibreDrop en tu red local usando:
- **UDP Broadcast**: Los dispositivos anuncian su presencia
- **mDNS/Bonjour**: Protocolo de descubrimiento de servicios
- **Entrada Manual de IP**: Conecta directamente si el auto-descubrimiento falla

### Proceso de Transferencia de Archivos
1. **Selección de Archivos**: Elige archivos usando el selector de archivos de la plataforma
2. **Selección de Destinatario**: Elige dispositivo objetivo de la lista
3. **Iniciación de Transferencia**: Se establece conexión WebRTC
4. **Monitoreo de Progreso**: Visualización en tiempo real de progreso y velocidad
5. **Completación**: Archivos guardados en carpeta designada

### Configuración

#### Carpeta de Transferencia
- **Por Defecto**: Carpeta Descargas
- **Personalizada**: Elige cualquier carpeta accesible
- **Persistencia**: Configuración guardada entre sesiones

#### Interfaz de Red
- **Automática**: Deja que LibreDrop elija la mejor interfaz
- **Manual**: Selecciona adaptador de red específico
- **Múltiples Redes**: Especifica redes preferidas

#### Opciones de Privacidad
- **Nombre del Dispositivo**: Cómo aparece tu dispositivo a otros
- **Auto-Aceptar**: Acepta automáticamente transferencias entrantes
- **Notificaciones**: Alertas de completación de transferencia

## Solución de Problemas

### Problemas Comunes

#### "No se encontraron dispositivos"
**Causas:**
- Dispositivos en redes diferentes
- Firewall bloqueando puertos UDP
- Aislamiento Wi-Fi habilitado

**Soluciones:**
1. Verifica que ambos dispositivos estén en la misma red Wi-Fi
2. Revisa configuración de firewall (permite LibreDrop)
3. Deshabilita aislamiento Wi-Fi en configuración del router
4. Intenta conexión manual por IP

#### "Transferencia falló"
**Causas:**
- Interrupción de red
- Espacio de almacenamiento insuficiente
- Problemas de permisos de archivos

**Soluciones:**
1. Asegura conexión de red estable
2. Verifica espacio de almacenamiento disponible
3. Verifica permisos de escritura de carpeta
4. Reinicia transferencia

## Detalles Técnicos

### Protocolos de Red
- **Descubrimiento**: UDP broadcast en puerto 7777
- **Transferencia**: Canales de datos WebRTC
- **Señalización**: HTTP en puerto aleatorio
- **Cifrado**: DTLS (estándar WebRTC)

### Modelo de Seguridad
- **Solo Red Local**: Sin tráfico de internet
- **Sin Servidor Central**: Directo peer-to-peer
- **Conexiones Efímeras**: Sin conexiones persistentes
- **Sin Registro de Datos**: Cero registros de transferencia

---

*LibreDrop es desarrollado por voluntarios comprometidos con la privacidad digital y la libertad. Tu apoyo ayuda a mantener el proyecto vivo.*
