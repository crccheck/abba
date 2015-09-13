abba
====

Apache Bench Benchmark Analysis

Apache Bench (`ab`) is a great tool for benchmarking http endpoints. But do you
really know how to use it? This project contains:

1. A dirt simple node server with endpoints that take a known amount of time to
   respond
2. TODO: how to interpret the results


Usage
-----

**Node**: TODO

**Docker**: TODO

**Python**: TODO


Addendum
--------

### ApacheBench tsv file
All numbers (everything except the first field) are in milliseconds. The most
useful fields are: `seconds` and `wait`.

* starttime - date time
* seconds   - epoch time
* ctime     - connection time
* dtime     - time from connection until the end
* ttime     - total time (including connection)
* wait      - time from sending the request to getting the first byte
