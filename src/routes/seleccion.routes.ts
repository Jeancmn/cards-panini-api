import { Router } from 'express';
import {
  obtenerSelecciones,
  obtenerSeleccionPorId,
  crearSeleccion,
  actualizarSeleccion,
  eliminarSeleccion
} from '../controllers/seleccion.controller';

const router = Router();

/**
 * @route   GET /api/selecciones
 * @desc    Obtener todas las selecciones
 * @access  Public
 */
router.get('/', obtenerSelecciones);

/**
 * @route   GET /api/selecciones/:id
 * @desc    Obtener una selección por ID
 * @access  Public
 */
router.get('/:id', obtenerSeleccionPorId);

/**
 * @route   POST /api/selecciones
 * @desc    Crear una nueva selección
 * @access  Public
 */
router.post('/', crearSeleccion);

/**
 * @route   PUT /api/selecciones/:id
 * @desc    Actualizar una selección
 * @access  Public
 */
router.put('/:id', actualizarSeleccion);

/**
 * @route   DELETE /api/selecciones/:id
 * @desc    Eliminar una selección
 * @access  Public
 */
router.delete('/:id', eliminarSeleccion);

export default router;
