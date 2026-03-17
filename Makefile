bootstrap:
	bash bootstrap.sh

build: bootstrap
	python3 .tools/AFAS/scripts/build_apkg.py --config data/deck.json --tools-dir .tools/AFAS

tts: bootstrap
	python3 .tools/AFAS/scripts/regenerate_tts.py --config data/deck.json --write-csv

validate: bootstrap
	python3 .tools/AFAS/scripts/validate.py --config data/deck.json --tools-dir .tools/AFAS

clean:
	rm -rf build/ .tools/
