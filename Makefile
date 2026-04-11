CONFIGS = data/ro/deck.json data/en/deck.json
TOOLS = .tools/AFAS

bootstrap:
	bash bootstrap.sh

build: bootstrap
	@for cfg in $(CONFIGS); do \
		echo "=== Building $$cfg ==="; \
		python3 $(TOOLS)/scripts/build_apkg.py --config $$cfg --tools-dir $(TOOLS); \
	done

build-ro: bootstrap
	python3 $(TOOLS)/scripts/build_apkg.py --config data/ro/deck.json --tools-dir $(TOOLS)

build-en: bootstrap
	python3 $(TOOLS)/scripts/build_apkg.py --config data/en/deck.json --tools-dir $(TOOLS)

tts: bootstrap
	@for cfg in $(CONFIGS); do \
		python3 $(TOOLS)/scripts/regenerate_tts.py --config $$cfg --write-csv; \
	done

validate: bootstrap
	@for cfg in $(CONFIGS); do \
		echo "=== Validating $$cfg ==="; \
		python3 $(TOOLS)/scripts/validate.py --config $$cfg --tools-dir $(TOOLS); \
	done

clean:
	rm -rf build/ .tools/
