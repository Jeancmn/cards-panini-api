# 📘 Guía Detallada de Configuración de Supabase

Esta guía te llevará paso a paso para configurar Supabase para tu API del Álbum Panini.

## 🚀 Paso 1: Crear Cuenta y Proyecto en Supabase

1. Ve a [https://supabase.com](https://supabase.com)
2. Haz clic en **"Start your project"**
3. Inicia sesión con GitHub, Google, o tu correo
4. Haz clic en **"New Project"**
5. Completa la información:
   - **Name**: `panini-mundial-2026` (o el nombre que prefieras)
   - **Database Password**: Crea una contraseña segura (guárdala bien)
   - **Region**: Selecciona la región más cercana a tus usuarios
   - **Pricing Plan**: Selecciona "Free" para comenzar
6. Haz clic en **"Create new project"**
7. Espera unos 2 minutos mientras Supabase configura tu base de datos

## 🔑 Paso 2: Obtener las Credenciales

1. Una vez que tu proyecto esté listo, ve a **"Settings"** (ícono de engranaje en el menú lateral)
2. Haz clic en **"API"** en el submenú
3. Encontrarás dos valores importantes:
   - **Project URL**: Se ve algo como `https://xxxxxxxxxxxxx.supabase.co`
   - **Project API keys** > **anon/public**: Es una clave larga que empieza con `eyJ...`

4. Copia estos valores y pégalos en tu archivo `.env`:

```env
PORT=3000
SUPABASE_URL=https://xxxxxxxxxxxxx.supabase.co
SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

## 🗄️ Paso 3: Crear las Tablas en Supabase

1. En el menú lateral de Supabase, haz clic en **"SQL Editor"**
2. Haz clic en **"New query"**
3. Abre el archivo `supabase-schema.sql` de tu proyecto
4. Copia **TODO** el contenido del archivo
5. Pégalo en el SQL Editor de Supabase
6. Haz clic en **"Run"** (o presiona Ctrl/Cmd + Enter)
7. Deberías ver el mensaje: ✅ **Success. No rows returned**

## ✅ Paso 4: Verificar las Tablas

1. En el menú lateral, haz clic en **"Table Editor"**
2. Deberías ver dos tablas:
   - 📋 **selecciones**
   - ⚽ **jugadores**
3. Haz clic en cada una para ver su estructura

### Estructura de la tabla `selecciones`:
- `id` (uuid) - Primary Key
- `pais` (varchar)
- `confederacion` (varchar)
- `campeonatos_mundiales` (integer)
- `escudo_url` (text)
- `created_at` (timestamp)
- `updated_at` (timestamp)

### Estructura de la tabla `jugadores`:
- `id` (uuid) - Primary Key
- `nombre` (varchar)
- `edad` (integer)
- `seleccion_id` (uuid) - Foreign Key → selecciones(id)
- `imagen_url` (text)
- `dribling` (integer)
- `velocidad` (integer)
- `regate` (integer)
- `tiro` (integer)
- `defensa` (integer)
- `pase` (integer)
- `fisico` (integer)
- `posicion` (varchar)
- `numero_camiseta` (integer)
- `created_at` (timestamp)
- `updated_at` (timestamp)

## 📊 Paso 5: Verificar los Datos de Ejemplo (Opcional)

Si ejecutaste el script completo `supabase-schema.sql`, ya deberías tener algunas selecciones insertadas.

1. Ve a **"Table Editor"**
2. Haz clic en **"selecciones"**
3. Deberías ver 12 selecciones insertadas (Argentina, Brasil, México, etc.)

Si quieres ver los datos en SQL:
1. Ve a **"SQL Editor"**
2. Ejecuta: `SELECT * FROM selecciones ORDER BY pais;`

## 🔒 Paso 6: Configurar Políticas de Seguridad (RLS)

El script ya configuró las políticas básicas, pero aquí hay algunas consideraciones:

### Políticas Actuales (Acceso Público):
- ✅ Cualquiera puede leer las selecciones y jugadores
- ✅ Cualquiera puede crear, actualizar y eliminar

### ⚠️ Para Producción (Recomendado):

Si quieres restringir el acceso, puedes modificar las políticas:

```sql
-- Ejemplo: Solo lectura pública, escritura solo para usuarios autenticados
DROP POLICY IF EXISTS "Permitir inserción pública de selecciones" ON selecciones;
DROP POLICY IF EXISTS "Permitir actualización pública de selecciones" ON selecciones;
DROP POLICY IF EXISTS "Permitir eliminación pública de selecciones" ON selecciones;

CREATE POLICY "Permitir inserción autenticada de selecciones"
  ON selecciones FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Permitir actualización autenticada de selecciones"
  ON selecciones FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Permitir eliminación autenticada de selecciones"
  ON selecciones FOR DELETE
  TO authenticated
  USING (true);
```

## 🧪 Paso 7: Probar la Conexión

Ahora puedes probar tu API:

1. Asegúrate de que tu archivo `.env` tenga las credenciales correctas
2. Inicia el servidor:
   ```bash
   npm run dev
   ```
3. Deberías ver el mensaje: ✅ **Conexión con Supabase establecida correctamente**
4. Abre tu navegador en `http://localhost:3000/api/selecciones`
5. Deberías ver las selecciones en formato JSON

## 📱 Paso 8: Monitoreo y Logs

En Supabase puedes monitorear tu base de datos:

1. **Database** > **Tables**: Ver y editar datos manualmente
2. **Database** > **Backups**: Configurar respaldos automáticos
3. **Logs**: Ver logs de consultas y errores
4. **API Docs**: Ver documentación autogenerada de tu API

## 🎯 Tips Adicionales

### Ver logs de consultas en tiempo real:
```sql
-- En SQL Editor
SELECT * FROM pg_stat_statements ORDER BY calls DESC LIMIT 10;
```

### Hacer backup manual:
1. Ve a **"Database"** > **"Backups"**
2. Haz clic en **"Create backup"**

### Restaurar datos:
1. Si necesitas resetear todo:
```sql
DROP TABLE IF EXISTS jugadores CASCADE;
DROP TABLE IF EXISTS selecciones CASCADE;
```
2. Luego vuelve a ejecutar `supabase-schema.sql`

## 🚨 Solución de Problemas

### ❌ Error: "relation 'selecciones' does not exist"
**Solución**: Asegúrate de haber ejecutado el script `supabase-schema.sql`

### ❌ Error: "Error al conectar con Supabase"
**Solución**: 
- Verifica que tu `SUPABASE_URL` y `SUPABASE_ANON_KEY` sean correctos
- Asegúrate de que no haya espacios extras en el archivo `.env`
- Verifica que tu proyecto de Supabase esté activo

### ❌ Error: "row level security policy"
**Solución**: Asegúrate de haber ejecutado las políticas de RLS en el script

### ❌ Error: "foreign key constraint"
**Solución**: Al insertar jugadores, asegúrate de que el `seleccion_id` exista en la tabla `selecciones`

## 📚 Recursos Adicionales

- [Documentación de Supabase](https://supabase.com/docs)
- [Guía de Row Level Security](https://supabase.com/docs/guides/auth/row-level-security)
- [SQL Editor Guide](https://supabase.com/docs/guides/database/overview)

---

¡Listo! Ahora tu API está completamente conectada con Supabase y lista para usar. 🎉
