.PHONY: build down logs clone pull clean-db

REPOS = Chat_BackEnd FrontEnd Login_BackEnd Notification_BackEnd User_BackEnd Match_BackEnd

BASE_URL = git@github.com:chamanismossl

dev:
	BUILD_TARGET=dev FRONT_PORT=3000 DEV_VOLUME=./services/FrontEnd/FrontEnd docker-compose up --build

prod:
	BUILD_TARGET=prod FRONT_PORT=3000 docker-compose up --build --detach

down:
	docker-compose down

logs:
	docker-compose logs -f
	
rm:
	rm -rf services

clone:
	@mkdir -p services
	@for repo in $(REPOS); do \
		if [ ! -d "services/$$repo" ]; then \
			case $$repo in \
				Chat_BackEnd) BRANCH=dev ;; \
				Login_BackEnd) BRANCH=dev ;; \
				*) BRANCH=main ;; \
			esac; \
			echo "Clonando $$repo desde rama $$BRANCH..."; \
			git clone --branch $$BRANCH --single-branch $(BASE_URL)/$$repo.git services/$$repo; \
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

clean-db:
	find . -type f -name '*.db' -exec rm -f {} +