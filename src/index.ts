import app from './app';
import { config } from './config/config';
import { verificarConexion } from './config/supabase';

// Función para iniciar el servidor
const iniciarServidor = async () => {
  try {
    // Verificar conexión con Supabase
    await verificarConexion();

    // Iniciar servidor
    app.listen(config.port, () => {
      console.log(`
╔════════════════════════════════════════════════════════╗
║                                                        ║
║   🏆 API Álbum Panini - Mundial 2026 🏆               ║
║                                                        ║
║   Servidor corriendo en:                              ║
║   http://localhost:${config.port}                           ║
║                                                        ║
║   Endpoints disponibles:                              ║
║   - GET    /api/selecciones                           ║
║   - GET    /api/selecciones/:id                       ║
║   - POST   /api/selecciones                           ║
║   - PUT    /api/selecciones/:id                       ║
║   - DELETE /api/selecciones/:id                       ║
║                                                        ║
║   - GET    /api/jugadores                             ║
║   - GET    /api/jugadores/:id                         ║
║   - GET    /api/jugadores?seleccion_id=:id            ║
║   - POST   /api/jugadores                             ║
║   - PUT    /api/jugadores/:id                         ║
║   - DELETE /api/jugadores/:id                         ║
║                                                        ║
║   - GET    /api/health                                ║
║                                                        ║
╚════════════════════════════════════════════════════════╝
      `);
    });
  } catch (error) {
    console.error('❌ Error al iniciar el servidor:', error);
    process.exit(1);
  }
};

// Iniciar el servidor
iniciarServidor();
