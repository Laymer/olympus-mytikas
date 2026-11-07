#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "$0")"
# Verify network and authentication before making any changes.
gh api user --jq .login
if ! gh repo view Laymer/olympus-mytikas --json nameWithOwner >/dev/null 2>&1; then
  gh repo create Laymer/olympus-mytikas --public --description 'Olympus Mytikas — The Hidden Summit. WoW Forever guild.'
fi
if [ ! -d .git ]; then git init -b main; fi
if ! git config user.name >/dev/null; then git config user.name Laymer; fi
if ! git config user.email >/dev/null; then git config user.email '15147427+Laymer@users.noreply.github.com'; fi
if ! git remote get-url origin >/dev/null 2>&1; then git remote add origin https://github.com/Laymer/olympus-mytikas.git; fi
gh auth setup-git
git add site .github README.md publish.sh
if ! git diff --cached --quiet; then git commit -m 'Publish Olympus Mytikas guild presentation'; fi
git push -u origin main
if gh api repos/Laymer/olympus-mytikas/pages >/dev/null 2>&1; then
  gh api --method PUT repos/Laymer/olympus-mytikas/pages -f build_type=workflow
else
  gh api --method POST repos/Laymer/olympus-mytikas/pages -f build_type=workflow
fi
gh workflow run pages.yml --ref main
printf '\nDeployment started. Follow progress:\n  gh run list --repo Laymer/olympus-mytikas\nExpected URL: https://laymer.github.io/olympus-mytikas/\n'
