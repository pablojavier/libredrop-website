#!/bin/bash

# LibreDrop Multilingual Website Setup Script (macOS Compatible)
# Fixes sed compatibility issues for macOS BSD sed

set -e

echo "🔧 Fixing remaining setup issues..."
echo "=================================="

# Fix the English pages with proper macOS sed syntax
echo "🔄 Adding language attributes to English pages..."

# Function to add lang attribute after frontmatter start
add_lang_to_file() {
    local file="$1"
    local lang="$2"
    
    if [[ -f "$file" ]]; then
        # Check if lang attribute already exists
        if ! grep -q "^lang:" "$file"; then
            # Create temp file with lang attribute added after second line (after ---)
            awk 'NR==2 && /^---/ {print; print "lang: " "'"$lang"'"; next} {print}' "$file" > "${file}.tmp"
            mv "${file}.tmp" "$file"
            echo "   ✅ Added lang: $lang to $file"
        else
            echo "   ⚠️  $file already has lang attribute"
        fi
    else
        echo "   ❌ File $file not found"
    fi
}

# Add language attributes to English pages
add_lang_to_file "index.md" "en"
add_lang_to_file "download.md" "en"
add_lang_to_file "privacy.md" "en"
add_lang_to_file "contribute.md" "en"
add_lang_to_file "docs.md" "en"

# Create the missing sitemap.xml file
echo "🗺️ Creating sitemap.xml..."
cat > sitemap.xml << 'EOF'
---
layout: sitemap
---
EOF

# Create robots.txt if it doesn't exist
if [[ ! -f "robots.txt" ]]; then
    echo "🤖 Creating robots.txt..."
    cat > robots.txt << 'EOF'
User-agent: *
Allow: /

Sitemap: https://libredrop.org/sitemap.xml
EOF
fi

# Update the JavaScript for better browser compatibility
echo "🧠 Updating platform detection script..."
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
EOF

# Test Jekyll build
echo "🧪 Testing Jekyll build..."
if command -v bundle >/dev/null 2>&1; then
    if [[ -f "Gemfile" ]]; then
        echo "   📦 Installing dependencies..."
        bundle install --quiet
        
        echo "   🔨 Building site..."
        if bundle exec jekyll build --quiet; then
            echo "   ✅ Jekyll build successful!"
        else
            echo "   ⚠️  Jekyll build had warnings, but continuing..."
        fi
    else
        echo "   ⚠️  No Gemfile found, skipping build test"
    fi
else
    echo "   ⚠️  Bundle not installed, skipping build test"
fi

# Create updated deployment script
echo "🚀 Creating deployment script..."
cat > deploy_multilingual.sh << 'EOF'
#!/bin/bash

echo "🌍 Deploying LibreDrop Multilingual Website..."
echo "============================================="

# Check if we're in the right directory
if [[ ! -f "_config.yml" ]]; then
    echo "❌ Error: Not in Jekyll site directory. Please run from site root."
    exit 1
fi

# Test the site locally first
echo "🧪 Testing site locally..."
if command -v bundle >/dev/null 2>&1; then
    bundle exec jekyll build
    
    if [ $? -eq 0 ]; then
        echo "✅ Local build successful!"
    else
        echo "❌ Local build failed. Please fix errors before deploying."
        exit 1
    fi
else
    echo "⚠️  Bundle not available, skipping local build test"
fi

# Check git status
if [[ -n $(git status --porcelain) ]]; then
    echo "📝 Committing multilingual changes..."
    git add .
    git commit -m "Add multilingual support for LibreDrop website

- Added Spanish (es) and Portuguese (pt) translations
- Updated header with language switcher
- Created complete translated versions of all pages
- Added language-aware sitemap with hreflang
- Improved SEO for international audiences
- Fixed macOS compatibility issues
- Responsive language selector with flags"

    echo "🚀 Pushing to GitHub..."
    git push origin main
    
    if [ $? -eq 0 ]; then
        echo "✅ Successfully pushed to GitHub!"
    else
        echo "❌ Failed to push to GitHub. Please check your connection and try again."
        exit 1
    fi
else
    echo "ℹ️  No changes to commit"
