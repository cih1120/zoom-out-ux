#!/bin/sh
# Refuses content that should never be in a public repo.
# Optional: a private denylist of words (one per line, case-insensitive) in
# $OSS_DENYLIST or ~/.config/oss-denylist.txt. The list itself stays outside the repo.
set -u
cd "$(dirname "$0")/.." || exit 2
DENY="${OSS_DENYLIST:-$HOME/.config/oss-denylist.txt}"
fail=0
files=$(git ls-files 2>/dev/null; git ls-files --others --exclude-standard 2>/dev/null)
files=$(printf '%s\n' "$files" | sort -u)

bin=$(printf '%s\n' "$files" | grep -Ei '\.(png|jpe?g|gif|webp|pdf|html?)$')
if [ -n "$bin" ]; then echo "images/html present:"; echo "$bin"; fail=1; fi

mails=$(printf '%s\n' "$files" | tr '\n' '\0' | xargs -0 grep -nIE '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}' 2>/dev/null | grep -v 'users\.noreply\.github\.com')
if [ -n "$mails" ]; then echo "e-mail addresses:"; echo "$mails"; fail=1; fi

homepat='/Us''ers/|/ho''me/|C:\\\\Us''ers\\\\'
paths=$(printf '%s\n' "$files" | tr '\n' '\0' | xargs -0 grep -nIE "$homepat" 2>/dev/null)
if [ -n "$paths" ]; then echo "absolute home paths:"; echo "$paths"; fail=1; fi

if [ -f "$DENY" ]; then
  hits=$(printf '%s\n' "$files" | tr '\n' '\0' | xargs -0 grep -nIiwF -f "$DENY" 2>/dev/null)
  if [ -n "$hits" ]; then echo "denylist hits:"; echo "$hits"; fail=1; fi
else
  echo "note: no denylist at $DENY (set OSS_DENYLIST to use one)"
fi

if [ $fail -eq 0 ]; then echo "check-public: clean"; fi
exit $fail
