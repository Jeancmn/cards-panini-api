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

En el SQL Editor de Supabase, ejecuta los siguientes scripts en orden:

**📋 Script 1: `supabase-schema.sql` (REQUERIDO)**

Este script crea la estructura completa de la base de datos:
- ✅ Tablas `selecciones` y `jugadores`
- ✅ Índices para optimizar consultas
- ✅ Triggers para actualizar fechas automáticamente
- ✅ Políticas de seguridad (Row Level Security)
- ✅ 12 selecciones de ejemplo (Argentina, Brasil, México, Francia, etc.)

**Cómo ejecutar:**
1. Abre el archivo `supabase-schema.sql`
2. Copia TODO su contenido
3. Pégalo en el SQL Editor de Supabase
4. Haz clic en **RUN**

---

**⚽ Script 2: `supabase-insertar-jugadores.sql` (OPCIONAL)**

Este script inserta 60+ jugadores de ejemplo con sus estadísticas:
- Incluye estrellas como Messi, Neymar, Mbappé, Cristiano Ronaldo, Harry Kane, etc.
- Fotos reales de Wikipedia para los jugadores principales
- Estadísticas completas (dribling, velocidad, regate, tiro, etc.)

**Cómo ejecutar:**
1. Abre el archivo `supabase-insertar-jugadores.sql`
2. Copia TODO su contenido
3. Pégalo en el SQL Editor de Supabase
4. Haz clic en **RUN**

---

**🔍 Verificar la instalación:**

Ejecuta estos queries en Supabase para confirmar:

```sql
-- Ver total de selecciones (debe ser 12)
SELECT COUNT(*) FROM selecciones;

-- Ver total de jugadores (debe ser ~60 si ejecutaste el Script 2)
SELECT COUNT(*) FROM jugadores;

-- Ver jugadores por selección
SELECT s.pais, COUNT(j.id) as total_jugadores
FROM selecciones s
LEFT JOIN jugadores j ON s.id = j.seleccion_id
GROUP BY s.pais
ORDER BY total_jugadores DESC;
```

**💡 Nota:** También puedes consultar `SUPABASE_SETUP.md` para una guía detallada paso a paso.

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
