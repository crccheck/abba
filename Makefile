# -n  number of requests to perform
# -c  number of multiple requests to make at a time
test:
	ab -n 1000 -c 10 http://localhost:8000/gaussian/2000/200
