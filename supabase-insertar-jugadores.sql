-- ========================================
-- INSERTAR JUGADORES CON IDS AUTOMÁTICOS
-- Este script obtiene los IDs de las selecciones automáticamente
-- ========================================

-- Primero, vamos a usar variables temporales con WITH
-- Esto evita tener que buscar y reemplazar UUIDs manualmente

-- JUGADORES DE ARGENTINA
INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Lionel Messi', 37, id, 'https://upload.wikimedia.org/wikipedia/commons/b/b4/Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg', 95, 85, 96, 92, 38, 91, 65, 'Delantero', 10
FROM selecciones WHERE pais = 'Argentina';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Ángel Di María', 36, id, 'https://upload.wikimedia.org/wikipedia/commons/9/9f/Angel_Di_Maria_2018.jpg', 88, 87, 85, 84, 45, 83, 72, 'Extremo', 11
FROM selecciones WHERE pais = 'Argentina';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Julián Álvarez', 24, id, 'https://upload.wikimedia.org/wikipedia/commons/f/f3/Julian_Alvarez_2022.jpg', 82, 89, 81, 85, 52, 78, 75, 'Delantero', 9
FROM selecciones WHERE pais = 'Argentina';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Emiliano Martínez', 31, id, 'https://upload.wikimedia.org/wikipedia/commons/7/73/Emiliano_Martinez_2022.jpg', 45, 50, 40, 55, 92, 65, 88, 'Portero', 23
FROM selecciones WHERE pais = 'Argentina';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Rodrigo De Paul', 29, id, 'https://upload.wikimedia.org/wikipedia/commons/e/e5/Rodrigo_De_Paul_2022.jpg', 78, 80, 76, 72, 75, 82, 84, 'Mediocampista', 7
FROM selecciones WHERE pais = 'Argentina';

-- JUGADORES DE BRASIL
INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Neymar Jr', 32, id, 'https://upload.wikimedia.org/wikipedia/commons/9/98/Neymar_Jr._with_Al_Hilal%2C_3_November_2023_-_03_%28cropped%29.jpg', 94, 87, 92, 86, 36, 85, 63, 'Delantero', 10
FROM selecciones WHERE pais = 'Brasil';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Vinícius Jr', 24, id, 'https://upload.wikimedia.org/wikipedia/commons/b/b8/Vinicius_Junior_2023.jpg', 91, 95, 88, 82, 39, 79, 68, 'Extremo', 7
FROM selecciones WHERE pais = 'Brasil';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Casemiro', 32, id, 'https://upload.wikimedia.org/wikipedia/commons/5/5a/Casemiro_2018.jpg', 72, 68, 70, 75, 88, 81, 89, 'Mediocampista', 5
FROM selecciones WHERE pais = 'Brasil';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Alisson Becker', 31, id, 'https://upload.wikimedia.org/wikipedia/commons/8/81/Alisson_Becker_2018.jpg', 40, 48, 35, 50, 89, 68, 86, 'Portero', 1
FROM selecciones WHERE pais = 'Brasil';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Rodrygo', 23, id, 'https://upload.wikimedia.org/wikipedia/commons/d/da/Rodrygo_2022.jpg', 87, 92, 85, 81, 42, 78, 70, 'Extremo', 21
FROM selecciones WHERE pais = 'Brasil';

-- JUGADORES DE MÉXICO
INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Hirving Lozano', 29, id, 'https://ejemplo.com/lozano.jpg', 84, 91, 82, 81, 44, 77, 74, 'Extremo', 22
FROM selecciones WHERE pais = 'México';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Raúl Jiménez', 33, id, 'https://ejemplo.com/jimenez.jpg', 79, 75, 78, 85, 48, 76, 83, 'Delantero', 9
FROM selecciones WHERE pais = 'México';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Guillermo Ochoa', 39, id, 'https://ejemplo.com/ochoa.jpg', 38, 46, 32, 48, 84, 60, 78, 'Portero', 13
FROM selecciones WHERE pais = 'México';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Edson Álvarez', 26, id, 'https://ejemplo.com/edson.jpg', 70, 73, 68, 65, 84, 75, 88, 'Mediocampista', 4
FROM selecciones WHERE pais = 'México';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Alexis Vega', 27, id, 'https://ejemplo.com/vega.jpg', 82, 85, 80, 78, 46, 74, 72, 'Extremo', 10
FROM selecciones WHERE pais = 'México';

