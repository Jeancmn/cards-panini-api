import { Request, Response } from 'express';
import { supabase } from '../config/supabase';
import { Jugador } from '../models/jugador.model';

// Obtener todos los jugadores
export const obtenerJugadores = async (req: Request, res: Response): Promise<void> => {
  try {
    const { seleccion_id } = req.query;

    let query = supabase
      .from('jugadores')
      .select(`
        *,
        seleccion:selecciones(
          pais,
          escudo_url,
          confederacion
        )
      `)
      .order('nombre', { ascending: true });

    // Filtrar por selección si se proporciona el parámetro
    if (seleccion_id) {
      query = query.eq('seleccion_id', seleccion_id);
    }

    const { data, error } = await query;

    if (error) {
      res.status(400).json({ 
        success: false,
        error: error.message 
      });
      return;
    }

    res.status(200).json({
      success: true,
      data,
      count: data?.length || 0
    });
  } catch (error) {
    res.status(500).json({ 
      success: false,
      error: 'Error al obtener los jugadores' 
    });
  }
};

// Obtener un jugador por ID
export const obtenerJugadorPorId = async (req: Request, res: Response): Promise<void> => {
  try {
    const { id } = req.params;

    const { data, error } = await supabase
      .from('jugadores')
      .select(`
        *,
        seleccion:selecciones(
          pais,
          escudo_url,
          confederacion,
          campeonatos_mundiales
        )
      `)
      .eq('id', id)
      .single();

    if (error) {
      res.status(404).json({ 
        success: false,
        error: 'Jugador no encontrado' 
      });
      return;
    }

    res.status(200).json({
      success: true,
      data
    });
  } catch (error) {
    res.status(500).json({ 
      success: false,
      error: 'Error al obtener el jugador' 
    });
  }
};

// Obtener jugadores por selección
export const obtenerJugadoresPorSeleccion = async (req: Request, res: Response): Promise<void> => {
  try {
    const { seleccionId } = req.params;

    const { data, error } = await supabase
      .from('jugadores')
      .select('*')
      .eq('seleccion_id', seleccionId)
      .order('nombre', { ascending: true });

    if (error) {
      res.status(400).json({ 
        success: false,
        error: error.message 
      });
      return;
    }

    res.status(200).json({
      success: true,
      data,
      count: data?.length || 0
    });
  } catch (error) {
    res.status(500).json({ 
      success: false,
      error: 'Error al obtener los jugadores de la selección' 
    });
  }
};

// Crear un nuevo jugador
export const crearJugador = async (req: Request, res: Response): Promise<void> => {
  try {
    const nuevoJugador: Omit<Jugador, 'id' | 'created_at' | 'updated_at'> = req.body;

    const { data, error } = await supabase
      .from('jugadores')
      .insert([nuevoJugador])
      .select()
      .single();

    if (error) {
      res.status(400).json({ 
        success: false,
        error: error.message 
      });
      return;
    }

    res.status(201).json({
      success: true,
      data,
      message: 'Jugador creado exitosamente'
    });
  } catch (error) {
    res.status(500).json({ 
      success: false,
      error: 'Error al crear el jugador' 
    });
  }
};

// Actualizar un jugador
export const actualizarJugador = async (req: Request, res: Response): Promise<void> => {
  try {
    const { id } = req.params;
    const datosActualizados = req.body;

    const { data, error } = await supabase
      .from('jugadores')
      .update(datosActualizados)
      .eq('id', id)
      .select()
      .single();

    if (error) {
      res.status(400).json({ 
        success: false,
        error: error.message 
      });
      return;
    }

    res.status(200).json({
      success: true,
      data,
      message: 'Jugador actualizado exitosamente'
    });
  } catch (error) {
    res.status(500).json({ 
      success: false,
      error: 'Error al actualizar el jugador' 
    });
  }
};

// Eliminar un jugador
export const eliminarJugador = async (req: Request, res: Response): Promise<void> => {
  try {
    const { id } = req.params;

    const { error } = await supabase
      .from('jugadores')
      .delete()
      .eq('id', id);

    if (error) {
      res.status(400).json({ 
        success: false,
        error: error.message 
      });
      return;
    }

    res.status(200).json({
      success: true,
      message: 'Jugador eliminado exitosamente'
    });
  } catch (error) {
    res.status(500).json({ 
      success: false,
      error: 'Error al eliminar el jugador' 
    });
  }
};
