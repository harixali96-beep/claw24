# 24/7 Telegram video bot (free, no card, no phone app)

Bot: @cliping_video_bot  •  engine: OpenClaw + whisper captions + SFX + fast cuts

## One manual step (GitHub needs it)
GitHub does not allow apps to create workflow files, so add it once:

1. Open: https://github.com/harixali96-beep/claw24/new/main?filename=.github/workflows/bot.yml
2. Open this in another tab, tap "Raw", select all, copy:
   https://raw.githubusercontent.com/harixali96-beep/claw24/main/workflow-to-add.yml
3. Paste into the file box, scroll down, press "Commit changes".
4. Then: Actions tab -> "bot" -> "Run workflow" to start it right now.

After that it runs by itself every 6 hours, each run about 5.5 hours, so the bot stays up
almost all the time (short gap between runs). Secrets are already set: TELEGRAM_BOT_TOKEN, GOOGLE_API_KEY.

## What runs
- ffmpeg + yt-dlp + faster-whisper are preinstalled on the runner
- editor bundle: https://base44.app/api/apps/6afc1d10013969ae13894a83/files/mp/public/6afc1d10013969ae13894a83/90df4d70d_claw24tar.gz
- bot state (sessions, memory, whisper model) is cached between runs

## Known limits
- YouTube blocks datacenter IPs (GitHub runners included). Send videos as a Telegram file (under 20MB)
  or a Google Drive link shared as "Anyone with the link".
- A 6-hour job cannot be extended; the next scheduled run continues automatically.
