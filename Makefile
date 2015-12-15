help: ## Shows this help
	@echo "$$(grep -h '#\{2\}' $(MAKEFILE_LIST) | sed 's/: #\{2\} /	/' | column -t -s '	')"

install: ## Install the Pythonand Node packages you'll need
	npm install
	pip install -r requirements.txt

# Useful ab options:
# -n  number of requests to perform
# -c  number of multiple requests to make at a time
test: ## Run all tests
test: test.gaussian test.uniform

test.gaussian: ## Run Gaussian distribution test
	ab -n 2000 -c 10 -g gaussian.tsv http://localhost:8000/gaussian/1000/200

test.uniform: ## Run uniform distribution test
	ab -n 2000 -c 10 -g uniform.tsv http://localhost:8000/uniform/750/1250

test.fantana: ## Run uniform distribution test
	ab -n 2000 -c 10 -g fantana.tsv http://localhost:8000/fantana/

build: ## Build Docker image
	docker build -t crccheck/abba .

run: ## Run the Docker image in the background
run: stop
	docker run -d --name temp -p 8000:8000 crccheck/abba

stop: ## Stop the Docker container
	@docker rm -f temp 2>/dev/null || true
