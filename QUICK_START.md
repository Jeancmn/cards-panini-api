# Guía Rápida de Inicio

## Pasos para configurar y ejecutar el proyecto

### 1. Instalar dependencias

```bash
npm install
```

### 2. Configurar Supabase

1. Ve a [https://supabase.com](https://supabase.com) y crea una cuenta
2. Crea un nuevo proyecto
3. Ve a Project Settings > API
4. Copia tu `URL` y `anon/public key`

### 3. Configurar variables de entorno

Crea un archivo `.env` en la raíz del proyecto:

```bash
cp .env.example .env
```

Edita `.env` y agrega tus credenciales de Supabase:

```env
PORT=3000
SUPABASE_URL=https://tu-proyecto.supabase.co
SUPABASE_ANON_KEY=tu-anon-key-aqui
```

### 4. Crear las tablas en Supabase

1. Ve al SQL Editor en tu proyecto de Supabase
2. Copia y pega el contenido del archivo `README.md` (sección "Crear las tablas en Supabase")
3. Ejecuta el SQL

### 5. (Opcional) Insertar datos de ejemplo

1. Ve al SQL Editor
2. Ejecuta las queries de `supabase-datos-ejemplo.sql` para insertar selecciones
3. Obtén los IDs de las selecciones:
   ```sql
   SELECT id, pais FROM selecciones;
   ```
4. Reemplaza los placeholders en los inserts de jugadores con los IDs reales

### 6. Iniciar el servidor

```bash
npm run dev
```

El servidor estará corriendo en `http://localhost:3000`

### 7. Probar la API

Puedes usar Thunder Client, Postman, o simplemente tu navegador:

- `http://localhost:3000` - Página de bienvenida
- `http://localhost:3000/api/health` - Health check
- `http://localhost:3000/api/selecciones` - Ver todas las selecciones
- `http://localhost:3000/api/jugadores` - Ver todos los jugadores

## Ejemplos de uso con curl

### Crear una selección
```bash
curl -X POST http://localhost:3000/api/selecciones \
  -H "Content-Type: application/json" \
  -d '{
    "pais": "Colombia",
    "confederacion": "CONMEBOL",
    "campeonatos_mundiales": 0,
    "escudo_url": "https://ejemplo.com/colombia.png"
  }'
```

### Crear un jugador
```bash
curl -X POST http://localhost:3000/api/jugadores \
  -H "Content-Type: application/json" \
  -d '{
    "nombre": "James Rodríguez",
    "edad": 32,
    "seleccion_id": "uuid-de-colombia",
    "imagen_url": "https://ejemplo.com/james.jpg",
    "dribling": 87,
    "velocidad": 78,
    "regate": 85,
    "tiro": 88,
    "defensa": 42,
    "pase": 89,
    "fisico": 70,
    "posicion": "Mediocampista",
    "numero_camiseta": 10
  }'
```

### Obtener jugadores de una selección específica
```bash
curl http://localhost:3000/api/jugadores?seleccion_id=uuid-de-la-seleccion
```

## ¡Listo! 🎉

Tu API del Álbum Panini está funcionando. Ahora puedes conectarla con tu frontend o aplicación móvil.