-- JUGADORES DE FRANCIA
INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Kylian Mbappé', 25, id, 'https://upload.wikimedia.org/wikipedia/commons/3/36/Kylian_Mbapp%C3%A9_2023.jpg', 92, 98, 90, 91, 39, 82, 78, 'Delantero', 10
FROM selecciones WHERE pais = 'Francia';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Antoine Griezmann', 33, id, 'https://upload.wikimedia.org/wikipedia/commons/9/93/Antoine_Griezmann_2018.jpg', 86, 82, 84, 87, 55, 89, 73, 'Mediocampista', 7
FROM selecciones WHERE pais = 'Francia';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'N''Golo Kanté', 33, id, 'https://ejemplo.com/kante.jpg', 74, 78, 72, 60, 89, 83, 85, 'Mediocampista', 13
FROM selecciones WHERE pais = 'Francia';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Hugo Lloris', 37, id, 'https://ejemplo.com/lloris.jpg', 42, 52, 38, 55, 87, 70, 82, 'Portero', 1
FROM selecciones WHERE pais = 'Francia';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Ousmane Dembélé', 27, id, 'https://ejemplo.com/dembele.jpg', 90, 94, 88, 83, 38, 80, 68, 'Extremo', 11
FROM selecciones WHERE pais = 'Francia';

-- JUGADORES DE ESPAÑA
INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Pedri', 21, id, 'https://ejemplo.com/pedri.jpg', 88, 76, 86, 72, 58, 91, 65, 'Mediocampista', 8
FROM selecciones WHERE pais = 'España';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Gavi', 20, id, 'https://ejemplo.com/gavi.jpg', 85, 78, 83, 68, 72, 88, 74, 'Mediocampista', 9
FROM selecciones WHERE pais = 'España';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Álvaro Morata', 31, id, 'https://ejemplo.com/morata.jpg', 76, 84, 74, 82, 48, 72, 80, 'Delantero', 7
FROM selecciones WHERE pais = 'España';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Unai Simón', 27, id, 'https://ejemplo.com/unai.jpg', 40, 48, 35, 52, 86, 72, 80, 'Portero', 23
FROM selecciones WHERE pais = 'España';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Ferran Torres', 24, id, 'https://ejemplo.com/ferran.jpg', 82, 88, 80, 80, 44, 76, 70, 'Delantero', 11
FROM selecciones WHERE pais = 'España';

-- JUGADORES DE ALEMANIA
INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Joshua Kimmich', 29, id, 'https://ejemplo.com/kimmich.jpg', 78, 76, 75, 74, 80, 90, 78, 'Mediocampista', 6
FROM selecciones WHERE pais = 'Alemania';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Kai Havertz', 25, id, 'https://ejemplo.com/havertz.jpg', 84, 80, 82, 85, 52, 82, 76, 'Mediocampista', 7
FROM selecciones WHERE pais = 'Alemania';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Serge Gnabry', 29, id, 'https://ejemplo.com/gnabry.jpg', 86, 90, 84, 82, 46, 78, 72, 'Extremo', 10
FROM selecciones WHERE pais = 'Alemania';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Manuel Neuer', 38, id, 'https://ejemplo.com/neuer.jpg', 45, 50, 38, 55, 90, 75, 84, 'Portero', 1
FROM selecciones WHERE pais = 'Alemania';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Leroy Sané', 28, id, 'https://ejemplo.com/sane.jpg', 88, 93, 86, 83, 40, 79, 70, 'Extremo', 19
FROM selecciones WHERE pais = 'Alemania';

-- JUGADORES DE INGLATERRA
INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Harry Kane', 31, id, 'https://upload.wikimedia.org/wikipedia/commons/a/ad/Harry_Kane_2018.jpg', 80, 72, 78, 92, 50, 84, 85, 'Delantero', 9
FROM selecciones WHERE pais = 'Inglaterra';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Bukayo Saka', 22, id, 'https://ejemplo.com/saka.jpg', 88, 89, 86, 80, 48, 81, 72, 'Extremo', 7
FROM selecciones WHERE pais = 'Inglaterra';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Jude Bellingham', 21, id, 'https://ejemplo.com/bellingham.jpg', 84, 82, 82, 78, 70, 85, 82, 'Mediocampista', 22
FROM selecciones WHERE pais = 'Inglaterra';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Jordan Pickford', 30, id, 'https://ejemplo.com/pickford.jpg', 38, 46, 32, 50, 85, 68, 80, 'Portero', 1
FROM selecciones WHERE pais = 'Inglaterra';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Phil Foden', 24, id, 'https://ejemplo.com/foden.jpg', 90, 85, 88, 84, 42, 86, 68, 'Mediocampista', 11
FROM selecciones WHERE pais = 'Inglaterra';

