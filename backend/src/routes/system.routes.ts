import { Router } from 'express';
import { checkHealth } from '../controllers/system.controller';

const router = Router();

// Define /health route
router.get('/', checkHealth);

export default router;
