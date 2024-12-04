import express from 'express';
import dotenv from 'dotenv';
import systemRoutes from './routes/system.routes';
import db from './config/db';

// Load environment variables
dotenv.config();

const app = express();
const PORT = process.env.PORT || 5001;

// Middleware
app.use(express.json());

// Routes
app.use('/health', systemRoutes);

// Database Connection
db.authenticate()
  .then(() => console.log('Database connected'))
  .catch((err) => console.error('Database connection failed:', err));

// Start Server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
