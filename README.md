# Olympus Mytikas
Static guild presentation. Preview: `python3 -m http.server 8080 --directory site`.
Edit `site/index.html` for page content and the complete chronicle. Keep the chronicle fallback in `site/content.js` synchronized. Set recruitment values at the top of `site/content.js`; null fields stay hidden. Discord URL enables the application link.

Publish: authenticate GitHub CLI, create public Laymer/olympus-mytikas repository, push this directory on main, and select GitHub Actions as the Pages source. The included workflow publishes site/ automatically. Expected URL: https://laymer.github.io/olympus-mytikas/ .

Artwork: built-in imagegen, original dark fantasy mountain summit above illuminated camps, bronze atmosphere, icy moonlight, negative space for text; no logos or characters. Saved in site/assets/summit.png. Original SVG summit crest. Typography uses local Georgia and Arial fallbacks; planned custom fonts are not bundled.
