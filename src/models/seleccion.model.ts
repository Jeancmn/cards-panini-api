// Tipos para las confederaciones
export type Confederacion = 'CONCACAF' | 'CONMEBOL' | 'UEFA' | 'CAF' | 'AFC' | 'OFC';

// Interfaz para la Selección Nacional
export interface Seleccion {
  id: string;
  pais: string;
  confederacion: Confederacion;
  campeonatos_mundiales: number;
  escudo_url: string;
  created_at?: string;
  updated_at?: string;
}

// Interfaz para crear/actualizar una selección (sin id)
export interface CrearSeleccion {
  pais: string;
  confederacion: Confederacion;
  campeonatos_mundiales: number;
  escudo_url: string;
}
