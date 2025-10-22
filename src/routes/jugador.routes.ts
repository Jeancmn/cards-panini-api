import { Router } from 'express';
import {
  obtenerJugadores,
  obtenerJugadorPorId,
  obtenerJugadoresPorSeleccion,
  crearJugador,
  actualizarJugador,
  eliminarJugador
} from '../controllers/jugador.controller';

const router = Router();

/**
 * @route   GET /api/jugadores
 * @desc    Obtener todos los jugadores (con opción de filtrar por seleccion_id)
 * @access  Public
 * @query   seleccion_id (opcional)
 */
router.get('/', obtenerJugadores);

/**
 * @route   GET /api/jugadores/:id
 * @desc    Obtener un jugador por ID
 * @access  Public
 */
router.get('/:id', obtenerJugadorPorId);

/**
 * @route   GET /api/jugadores/seleccion/:seleccionId
 * @desc    Obtener todos los jugadores de una selección
 * @access  Public
 */
router.get('/seleccion/:seleccionId', obtenerJugadoresPorSeleccion);

/**
 * @route   POST /api/jugadores
 * @desc    Crear un nuevo jugador
 * @access  Public
 */
router.post('/', crearJugador);

/**
 * @route   PUT /api/jugadores/:id
 * @desc    Actualizar un jugador
 * @access  Public
 */
router.put('/:id', actualizarJugador);

/**
 * @route   DELETE /api/jugadores/:id
 * @desc    Eliminar un jugador
 * @access  Public
 */
router.delete('/:id', eliminarJugador);

export default router;
