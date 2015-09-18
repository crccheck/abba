# Useful ab options:
# -n  number of requests to perform
# -c  number of multiple requests to make at a time
test: test.gaussian test.uniform

test.gaussian:
	ab -n 2000 -c 10 -g gaussian.tsv http://localhost:8000/gaussian/1000/200

test.uniform:
	ab -n 2000 -c 10 -g uniform.tsv http://localhost:8000/uniform/750/1250

build:
	docker build -t crccheck/abba .

run:
	docker run --rm --name temp -p 8888:8000 crccheck/abba
