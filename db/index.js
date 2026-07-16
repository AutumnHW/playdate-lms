import pg from 'pg';
const { Client } = pg;
const client = new Client();

await client.connect();
//todo: add a case in case a custom port is defined in the environment variables.



console.log(`postgresdb running on ${process.env.PGHOST}`)
console.log(`postgresdb running on port ${process.env.PGPORT}`)
console.log(await client.query('SELECT * FROM cars;'))