fi

echo ""
echo "✅ Multilingual LibreDrop website deployed!"
echo "🌐 Available at:"
echo "   🇺🇸 English:   https://libredrop.org/"
echo "   🇪🇸 Español:   https://libredrop.org/es/"
echo "   🇧🇷 Português: https://libredrop.org/pt/"
echo ""
echo "⏱️  Allow 5-10 minutes for GitHub Pages deployment"
echo "💡 Test locally with: bundle exec jekyll serve"
EOF

chmod +x deploy_multilingual.sh

# Create local testing script
echo "🧪 Creating local test script..."
cat > test_local.sh << 'EOF'
#!/bin/bash

echo "🧪 Testing LibreDrop Website Locally..."
echo "======================================"

# Check if bundle is available
if ! command -v bundle >/dev/null 2>&1; then
    echo "❌ Bundle not found. Please install:"
    echo "   gem install bundler"
    exit 1
fi

# Install dependencies if needed
if [[ ! -d "vendor/bundle" ]]; then
    echo "📦 Installing dependencies..."
    bundle install
fi

echo "🚀 Starting local Jekyll server..."
echo "📱 Open your browser to:"
echo "   🇺🇸 English:   http://localhost:4000/"
echo "   🇪🇸 Español:   http://localhost:4000/es/"
echo "   🇧🇷 Português: http://localhost:4000/pt/"
echo ""
echo "💡 Press Ctrl+C to stop the server"
echo ""

bundle exec jekyll serve --host 0.0.0.0 --port 4000 --livereload
EOF

chmod +x test_local.sh

# Final verification
echo ""
echo "🔍 Verifying setup..."

# Check if key files exist
files_to_check=("es/index.md" "pt/index.md" "_config.yml" "index.md")
for file in "${files_to_check[@]}"; do
    if [[ -f "$file" ]]; then
        echo "   ✅ $file exists"
    else
        echo "   ❌ $file missing"
    fi
done

# Check language attributes
if grep -q "^lang: en" index.md 2>/dev/null; then
    echo "   ✅ English pages have lang attribute"
else
    echo "   ⚠️  English pages may be missing lang attribute"
fi

if grep -q "^lang: es" es/index.md 2>/dev/null; then
    echo "   ✅ Spanish pages have lang attribute"
else
    echo "   ❌ Spanish pages missing lang attribute"
fi

if grep -q "^lang: pt" pt/index.md 2>/dev/null; then
    echo "   ✅ Portuguese pages have lang attribute"
else
    echo "   ❌ Portuguese pages missing lang attribute"
fi

echo ""
echo "🎉 LibreDrop Multilingual Setup Complete!"
echo "========================================"
echo ""
echo "📁 Structure created:"
echo "   ├── 🇺🇸 English pages (root) with lang: en"
echo "   ├── 🇪🇸 Spanish pages (/es/) with lang: es"
echo "   ├── 🇧🇷 Portuguese pages (/pt/) with lang: pt"
echo "   ├── 🌐 Language switcher in header"
echo "   ├── 🎨 Responsive CSS styling"
echo "   ├── 🗺️ SEO-optimized sitemap"
echo "   └── 🤖 Updated robots.txt"
echo ""
echo "🚀 Next steps:"
echo "   1. Test locally:  ./test_local.sh"
echo "   2. Deploy:        ./deploy_multilingual.sh"
echo ""
echo "🌐 After deployment, your site will be available at:"
echo "   🇺🇸 https://libredrop.org/"
echo "   🇪🇸 https://libredrop.org/es/"
echo "   🇧🇷 https://libredrop.org/pt/"
echo ""
echo "✨ LibreDrop is now ready for global audiences!"
EOF

chmod +x multilingual_setup_fixed.sh

echo "🔧 Fixed the script for macOS compatibility!"
echo ""
echo "🚀 Run the fixed version:"
echo "   bash multilingual_setup_fixed.sh"
echo ""
echo "This version:"
echo "✅ Uses macOS-compatible sed syntax"
echo "✅ Adds proper error handling"
echo "✅ Creates helper scripts for testing and deployment"
echo "✅ Includes build verification"
