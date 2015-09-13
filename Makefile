# -n  number of requests to perform
# -c  number of multiple requests to make at a time
test: test.gaussian test.uniform

test.gaussian:
	ab -n 2000 -c 10 -g gaussian.tsv http://localhost:8000/gaussian/1000/200

test.uniform:
	ab -n 1000 -c 10 -g uniform.tsv http://localhost:8000/uniform/100/500

out:
	gnuplot standard.conf
	gnuplot new.conf
