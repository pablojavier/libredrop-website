---
layout: page
title: "Documentação"
description: "Guia completo para usar e entender LibreDrop"
lang: pt
---

# Documentação LibreDrop

## Início Rápido

### Instalação
1. [Baixe LibreDrop](/pt/download) para sua plataforma
2. Instale seguindo instruções específicas da plataforma
3. Inicie a aplicação

### Primeira Transferência
1. **Conecte dispositivos** à mesma rede Wi-Fi
2. **Abra LibreDrop** em ambos os dispositivos
3. **Selecione arquivos** no dispositivo remetente
4. **Escolha destinatário** dos dispositivos descobertos
5. **Confirme transferência** no dispositivo receptor
6. **Aguarde conclusão** - arquivos salvos na pasta Downloads

## Guia do Usuário

### Descoberta de Dispositivos
LibreDrop descobre automaticamente outros dispositivos LibreDrop na sua rede local usando:
- **UDP Broadcast**: Dispositivos anunciam sua presença
- **mDNS/Bonjour**: Protocolo de descoberta de serviços
- **Entrada Manual de IP**: Conecte diretamente se auto-descoberta falhar

### Processo de Transferência de Arquivos
1. **Seleção de Arquivos**: Escolha arquivos usando seletor de arquivos da plataforma
2. **Seleção de Destinatário**: Escolha dispositivo alvo da lista
3. **Iniciação de Transferência**: Conexão WebRTC estabelecida
4. **Monitoramento de Progresso**: Exibição em tempo real de progresso e velocidade
5. **Conclusão**: Arquivos salvos na pasta designada

### Configurações

#### Pasta de Transferência
- **Padrão**: Pasta Downloads
- **Personalizada**: Escolha qualquer pasta acessível
- **Persistência**: Configuração salva entre sessões

#### Interface de Rede
- **Automática**: Deixe LibreDrop escolher melhor interface
- **Manual**: Selecione adaptador de rede específico
- **Múltiplas Redes**: Especifique redes preferidas

#### Opções de Privacidade
- **Nome do Dispositivo**: Como seu dispositivo aparece para outros
- **Auto-Aceitar**: Aceita automaticamente transferências recebidas
- **Notificações**: Alertas de conclusão de transferência

## Solução de Problemas

### Problemas Comuns

#### "Nenhum dispositivo encontrado"
**Causas:**
- Dispositivos em redes diferentes
- Firewall bloqueando portas UDP
- Isolamento Wi-Fi habilitado

**Soluções:**
1. Verifique se ambos dispositivos estão na mesma rede Wi-Fi
2. Verifique configurações de firewall (permita LibreDrop)
3. Desabilite isolamento Wi-Fi nas configurações do roteador
4. Tente conexão manual por IP

#### "Transferência falhou"
**Causas:**
- Interrupção de rede
- Espaço de armazenamento insuficiente
- Problemas de permissões de arquivo

**Soluções:**
1. Garanta conexão de rede estável
2. Verifique espaço de armazenamento disponível
3. Verifique permissões de escrita da pasta
4. Reinicie transferência

## Detalhes Técnicos

### Protocolos de Rede
- **Descoberta**: UDP broadcast na porta 7777
- **Transferência**: Canais de dados WebRTC
- **Sinalização**: HTTP em porta aleatória
- **Criptografia**: DTLS (padrão WebRTC)

### Modelo de Segurança
- **Apenas Rede Local**: Sem tráfego de internet
- **Sem Servidor Central**: Direto peer-to-peer
- **Conexões Efêmeras**: Sem conexões persistentes
- **Sem Log de Dados**: Zero registros de transferência

---

*LibreDrop é desenvolvido por voluntários comprometidos com privacidade digital e liberdade. Seu apoio ajuda a manter o projeto vivo.*
