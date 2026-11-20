#!/usr/bin/env bash
# Runs on every bot start. One-time: confirm in Telegram that the bot is online with the new model chain.
set -u
MARK="$CLAW/state/.online-notified"
[ -f "$MARK" ] && exit 0
[ -z "${TELEGRAM_BOT_TOKEN:-}" ] && exit 0
setsid nohup bash -c '
  for i in $(seq 1 30); do
    if openclaw gateway health >/dev/null 2>&1; then
      M=$(python3 -c "import json,os;print(json.load(open(os.environ[\"OPENCLAW_CONFIG_PATH\"]))[\"agents\"][\"defaults\"][\"model\"][\"primary\"])" 2>/dev/null || echo unknown)
      curl -s -m 20 "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" \
        -d chat_id=7473905437 \
        --data-urlencode "text=Bot 24/7 online ✅  Model chain: ${M} + 6 fallbacks (kilo, nemotron, ling, gemini). Captions 520 styles, SFX 110, skills 210 ready." >/dev/null
      touch "$MARK"
      break
    fi
    sleep 6
  done' >/dev/null 2>&1 < /dev/null &
exit 0
