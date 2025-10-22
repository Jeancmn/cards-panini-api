import { createClient } from '@supabase/supabase-js';
import { config } from './config';

// Crear cliente de Supabase
export const supabase = createClient(
  config.supabase.url,
  config.supabase.anonKey
);

// Función para verificar la conexión
export const verificarConexion = async (): Promise<boolean> => {
  try {
    const { error } = await supabase.from('selecciones').select('count', { count: 'exact', head: true });
    if (error) {
      console.error('Error al conectar con Supabase:', error.message);
      return false;
    }
    console.log('✅ Conexión con Supabase establecida correctamente');
    return true;
  } catch (error) {
    console.error('Error al verificar conexión con Supabase:', error);
    return false;
  }
};
