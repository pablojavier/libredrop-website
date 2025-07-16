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
