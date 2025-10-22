import express, { Application, Request, Response, NextFunction } from 'express';
import cors from 'cors';
import routes from './routes';

// Crear aplicación Express
const app: Application = express();

// Middlewares
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Logger middleware
app.use((req: Request, res: Response, next: NextFunction) => {
  console.log(`${req.method} ${req.path}`);
  next();
});

// Rutas principales
app.use('/api', routes);

// Ruta raíz
app.get('/', (req: Request, res: Response) => {
  res.json({
    success: true,
    message: '🏆 Bienvenido al API del Álbum Panini - Mundial 2026',
    version: '1.0.0',
    endpoints: {
      selecciones: '/api/selecciones',
      jugadores: '/api/jugadores',
      health: '/api/health'
    }
  });
});

// Manejo de rutas no encontradas
app.use((req: Request, res: Response) => {
  res.status(404).json({
    success: false,
    message: 'Ruta no encontrada'
  });
});

// Manejo de errores
app.use((err: Error, req: Request, res: Response, next: NextFunction) => {
  console.error(err.stack);
  res.status(500).json({
    success: false,
    message: 'Error interno del servidor',
    error: process.env.NODE_ENV === 'development' ? err.message : undefined
  });
});

export default app;
