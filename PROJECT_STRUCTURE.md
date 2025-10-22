# 🏆 API del Álbum Panini - Mundial 2026

## 📁 Estructura del Proyecto

```
cards-panini-api/
│
├── 📄 package.json                    # Dependencias y scripts
├── 📄 tsconfig.json                   # Configuración de TypeScript
├── 📄 .env                            # Variables de entorno (CONFIGÚRALO!)
├── 📄 .env.example                    # Ejemplo de variables de entorno
├── 📄 .gitignore                      # Archivos a ignorar en git
│
├── 📚 README.md                       # Documentación principal
├── 📚 QUICK_START.md                  # Guía rápida de inicio
├── 📚 SUPABASE_SETUP.md              # Guía detallada de Supabase
├── 📚 PROJECT_STRUCTURE.md           # Este archivo
│
├── 🗄️ supabase-schema.sql            # Schema completo de la BD
├── 🗄️ supabase-datos-ejemplo.sql     # Datos de ejemplo
├── 🗄️ supabase-jugadores-ejemplo.sql # Jugadores de ejemplo
│
├── 🧪 api-tests.rest                  # Tests de la API (REST Client)
│
└── 📂 src/                            # Código fuente
    ├── 📄 index.ts                    # Punto de entrada del servidor
    ├── 📄 app.ts                      # Configuración de Express
    │
    ├── 📂 config/                     # Configuraciones
    │   ├── config.ts                  # Variables de entorno
    │   └── supabase.ts                # Cliente de Supabase
    │
    ├── 📂 models/                     # Modelos de datos (TypeScript)
    │   ├── seleccion.model.ts         # Interface de Selección
    │   └── jugador.model.ts           # Interface de Jugador
    │
    ├── 📂 controllers/                # Lógica de negocio
    │   ├── seleccion.controller.ts    # Controlador de selecciones
    │   └── jugador.controller.ts      # Controlador de jugadores
    │
    └── 📂 routes/                     # Definición de rutas
        ├── index.ts                   # Router principal
        ├── seleccion.routes.ts        # Rutas de selecciones
        └── jugador.routes.ts          # Rutas de jugadores
```

## 🚀 Flujo de la Aplicación

```
Cliente (HTTP Request)
    ↓
Express Server (app.ts)
    ↓
Routes (seleccion.routes.ts / jugador.routes.ts)
    ↓
Controllers (seleccion.controller.ts / jugador.controller.ts)
    ↓
Supabase Client (supabase.ts)
    ↓
Supabase Database (PostgreSQL)
    ↓
Response (JSON)
```

## 📋 Modelos de Datos

### Selección
```typescript
{
  id: string (UUID)
  pais: string
  confederacion: 'CONCACAF' | 'CONMEBOL' | 'UEFA' | 'CAF' | 'AFC' | 'OFC'
  campeonatos_mundiales: number
  escudo_url: string
  created_at: string (timestamp)
  updated_at: string (timestamp)
}
```

### Jugador
```typescript
{
  id: string (UUID)
  nombre: string
  edad: number
  seleccion_id: string (UUID - FK)
  imagen_url: string
  dribling: number (0-100)
  velocidad: number (0-100)
  regate: number (0-100)
  tiro: number (0-100)
  defensa: number (0-100)
  pase: number (0-100)
  fisico: number (0-100)
  posicion?: string
  numero_camiseta?: number
  created_at: string (timestamp)
  updated_at: string (timestamp)
}
```

## 🔌 Endpoints de la API

### Raíz
- `GET /` - Bienvenida y endpoints disponibles
- `GET /api/health` - Health check

### Selecciones
- `GET /api/selecciones` - Listar todas las selecciones
- `GET /api/selecciones/:id` - Obtener una selección por ID
- `POST /api/selecciones` - Crear nueva selección
- `PUT /api/selecciones/:id` - Actualizar selección
- `DELETE /api/selecciones/:id` - Eliminar selección

