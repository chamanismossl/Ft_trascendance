.PHONY: build down logs clone pull

REPOS = Login-data Chat-data Chat_BackEnd FrontEnd Login_BackEnd

BASE_URL = git@github.com:chamanismossl

build:
	docker-compose up --build

down:
	docker-compose down

logs:
	docker-compose logs
	
rm:
	rm -rf services

clone:
	@mkdir -p services
	@for repo in $(REPOS); do \
		if [ ! -d "services/$$repo" ]; then \
			echo "Clonando $$repo..."; \
			git clone $(BASE_URL)/$$repo.git services/$$repo; \
		else \
			echo "$$repo ya existe, omitiendo..."; \
		fi \
	done

pull:
	@for repo in $(REPOS); do \
		if [ -d "services/$$repo" ]; then \
			echo "Actualizando $$repo..."; \
			cd services/$$repo && git pull && cd -; \
		else \
			echo "$$repo no existe, ejecuta 'make clone' primero."; \
		fi \
	done