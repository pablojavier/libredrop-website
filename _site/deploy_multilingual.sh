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
    git push origin master
    
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
