-- ========================================
-- ESQUEMA DE BASE DE DATOS PARA SUPABASE
-- API del Álbum Panini - Mundial 2026
-- ========================================

-- PASO 1: Crear tabla de selecciones
CREATE TABLE selecciones (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  pais VARCHAR(100) NOT NULL UNIQUE,
  confederacion VARCHAR(50) NOT NULL,
  campeonatos_mundiales INTEGER DEFAULT 0,
  escudo_url TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- PASO 2: Crear tabla de jugadores
CREATE TABLE jugadores (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  edad INTEGER NOT NULL,
  seleccion_id UUID NOT NULL REFERENCES selecciones(id) ON DELETE CASCADE,
  imagen_url TEXT NOT NULL,
  dribling INTEGER CHECK (dribling >= 0 AND dribling <= 100),
  velocidad INTEGER CHECK (velocidad >= 0 AND velocidad <= 100),
  regate INTEGER CHECK (regate >= 0 AND regate <= 100),
  tiro INTEGER CHECK (tiro >= 0 AND tiro <= 100),
  defensa INTEGER CHECK (defensa >= 0 AND defensa <= 100),
  pase INTEGER CHECK (pase >= 0 AND pase <= 100),
  fisico INTEGER CHECK (fisico >= 0 AND fisico <= 100),
  posicion VARCHAR(50),
  numero_camiseta INTEGER,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- PASO 3: Crear índices para mejorar el rendimiento
CREATE INDEX idx_jugadores_seleccion ON jugadores(seleccion_id);
CREATE INDEX idx_selecciones_pais ON selecciones(pais);
CREATE INDEX idx_jugadores_nombre ON jugadores(nombre);

-- PASO 4: Función para actualizar updated_at automáticamente
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- PASO 5: Triggers para actualizar updated_at automáticamente
CREATE TRIGGER update_selecciones_updated_at
  BEFORE UPDATE ON selecciones
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_jugadores_updated_at
  BEFORE UPDATE ON jugadores
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- PASO 6: Habilitar Row Level Security (RLS) - IMPORTANTE para Supabase
ALTER TABLE selecciones ENABLE ROW LEVEL SECURITY;
ALTER TABLE jugadores ENABLE ROW LEVEL SECURITY;

-- PASO 7: Crear políticas de acceso (estas permiten acceso público para leer/escribir)
-- ¡AJUSTA ESTAS POLÍTICAS SEGÚN TUS NECESIDADES DE SEGURIDAD!

-- Políticas para selecciones
CREATE POLICY "Permitir lectura pública de selecciones"
  ON selecciones FOR SELECT
  USING (true);

CREATE POLICY "Permitir inserción pública de selecciones"
  ON selecciones FOR INSERT
  WITH CHECK (true);

CREATE POLICY "Permitir actualización pública de selecciones"
  ON selecciones FOR UPDATE
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Permitir eliminación pública de selecciones"
  ON selecciones FOR DELETE
  USING (true);

-- Políticas para jugadores
CREATE POLICY "Permitir lectura pública de jugadores"
  ON jugadores FOR SELECT
  USING (true);

CREATE POLICY "Permitir inserción pública de jugadores"
  ON jugadores FOR INSERT
  WITH CHECK (true);

CREATE POLICY "Permitir actualización pública de jugadores"
  ON jugadores FOR UPDATE
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Permitir eliminación pública de jugadores"
  ON jugadores FOR DELETE
  USING (true);

-- ========================================
-- DATOS DE EJEMPLO (OPCIONAL)
-- ========================================

-- Insertar selecciones de ejemplo
INSERT INTO selecciones (pais, confederacion, campeonatos_mundiales, escudo_url) VALUES
('Argentina', 'CONMEBOL', 3, 'https://upload.wikimedia.org/wikipedia/commons/1/1a/Flag_of_Argentina.svg'),
('Brasil', 'CONMEBOL', 5, 'https://upload.wikimedia.org/wikipedia/commons/0/05/Flag_of_Brazil.svg'),
('México', 'CONCACAF', 0, 'https://upload.wikimedia.org/wikipedia/commons/f/fc/Flag_of_Mexico.svg'),
('Estados Unidos', 'CONCACAF', 0, 'https://upload.wikimedia.org/wikipedia/commons/a/a4/Flag_of_the_United_States.svg'),
('Canadá', 'CONCACAF', 0, 'https://upload.wikimedia.org/wikipedia/commons/d/d9/Flag_of_Canada.svg'),
('España', 'UEFA', 1, 'https://upload.wikimedia.org/wikipedia/commons/9/9a/Flag_of_Spain.svg'),
('Francia', 'UEFA', 2, 'https://upload.wikimedia.org/wikipedia/commons/c/c3/Flag_of_France.svg'),
('Alemania', 'UEFA', 4, 'https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg'),
('Inglaterra', 'UEFA', 1, 'https://upload.wikimedia.org/wikipedia/commons/b/be/Flag_of_England.svg'),
('Italia', 'UEFA', 4, 'https://upload.wikimedia.org/wikipedia/commons/0/03/Flag_of_Italy.svg'),
('Portugal', 'UEFA', 0, 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Flag_of_Portugal.svg'),
('Países Bajos', 'UEFA', 0, 'https://upload.wikimedia.org/wikipedia/commons/2/20/Flag_of_the_Netherlands.svg');

-- ========================================
-- VERIFICACIÓN
-- ========================================

-- Verificar que las tablas se crearon correctamente
SELECT 
  table_name, 
  column_name, 
  data_type 
FROM information_schema.columns 
WHERE table_name IN ('selecciones', 'jugadores')
ORDER BY table_name, ordinal_position;

-- Contar las selecciones insertadas
SELECT COUNT(*) as total_selecciones FROM selecciones;

-- Ver todas las selecciones
SELECT * FROM selecciones ORDER BY pais;
