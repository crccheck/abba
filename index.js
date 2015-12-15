// To see what generators are available, see:
// https://github.com/robbrit/randgen/blob/master/lib/randgen.js
const randgen = require('randgen');
const express = require('express');

const app = express();


app.get('/', (req, res) => {
  // TODO send a list of what resources are available
  res.send('moo');
});

app.get('/uniform/:min?/:max?', (req, res) => {
  const min = req.params.min || 100;
  const max = req.params.max || min + 200;

  const delay = randgen.runif(parseFloat(min), parseFloat(max));
  setTimeout(function () {
    // TODO if accepts is json, return json
    res.send(`Uniform min: ${min} max: ${max} delay: ${delay}`);
  }, delay);
});

app.get('/gaussian/:mean?/:stdev?', (req, res) => {
  const mean = req.params.mean || 100;
  const stdev = req.params.stdev || 10;

  const delay = Math.max(0, randgen.rnorm(parseFloat(mean), parseFloat(stdev)));
  setTimeout(function () {
    // TODO if accepts is json, return json
    res.send(`Gaussian mean: ${mean} standard deviation: ${stdev} delay: ${delay}`);
  }, delay);
});

app.get('/fantana/:target?/:min?/:max?', (req, res) => {
  const target = req.params.target || 100;
  const min = req.params.min || 200;
  const max = req.params.max || 300;

  var delay, msg;
  if (Math.random() < 0.6) {
    delay = target;
    msg = 'Works every time';
  } else {
    delay = Math.max(0, randgen.runif(parseFloat(min), parseFloat(max)));
    msg = "I don't know what went wrong";
  }
  setTimeout(function () {
    res.send(msg);
  }, delay);
});

const server = app.listen(8000, () => {
  console.log(`Server is online; listening on port ${server.address().port}`);
});