-- JUGADORES DE PORTUGAL
INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Cristiano Ronaldo', 39, id, 'https://upload.wikimedia.org/wikipedia/commons/8/8c/Cristiano_Ronaldo_2018.jpg', 85, 82, 83, 94, 35, 80, 78, 'Delantero', 7
FROM selecciones WHERE pais = 'Portugal';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Bruno Fernandes', 30, id, 'https://ejemplo.com/bruno.jpg', 82, 75, 80, 86, 58, 90, 76, 'Mediocampista', 8
FROM selecciones WHERE pais = 'Portugal';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Bernardo Silva', 29, id, 'https://ejemplo.com/bernardo.jpg', 91, 80, 89, 76, 52, 88, 68, 'Mediocampista', 10
FROM selecciones WHERE pais = 'Portugal';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Diogo Costa', 25, id, 'https://ejemplo.com/diogo.jpg', 40, 48, 35, 50, 87, 70, 82, 'Portero', 22
FROM selecciones WHERE pais = 'Portugal';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Rafael Leão', 25, id, 'https://ejemplo.com/leao.jpg', 87, 95, 85, 80, 38, 75, 74, 'Extremo', 17
FROM selecciones WHERE pais = 'Portugal';

-- JUGADORES DE ESTADOS UNIDOS
INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Christian Pulisic', 26, id, 'https://ejemplo.com/pulisic.jpg', 86, 88, 84, 79, 44, 76, 70, 'Extremo', 10
FROM selecciones WHERE pais = 'Estados Unidos';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Weston McKennie', 26, id, 'https://ejemplo.com/mckennie.jpg', 74, 76, 72, 70, 78, 77, 84, 'Mediocampista', 8
FROM selecciones WHERE pais = 'Estados Unidos';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Tyler Adams', 25, id, 'https://ejemplo.com/adams.jpg', 70, 78, 68, 62, 82, 75, 80, 'Mediocampista', 4
FROM selecciones WHERE pais = 'Estados Unidos';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Matt Turner', 30, id, 'https://ejemplo.com/turner.jpg', 38, 44, 30, 45, 80, 65, 76, 'Portero', 1
FROM selecciones WHERE pais = 'Estados Unidos';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Timothy Weah', 24, id, 'https://ejemplo.com/weah.jpg', 80, 90, 78, 74, 42, 72, 75, 'Extremo', 21
FROM selecciones WHERE pais = 'Estados Unidos';

-- JUGADORES DE ITALIA
INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Gianluigi Donnarumma', 25, id, 'https://ejemplo.com/donnarumma.jpg', 42, 50, 38, 52, 91, 72, 88, 'Portero', 1
FROM selecciones WHERE pais = 'Italia';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Federico Chiesa', 27, id, 'https://ejemplo.com/chiesa.jpg', 86, 90, 84, 81, 46, 77, 76, 'Extremo', 14
FROM selecciones WHERE pais = 'Italia';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Nicolò Barella', 27, id, 'https://ejemplo.com/barella.jpg', 80, 82, 78, 76, 78, 84, 82, 'Mediocampista', 18
FROM selecciones WHERE pais = 'Italia';

-- JUGADORES DE CANADÁ
INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Alphonso Davies', 24, id, 'https://ejemplo.com/davies.jpg', 82, 96, 80, 70, 78, 76, 84, 'Defensa', 19
FROM selecciones WHERE pais = 'Canadá';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Jonathan David', 24, id, 'https://ejemplo.com/david.jpg', 80, 86, 78, 84, 42, 74, 76, 'Delantero', 9
FROM selecciones WHERE pais = 'Canadá';

-- JUGADORES DE PAÍSES BAJOS
INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Virgil van Dijk', 33, id, 'https://ejemplo.com/vandijk.jpg', 68, 72, 66, 65, 92, 78, 88, 'Defensa', 4
FROM selecciones WHERE pais = 'Países Bajos';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Memphis Depay', 30, id, 'https://ejemplo.com/depay.jpg', 85, 83, 83, 84, 44, 79, 76, 'Delantero', 10
FROM selecciones WHERE pais = 'Países Bajos';

INSERT INTO jugadores (nombre, edad, seleccion_id, imagen_url, dribling, velocidad, regate, tiro, defensa, pase, fisico, posicion, numero_camiseta)
SELECT 'Cody Gakpo', 25, id, 'https://ejemplo.com/gakpo.jpg', 83, 87, 81, 82, 46, 78, 74, 'Extremo', 8
FROM selecciones WHERE pais = 'Países Bajos';

-- ========================================
-- VERIFICACIÓN FINAL
-- ========================================

-- Contar jugadores por selección
SELECT 
  s.pais,
  COUNT(j.id) as total_jugadores
FROM selecciones s
LEFT JOIN jugadores j ON s.id = j.seleccion_id
GROUP BY s.pais
ORDER BY total_jugadores DESC, s.pais;

-- Total de jugadores insertados
SELECT COUNT(*) as total_jugadores FROM jugadores;

-- Ver algunos jugadores con sus selecciones
SELECT 
  j.nombre,
  j.edad,
  j.posicion,
  j.numero_camiseta,
  s.pais,
  ROUND((j.dribling + j.velocidad + j.regate + j.tiro + j.defensa + j.pase + j.fisico)::numeric / 7, 1) as rating_promedio
FROM jugadores j
JOIN selecciones s ON j.seleccion_id = s.id
ORDER BY rating_promedio DESC
LIMIT 20;
