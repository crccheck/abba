const express = require('express');
const app = express();


app.get('/', (req, res) => {
  res.send('moo');
});

var server = app.listen(8000, () => {
  console.log(server.address());
});
