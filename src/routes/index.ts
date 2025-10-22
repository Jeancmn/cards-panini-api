import { Router } from 'express';
import seleccionRoutes from './seleccion.routes';
import jugadorRoutes from './jugador.routes';

const router = Router();

// Rutas de selecciones
router.use('/selecciones', seleccionRoutes);

// Rutas de jugadores
router.use('/jugadores', jugadorRoutes);

// Ruta de health check
router.get('/health', (req, res) => {
  res.status(200).json({
    success: true,
    message: 'API del Álbum Panini Mundial 2026 está funcionando correctamente',
    timestamp: new Date().toISOString()
  });
});

export default router;
