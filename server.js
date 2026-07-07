import 'dotenv/config';
import express from 'express';
import pg from 'pg';

const { Client } = pg;

const app = express();
const client = new Client();

await client.connect();
//todo: add a case in case a custom port is defined in the environment variables.
const port = 41511;



console.log(`postgresdb running on ${process.env.PGHOST}`)
console.log(`postgresdb running on port ${process.env.PGPORT}`)
console.log(await client.query('SELECT * FROM cars;'))

// Respond to GET request on the root route
app.get('/', (req, res) => {
  res.send('GET request to the homepage');
});

// Respond to POST request on the root route
app.post('/', (req, res) => {
  res.send('POST request to the homepage');
});

// Respond to GET request on the /about route
app.get('/about', (req, res) => {
  res.send('About page');
});

// Catch all other routes
app.use((req, res) => {
    res.status(404).send("404 - Page not found");
});

// Start the server
app.listen(port, () => {
  console.log(`started playdate at http://localhost:${port}`);

}); 