### Jugadores
- `GET /api/jugadores` - Listar todos los jugadores
- `GET /api/jugadores?seleccion_id=:id` - Filtrar por selección
- `GET /api/jugadores/:id` - Obtener un jugador por ID
- `POST /api/jugadores` - Crear nuevo jugador
- `PUT /api/jugadores/:id` - Actualizar jugador
- `DELETE /api/jugadores/:id` - Eliminar jugador

## 🛠️ Scripts Disponibles

```bash
npm install          # Instalar dependencias
npm run dev         # Modo desarrollo (con hot-reload)
npm run build       # Compilar TypeScript a JavaScript
npm start           # Modo producción
```

## 🔐 Variables de Entorno

Archivo `.env`:
```env
PORT=3000
SUPABASE_URL=https://xxxxxxxxxxxxx.supabase.co
SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

## 📦 Dependencias Principales

### Producción
- `express` - Framework web
- `@supabase/supabase-js` - Cliente de Supabase
- `dotenv` - Variables de entorno
- `cors` - Middleware CORS

### Desarrollo
- `typescript` - Lenguaje tipado
- `ts-node` - Ejecutar TypeScript directamente
- `nodemon` - Hot-reload en desarrollo
- `@types/express` - Tipos de Express
- `@types/node` - Tipos de Node.js
- `@types/cors` - Tipos de CORS

## 🎯 Características Implementadas

✅ CRUD completo de selecciones nacionales
✅ CRUD completo de jugadores
✅ Relación entre jugadores y selecciones (Foreign Key)
✅ Filtrado de jugadores por selección
✅ Validaciones de estadísticas (0-100)
✅ TypeScript para type-safety
✅ Configuración de CORS
✅ Manejo de errores centralizado
✅ Logging de requests
✅ Health check endpoint
✅ Documentación completa
✅ Datos de ejemplo
✅ Tests con REST Client

## 🔄 Próximos Pasos Recomendados

1. **Autenticación**: Implementar JWT o Supabase Auth
2. **Validaciones**: Agregar middleware de validación (Joi, Zod)
3. **Paginación**: Implementar paginación en los endpoints de listado
4. **Búsqueda**: Agregar búsqueda por nombre de jugador/selección
5. **Estadísticas**: Endpoint para estadísticas generales
6. **Upload de imágenes**: Integrar Supabase Storage para subir imágenes
7. **Tests**: Agregar tests unitarios e integración (Jest, Supertest)
8. **Documentación API**: Implementar Swagger/OpenAPI
9. **Rate Limiting**: Limitar requests por IP
10. **Caché**: Implementar Redis para caché

## 🌐 Despliegue

### Opciones recomendadas:
- **Railway** - Deploy automático desde GitHub
- **Vercel** - Excelente para Node.js
- **Render** - Free tier disponible
- **Heroku** - Clásico y confiable
- **AWS/Azure/GCP** - Para producción escalable

## 📊 Base de Datos

- **Proveedor**: Supabase (PostgreSQL)
- **Tablas**: 2 (selecciones, jugadores)
- **Relaciones**: 1:N (Una selección tiene muchos jugadores)
- **Índices**: Optimizados para queries frecuentes
- **Triggers**: Auto-update de timestamps
- **RLS**: Configurado para acceso público

## 🤝 Contribuir

1. Fork el proyecto
2. Crea una rama (`git checkout -b feature/nueva-funcionalidad`)
3. Commit tus cambios (`git commit -m 'Agregar nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Abre un Pull Request

## 📝 Notas Importantes

- Las estadísticas de jugadores DEBEN estar entre 0 y 100
- Cada jugador DEBE tener una selección válida (foreign key)
- Las URLs de imágenes deben ser válidas
- El archivo `.env` NO debe subirse a git
- Configura RLS en Supabase según tus necesidades de seguridad

## 🆘 Soporte

Si tienes problemas:
1. Revisa `QUICK_START.md` para configuración inicial
2. Revisa `SUPABASE_SETUP.md` para problemas de BD
3. Revisa los logs del servidor
4. Verifica las variables de entorno en `.env`

---

Desarrollado con para el Mundial de Fútbol 2026 🏆⚽
