.PHONEY: up
up:
	@source .env \
	&& source $(HOME)/.nvm/nvm.sh \
	&& nvm use \
	&& mix phx.server


.PHONEY: reset
reset:
	@source .env \
	&& MIX_ENV=dev mix ecto.drop \
	&& MIX_ENV=dev mix ecto.create \
	&& MIX_ENV=dev mix ecto.migrate \
	&& MIX_ENV=dev mix seed_data


.PHONEY: reset_db
reset_db:
	@source .env \
	&& MIX_ENV=dev mix ecto.drop \
	&& MIX_ENV=dev mix ecto.create \
	&& MIX_ENV=dev mix ecto.migrate \
	&& MIX_ENV=dev mix seed_data


.PHONEY: clean_db
clean_db:
	@source .env \
	&& MIX_ENV=dev mix ecto.drop \
	&& MIX_ENV=dev mix ecto.create \
	&& MIX_ENV=dev mix ecto.migrate \
	&& MIX_ENV=test mix ecto.drop \
	&& MIX_ENV=test mix ecto.create \
	&& MIX_ENV=test mix ecto.migrate


.PHONEY: migration
migration:
	@MIX_ENV=dev mix ecto.gen.migration


.PHONEY: migrate
migrate:
	@MIX_ENV=dev mix ecto.migrate


.PHONEY: iex
iex:
	@source .env \
	&& source $(HOME)/.nvm/nvm.sh \
	&& nvm use \
	&& iex -S mix


#####################################
# Deployment
#####################################


.PHONEY: build_release
build_release:
	@cd assets \
	&& npm install \
	&& npm run deploy \
	&& cd .. \
	&& mix phx.digest \
	&& MIX_ENV=prod mix release


.PHONEY: release_local
release_local:
	@source .env \
	&& source $(HOME)/.nvm/nvm.sh \
	&& nvm use \
	&& make build_release


.PHONEY: release_up
release_up:
	@source .env \
	&& MIX_ENV=prod APP_NAME=phoenix_feathers_demo_app PORT=4000 _build/prod/rel/phoenix_feathers_demo_app/bin/phoenix_feathers_demo_app start


.PHONEY: release_prod
release_prod:
	@source .prod.env \
	&& source $(HOME)/.nvm/nvm.sh \
	&& nvm use \
	&& make build_release


.PHONEY: deploy_prod
deploy_prod:
	@git push gigalixir master \
	&& gigalixir ps -a phoenix_feathers_demo


.PHONEY: build_and_deploy_prod
build_and_deploy_prod:
	@make release_prod \
	&& make deploy_prod \
	&& make prod_migrate


#####################################
# Gigalixir commands
#####################################


.PHONEY: prod_iex
prod_iex:
	@gigalixir ps:remote_console


.PHONEY: prod_logs
prod_logs:
	@gigalixir logs -a phoenix_feathers_demo


.PHONEY: prod_migrate
prod_migrate:
	@gigalixir ps:migrate
