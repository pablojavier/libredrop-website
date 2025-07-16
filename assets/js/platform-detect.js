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
        
        // Update for different languages
        const lang = document.documentElement.lang || 'en';
        const localizedLabels = {
            'en': platformLabels,
            'es': {
                'android': 'Descargar para Android',
                'windows': 'Descargar para Windows',
                'macos': 'Descargar para macOS', 
                'linux': 'Descargar para Linux',
                'ios': 'Próximamente para iOS'
            },
            'pt': {
                'android': 'Baixar para Android',
                'windows': 'Baixar para Windows',
                'macos': 'Baixar para macOS',
                'linux': 'Baixar para Linux', 
                'ios': 'Em breve para iOS'
            }
        };
        
        const labels = localizedLabels[lang] || platformLabels;
        const btnText = downloadBtn.querySelector('.btn-text');
        if (btnText && labels[platform]) {
            btnText.textContent = labels[platform];
        }
        
        // Handle iOS special case
        if (platform === 'ios') {
            downloadBtn.classList.add('btn-disabled');
            downloadBtn.href = '#';
            downloadBtn.onclick = function(e) {
                e.preventDefault();
                const messages = {
                    'en': 'iOS support is coming soon! Sign up for updates at hello@libredrop.org',
                    'es': '¡El soporte para iOS llegará pronto! Regístrate para actualizaciones en hello@libredrop.org',
                    'pt': 'Suporte para iOS em breve! Cadastre-se para atualizações em hello@libredrop.org'
                };
                alert(messages[lang] || messages['en']);
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
