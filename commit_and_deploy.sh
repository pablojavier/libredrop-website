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
