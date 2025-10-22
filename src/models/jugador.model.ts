// Interfaz para las estadísticas del jugador
export interface EstadisticasJugador {
  dribling: number;  // 0-100
  velocidad: number; // 0-100
  regate: number;    // 0-100
  tiro: number;      // 0-100
  defensa: number;   // 0-100
  pase: number;      // 0-100
  fisico: number;    // 0-100
}

// Interfaz para el Jugador
export interface Jugador {
  id: string;
  nombre: string;
  edad: number;
  seleccion_id: string;
  imagen_url: string;
  dribling: number;
  velocidad: number;
  regate: number;
  tiro: number;
  defensa: number;
  pase: number;
  fisico: number;
  posicion?: string; // Ej: Delantero, Mediocampista, Defensa, Portero
  numero_camiseta?: number;
  created_at?: string;
  updated_at?: string;
}

// Interfaz para crear/actualizar un jugador (sin id)
export interface CrearJugador {
  nombre: string;
  edad: number;
  seleccion_id: string;
  imagen_url: string;
  dribling: number;
  velocidad: number;
  regate: number;
  tiro: number;
  defensa: number;
  pase: number;
  fisico: number;
  posicion?: string;
  numero_camiseta?: number;
}

// Interfaz para jugador con datos de la selección
export interface JugadorConSeleccion extends Jugador {
  seleccion?: {
    pais: string;
    escudo_url: string;
    confederacion: string;
  };
}
