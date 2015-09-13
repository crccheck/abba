# -n  number of requests to perform
# -c  number of multiple requests to make at a time
test:
	ab -n 200 -c 10 -g gaussian.tsv http://localhost:8000/gaussian/2000/200


out:
	gnuplot standard.conf
	gnuplot new.conf
