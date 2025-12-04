#  LISTA DE TAREAS PENDIENTES

##  BACKEND

### 1. Implementar experience
- Campo en back de users alimentado por matches + torneos

### 2. Implementar stats
- Esta por ver en que back ira esta data, sera procedente de matches y torneos

### 3. Toda la logica de torneos
- **3.1.** Torneos sera un generador de matches con un endpoint propio en matches que creara los juegos de la ronda de un solo fetch.
- **3.2.** Torneos debera almacenar en memoria el estado del torneo y escribir en base de datos cuando se den ciertos eventos: inicio del torneo, finalizar una ronda entera, finalizar un torneo.
- **3.3.** La idea es que torneo solo gestione creacion, eliminacion y estado del torneo (asignar jugadores a los matches en cada ronda). Que sea un servicio "tonto"
- **3.4.** Torneos tendra un matchmaking similar al de matches para emparejar jugadores
- **3.5.** Implementar notificaciones de torneo en back de notis. se avisara que el torneo empezo? o tambien se avisara por ese back el proximo juego?

### 4. Arreglar gestion de lobbies de matches
- Probar invitacion de amigo a matches.

### 5. Revisar sincronizacion de datos entre los backends
- Login con Chat y Users. Chat con Notificaciones. Users con matches. Macthes con Torneos.

### 6. Gestion de errores de desconexion en momentos criticos
- Cuando se empezo un juego, cuando se empezo un torneo. Que se hara?

### 7. SINCRONIZACION: JUEGO + BACK + FRONT
- Matches genera el juego y se lo pasa al front, el front se lo pasa al juego. EL juego se desarrolla y al terminar manda los datos al front que los forwardea al back para guardar resultados y generar stats.

### 8. SINCRONIZACION: JUEGO + FRONT + BACK DE MATCHES + BACK DE TORNEOS
- Una vez creados correctamente los matches e iniciados. torneos es capaz de recibir los resultados y generar la siguiente ronda? Que pasa si uno o mas jugadores de desconectan en este punto?

### 9. Testear todas las funcionalidades

### 10. Limpieza de código
- **10.1.** Eliminar console.logs innecesarios
- **10.2.** Traducir todos los comentarios a inglés
- **10.3.** Añadir comentarios explicativos donde sea necesario

---

##  FRONTEND

### 1. Gestión de Lobbies y Matchmaking
- **1.1.** Arreglar flujo inconsistente de "Host game" + "Join game"
- **1.2.** Mejorar feedback visual del estado del lobby (cantidad de jugadores, estados)
- **1.3.** Implementar UI para mostrar jugadores en espera en el lobby

### 2. Sistema de Chat con Usuarios Bloqueados
- **2.1.** Verificar filtrado correcto de mensajes de usuarios bloqueados en todas las situaciones
- **2.2.** Testear actualización de lista de contactos al bloquear/desbloquear
- **2.3.** Verificar que usuarios bloqueados no puedan enviar invitaciones

### 3. Sincronización de Datos
- Hay muchos datos que se ven en distintas partes, que tendrían que ser reactivos y actualizarse en todos los componentes que lo usan

### 4. Visualización de Stats y Perfil
- **4.1.** Conectar historial de matches con backend real (actualmente usa datos mock)
- **4.2.** Implementar vista detallada de un match específico (expandir información)
- **4.3.** Implementar paginación para historial de matches

### 5. Sistema de Experiencia y Nivel
- **5.1.** Implementar barra de progreso de experiencia en UI del perfil
- **5.2.** Calcular y mostrar nivel basado en experiencia
- **5.3.** Mostrar XP ganada después de cada partida en `RecapScreen`
- **5.5.** Implementar sistema de recompensas visuales por nivel alcanzado

### 6. HUD del Juego (In-Game Interface)
- **6.1.** Diseñar e implementar HUD overlay durante partida:
  - Mostrar puntuación en tiempo real de cada jugador
  - Mostrar nombres de jugadores con sus avatares

- **6.2.** Mejorar `RecapScreen` con más detalles:
  - Stats detalladas de la partida
  - XP ganada
  - Cambios en el ranking/nivel

### 7. Comunicación WebSockets del Juego
- **7.1.** Implementar captura de resultados completos del juego Babylon.js
- **7.2.** Crear sistema de callback: Juego → Front → Backend
- **7.3.** Enviar stats detalladas de la partida al backend (no solo ganador)

### 8. Sistema de Torneos
- **8.1.** Testear flujo completo de torneo (crear, unirse, jugar, avanzar rondas)
- **8.2.** Verificar actualización correcta del bracket después de cada match
- **8.3.** Implementar notificaciones cuando toque jugar en torneo

### 9. Testear todas las funcionalidades

### 11. Diseño y UI/UX
- **11.1.** Revisar consistencia del pixel-art style en toda la app
- **11.2.** Optimizar responsive design (especialmente modales de juego)
- **11.3.** Mejorar animaciones de transición entre screens
- **11.4.** Añadir más feedback visual:
  - Loading states con skeleton screens
  - Success/error messages con animaciones
  - Tooltips informativos

### 12. Limpieza de código
- **12.1.** Eliminar console.logs innecesarios
- **12.2.** Traducir todos los comentarios a inglés
- **12.3.** Añadir comentarios explicativos donde sea necesario
- **12.4.** Refactorizar código duplicado
- **12.5.** Revisar naming conventions y consistencia
