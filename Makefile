# -n  number of requests to perform
# -c  number of multiple requests to make at a time
test:
	ab -n 200 -c 10 -g gaussian.tsv http://localhost:8000/gaussian/2000/200


out:
	gnuplot -e "set terminal png; set output \"out.png\"; set key top left; \
	  set grid y; set ylabel \"response time (ms)\"; set xlabel \"request\"; \
	  plot \"gaussian.tsv\" using 9 with lines lw 3;"
