#!/bin/bash
# Install gold-trend for this user: commands, systemd units, desktop icons. Starts in MANUAL mode.
set -eu
REPO="$(cd "$(dirname "$0")" && pwd)"
mkdir -p ~/.local/bin ~/.config/systemd/user ~/Desktop
chmod +x "$REPO"/bin/*
for f in gold-trend gold-mode gold-run-now gold-notify; do ln -sfn "$REPO/bin/$f" ~/.local/bin/$f; done
cp "$REPO"/systemd/gold-report.{service,timer} ~/.config/systemd/user/
systemctl --user daemon-reload
for f in "$REPO"/desktop/*.desktop; do
    sed "s#/home/user#$HOME#g" "$f" > ~/Desktop/"$(basename "$f")"
    chmod +x ~/Desktop/"$(basename "$f")"
    gio set ~/Desktop/"$(basename "$f")" metadata::trusted true 2>/dev/null || true
done
[ -f ~/.config/gold-trend/run-mode ] || { mkdir -p ~/.config/gold-trend; echo manual > ~/.config/gold-trend/run-mode; }
echo "Installed. Mode: $(cat ~/.config/gold-trend/run-mode). Switch with: gold-mode nightly | manual"
