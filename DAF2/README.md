# A2 Wortliste Goethe — German Anki Flashcard Deck

German A2 vocabulary deck based on the Goethe Institute A2 wordlist.

- **1214 notes** (2428 cards — DE→EN and EN→DE)
- **TTS audio** generated with edge-tts using 6 de-DE voices
- Audio for words, sentences (up to 4 per card)

## Source

Original deck: [A2 Wortliste Goethe](https://ankiweb.net/shared/info/1386119660)

## Build

Requires [AFAS](https://github.com/oprobiu/AFAS) tools.

```bash
pip install -r requirements.txt  # from AFAS
python3 scripts/validate.py --config data/deck.json --tools-dir /path/to/AFAS
python3 scripts/build_apkg.py --config data/deck.json --tools-dir /path/to/AFAS
```

Output: `build/A2_Wortliste_Goethe.apkg`

## License

AGPL-3.0
