import 'dotenv/config';
import express from 'express';
import mountRoutes from './routes/index.js'


const app = express();
const port = 41511;

mountRoutes(app);
// Start the server
app.listen(port, () => {
  console.log(`started playdate at http://localhost:${port}`);

}); 
