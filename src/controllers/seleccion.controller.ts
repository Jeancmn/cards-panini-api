import { Request, Response } from 'express';
import { supabase } from '../config/supabase';
import { Seleccion } from '../models/seleccion.model';

// Obtener todas las selecciones
export const obtenerSelecciones = async (req: Request, res: Response): Promise<void> => {
  try {
    const { data, error } = await supabase
      .from('selecciones')
      .select('*')
      .order('pais', { ascending: true });

    if (error) {
      res.status(400).json({ error: error.message });
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
      error: 'Error al obtener las selecciones' 
    });
  }
};

// Obtener una selección por ID
export const obtenerSeleccionPorId = async (req: Request, res: Response): Promise<void> => {
  try {
    const { id } = req.params;

    const { data, error } = await supabase
      .from('selecciones')
      .select('*')
      .eq('id', id)
      .single();

    if (error) {
      res.status(404).json({ 
        success: false,
        error: 'Selección no encontrada' 
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
      error: 'Error al obtener la selección' 
    });
  }
};

// Crear una nueva selección
export const crearSeleccion = async (req: Request, res: Response): Promise<void> => {
  try {
    const nuevaSeleccion: Omit<Seleccion, 'id' | 'created_at' | 'updated_at'> = req.body;

    const { data, error } = await supabase
      .from('selecciones')
      .insert([nuevaSeleccion])
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
      message: 'Selección creada exitosamente'
    });
  } catch (error) {
    res.status(500).json({ 
      success: false,
      error: 'Error al crear la selección' 
    });
  }
};

// Actualizar una selección
export const actualizarSeleccion = async (req: Request, res: Response): Promise<void> => {
  try {
    const { id } = req.params;
    const datosActualizados = req.body;

    const { data, error } = await supabase
      .from('selecciones')
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
      message: 'Selección actualizada exitosamente'
    });
  } catch (error) {
    res.status(500).json({ 
      success: false,
      error: 'Error al actualizar la selección' 
    });
  }
};

// Eliminar una selección
export const eliminarSeleccion = async (req: Request, res: Response): Promise<void> => {
  try {
    const { id } = req.params;

    const { error } = await supabase
      .from('selecciones')
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
      message: 'Selección eliminada exitosamente'
    });
  } catch (error) {
    res.status(500).json({ 
      success: false,
      error: 'Error al eliminar la selección' 
    });
  }
};
