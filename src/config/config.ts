import dotenv from 'dotenv';

// Cargar variables de entorno
dotenv.config();

interface Config {
  port: number;
  supabase: {
    url: string;
    anonKey: string;
  };
}

export const config: Config = {
  port: parseInt(process.env.PORT || '3000', 10),
  supabase: {
    url: process.env.SUPABASE_URL || '',
    anonKey: process.env.SUPABASE_ANON_KEY || '',
  },
};

// Validar que las variables de entorno críticas estén presentes
if (!config.supabase.url || !config.supabase.anonKey) {
  console.error('Error: Faltan variables de entorno de Supabase. Por favor configura SUPABASE_URL y SUPABASE_ANON_KEY en tu archivo .env');
}
