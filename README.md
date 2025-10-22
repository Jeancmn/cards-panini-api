# API del Álbum Panini - Mundial 2026 🏆⚽

API RESTful desarrollada con Node.js, Express y TypeScript para gestionar el álbum digital Panini del Mundial de Fútbol 2026. Utiliza Supabase como base de datos.

## 🚀 Características

- ✅ Gestión completa de selecciones nacionales (CRUD)
- ✅ Gestión completa de jugadores (CRUD)
- ✅ Filtrado de jugadores por selección
- ✅ Estadísticas detalladas de jugadores (dribling, velocidad, regate, etc.)
- ✅ TypeScript para type-safety
- ✅ Supabase como base de datos

## 📋 Requisitos Previos

- Node.js (v18 o superior)
- npm o yarn
- Cuenta de Supabase

## 🛠️ Instalación

1. **Clonar el repositorio**

```bash
git clone <url-del-repositorio>
cd cards-panini-api
```

2. **Instalar dependencias**

```bash
npm install
```

3. **Configurar variables de entorno**

Copia el archivo `.env.example` a `.env` y configura tus credenciales de Supabase:

```bash
cp .env.example .env
```

Edita el archivo `.env`:

```env
PORT=3000
SUPABASE_URL=tu_supabase_url_aqui
SUPABASE_ANON_KEY=tu_supabase_anon_key_aqui
```

4. **Crear las tablas en Supabase**

Ejecuta el siguiente SQL en el SQL Editor de Supabase:

```sql
-- Crear tabla de selecciones
CREATE TABLE selecciones (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  pais VARCHAR(100) NOT NULL UNIQUE,
  confederacion VARCHAR(50) NOT NULL,
  campeonatos_mundiales INTEGER DEFAULT 0,
  escudo_url TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Crear tabla de jugadores
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

-- Crear índices para mejorar el rendimiento
CREATE INDEX idx_jugadores_seleccion ON jugadores(seleccion_id);
CREATE INDEX idx_selecciones_pais ON selecciones(pais);

-- Función para actualizar updated_at automáticamente
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Triggers para actualizar updated_at
CREATE TRIGGER update_selecciones_updated_at
  BEFORE UPDATE ON selecciones
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_jugadores_updated_at
  BEFORE UPDATE ON jugadores
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();
```

## 🎮 Uso

### Modo Desarrollo

```bash
npm run dev
```

### Modo Producción

```bash
npm run build
npm start
```

El servidor estará corriendo en `http://localhost:3000`

## 📚 Endpoints de la API

### Selecciones

#### Obtener todas las selecciones
```http
GET /api/selecciones
```

#### Obtener una selección por ID
```http
GET /api/selecciones/:id
```

#### Crear una nueva selección
```http
POST /api/selecciones
Content-Type: application/json

{
  "pais": "Argentina",
  "confederacion": "CONMEBOL",
  "campeonatos_mundiales": 3,
  "escudo_url": "https://ejemplo.com/argentina.png"
}
```

#### Actualizar una selección
```http
PUT /api/selecciones/:id
Content-Type: application/json

{
  "campeonatos_mundiales": 4
}
```

#### Eliminar una selección
```http
DELETE /api/selecciones/:id
```

### Jugadores

#### Obtener todos los jugadores
```http
GET /api/jugadores
```

#### Obtener todos los jugadores de una selección
```http
GET /api/jugadores?seleccion_id=:id
```

#### Obtener un jugador por ID
```http
GET /api/jugadores/:id
```

#### Crear un nuevo jugador
```http
POST /api/jugadores
Content-Type: application/json

{
  "nombre": "Lionel Messi",
  "edad": 37,
  "seleccion_id": "uuid-de-la-seleccion",
  "imagen_url": "https://ejemplo.com/messi.png",
  "dribling": 95,
  "velocidad": 85,
  "regate": 96,
  "tiro": 92,
  "defensa": 38,
  "pase": 91,
  "fisico": 65,
  "posicion": "Delantero",
  "numero_camiseta": 10
}
```

#### Actualizar un jugador
```http
PUT /api/jugadores/:id
Content-Type: application/json

{
  "edad": 38,
  "velocidad": 84
}
```

#### Eliminar un jugador
```http
DELETE /api/jugadores/:id
```

### Health Check
```http
GET /api/health
```

## 🗂️ Estructura del Proyecto

```
cards-panini-api/
├── src/
│   ├── config/
│   │   ├── config.ts          # Configuración general
│   │   └── supabase.ts        # Cliente de Supabase
│   ├── controllers/
│   │   ├── seleccion.controller.ts
│   │   └── jugador.controller.ts
│   ├── models/
│   │   ├── seleccion.model.ts
│   │   └── jugador.model.ts
│   ├── routes/
│   │   ├── index.ts
│   │   ├── seleccion.routes.ts
│   │   └── jugador.routes.ts
│   ├── app.ts                 # Configuración de Express
│   └── index.ts               # Punto de entrada
├── .env                       # Variables de entorno (no incluir en git)
├── .env.example               # Ejemplo de variables de entorno
├── .gitignore
├── package.json
├── tsconfig.json
└── README.md
```

## 🌍 Confederaciones Soportadas

- **CONCACAF** - Confederación de Norte, Centroamérica y el Caribe
- **CONMEBOL** - Confederación Sudamericana
- **UEFA** - Unión de Asociaciones Europeas de Fútbol
- **CAF** - Confederación Africana de Fútbol
- **AFC** - Confederación Asiática de Fútbol
- **OFC** - Confederación de Fútbol de Oceanía

## 📊 Estadísticas de Jugadores

Todas las estadísticas van de 0 a 100:

- **Dribling**: Habilidad con el balón
- **Velocidad**: Velocidad de carrera
- **Regate**: Capacidad de superar rivales
- **Tiro**: Precisión y potencia de disparo
- **Defensa**: Capacidad defensiva
- **Pase**: Precisión en los pases
- **Físico**: Fuerza y resistencia

## 🔧 Scripts Disponibles

- `npm run dev` - Inicia el servidor en modo desarrollo con hot-reload
- `npm run build` - Compila TypeScript a JavaScript
- `npm start` - Inicia el servidor en modo producción

## 🛡️ Tecnologías Utilizadas

- **Node.js** - Runtime de JavaScript
- **Express** - Framework web
- **TypeScript** - Superset tipado de JavaScript
- **Supabase** - Base de datos PostgreSQL en la nube
- **dotenv** - Gestión de variables de entorno
- **cors** - Middleware para habilitar CORS

## 📝 Notas Importantes

1. Asegúrate de configurar correctamente las variables de entorno antes de iniciar el servidor
2. Las estadísticas de los jugadores deben estar entre 0 y 100
3. Cada jugador debe estar asociado a una selección válida
4. Los escudos e imágenes deben ser URLs válidas

## 🤝 Contribución

Las contribuciones son bienvenidas. Por favor, abre un issue primero para discutir los cambios que te gustaría realizar.

## 📄 Licencia

ISC

---

Desarrollado para el Mundial de Fútbol 2026 ⚽🏆
