#  LISTA DE TAREAS PENDIENTES

##  BACKEND

### 1. Implementar experience
- ~~Campo en back de users alimentado por matches + torneos~~ 

### 2. Implementar stats
- ~~Esta por ver en que back ira esta data, sera procedente de matches y torneos~~

### 3. Toda la logica de torneos
- **3.1.** Torneos sera un generador de matches con un endpoint propio en matches que creara los juegos de la ronda de un solo fetch.
- **3.2.** Torneos debera almacenar en memoria el estado del torneo y escribir en base de datos cuando se den ciertos eventos: inicio del torneo, finalizar una ronda entera, finalizar un torneo.
- **3.3.** La idea es que torneo solo gestione creacion, eliminacion y estado del torneo (asignar jugadores a los matches en cada ronda). Que sea un servicio "tonto"
- **3.4.** Torneos tendra un matchmaking similar al de matches para emparejar jugadores
- **3.5.** Implementar notificaciones de torneo en back de notis. se avisara que el torneo empezo? o tambien se avisara por ese back el proximo juego?

### 4. Arreglar gestion de lobbies de matches
- ~~Probar invitacion de amigo a matches.~~ Se arreglo, falta probar.

### 5. Revisar sincronizacion de datos entre los backends
- ~~Login con Chat y Users. Chat con Notificaciones. Users con matches.~~

### 6. Gestion de errores de desconexion en momentos criticos
- ~~Cuando se empezo un juego.~~
- Cuando se empezo un torneo.

### 7. SINCRONIZACION: JUEGO + BACK + FRONT
- ~~ Matches genera el juego y se lo pasa al front, el front se lo pasa al juego. EL juego se desarrolla y al terminar manda los datos al front que los forwardea al back para guardar resultados y generar stats.~~ 

### 8. SINCRONIZACION: JUEGO + FRONT + BACK DE MATCHES + BACK DE TORNEOS
- Una vez creados correctamente los matches e iniciados. torneos es capaz de recibir los resultados y generar la siguiente ronda? Que pasa si uno o mas jugadores de desconectan en este punto?

### 9. Testear todas las funcionalidades

### 10. Limpieza de código
- **10.1.** Eliminar console.logs innecesarios
- **10.2.** Eliminar comentarios innecesarios
- **10.3.** Traducir todos los logs y respuestas http a inglés

### 11. Known Bugs
- **11.1.** ~~Añadir que los mensajes de alguien que tengo bloqueado se guarden en BBDD con su respectivo status (filtrar cuando se envian)~~ 
- **11.2.** ~~Arreglar pete cuando la persona a la que se invita acepta una invitacion de game privada~~
- ~~**11.3.** Cuando el 2fa esta activado, el login no funciona~~
- **11.4.** ~~Revisar si hay que implementar que el usuario pueda borrar su cuenta~~ 
- **11.5.** Quitar todas las API-KEYS hardcodeadas
- **11.6.** ~~Timer para borrar matches abandonados (scores a 0) cada dos horas~~


##  FRONTEND

### 1. Gestión de Lobbies y Matchmaking
- ~~**1.1.** Arreglar flujo inconsistente de "Host game" + "Join game"~~
- ~~**1.2.** Mejorar feedback visual del estado del lobby (cantidad de jugadores, estados)~~
- ~~**1.3.** Implementar UI para mostrar jugadores en espera en el lobby~~

### 2. Sistema de Chat con Usuarios Bloqueados
- ~~**2.1.** Verificar filtrado correcto de mensajes de usuarios bloqueados en todas las situaciones~~
- ~~**2.2.** Testear actualización de lista de contactos al bloquear/desbloquear~~
- ~~**2.3.** Verificar que usuarios bloqueados no puedan enviar invitaciones~~
- **NOTA:** La lógica de bloqueos debe implementarse desde el backend (kinda working)

### 3. Sincronización de Datos
- Hay muchos datos que se ven en distintas partes, que tendrían que ser reactivos y actualizarse en todos los componentes que lo usan
- **NOTA:** Implementado en bloqueo de usuarios

### 4. Visualización de Stats y Perfil
- ~~**4.1.** Conectar historial de matches con backend real (actualmente usa datos mock)~~ (El front de momento usa un back de matches modificado)
- ~~**4.2.** Implementar vista detallada de un match específico~~ ( Es necesario ?)
- ~~**4.3.** Implementar paginación para historial de matches~~

### 5. Sistema de Experiencia y Nivel
- ~~**5.1.** Implementar barra de progreso de experiencia en UI del perfil~~ (No se implementa)
- ~~**5.2.** Calcular y mostrar nivel basado en experiencia~~
- ~~**5.3.** Mostrar XP ganada después de cada partida en `RecapScreen`~~

### 6. HUD del Juego (In-Game Interface)
- ~~**6.1.** Diseñar e implementar HUD overlay durante partida:~~
  - ~~Mostrar puntuación en tiempo real de cada jugador~~
  - ~~Mostrar nombres de jugadores con sus avatares~~
  - ~~**NOTA:** Falta sincronizar backend para tener fotos~~

- ~~**6.2.** Mejorar `RecapScreen` con más detalles:~~
  - ~~Stats detalladas de la partida~~
  - ~~XP ganada~~
  - ~~**NOTA:** Falta saber que stats vamos a poner~~

### 7. Comunicación WebSockets del Juego
- ~~**7.1.** Implementar captura de resultados completos del juego Babylon.js~~
- ~~**7.2.** Crear sistema de callback: Juego → Front → Backend~~
- ~~**7.3.** Enviar stats detalladas de la partida al backend (no solo ganador) (recap screen)~~

### 8. Sistema de Torneos
- ~~**8.1.** Testear flujo completo de torneo (crear, unirse, jugar, avanzar rondas)~~
- **8.2.** Verificar actualización correcta del bracket después de cada match
- ~~**8.3.** Implementar notificaciones cuando toque jugar en torneo~~

### 9. Testear todas las funcionalidades

### 11. Diseño y UI/UX
- **11.1.** Revisar consistencia del pixel-art style en toda la app (Gallego)
- **11.2.** Optimizar responsive design (especialmente modales de juego)
- **11.3.** Mejorar animaciones de transición entre screens
- **11.4.** Reemplazar todos los emojis por iconos .png o .svg (Gallego)
- ~~**11.5.** Reemplazar todos las alertas (las importates) por modales pixelbox (Gallego)~~
- ~~**11.6.** Implementar enter en los inputs para ejecutar la funcion correspondiente (Gallego)~~

### 12. Limpieza de código
- ~~**12.1.** Eliminar console.logs innecesarios~~
- **12.2.** Traducir todos los comentarios a inglés
- ~~**12.3.** Añadir comentarios explicativos donde sea necesario~~ (Dudo que se haga)
- ~~**12.4.** Refactorizar código duplicado~~ (Si nos sobra tiempo, spoiler, no)
- ~~**12.5.** Revisar naming conventions y consistencia~~ (Dudo que se haga :) )

### 13. Pendiente
- ~~**13.1.** Las alertas de notis no son interactivas (no son clickables)~~
- ~~**13.2.** Cuando tienes a alguien bloqueado, alerta de notis sigue entrando (Posiblemente sea de backend)~~ (fixed ?)
- ~~**13.3.** 2FA no muestra el estado real de la base de datos~~
- ~~**13.4.** Preview chats no carga siempre los mensajes (?)~~
- ~~**13.5.** Las alertas de notis de FriendRequest no se muestran, pero las de MSG si (?)~~
- ~~**13.6.** Cuando presionamos enter en la ventana de 2FA la recarga (Gallego)~~
- ~~**13.7.** Se puede navegar dentro de la app (/home, /game) sin iniciar sesion previamente (Solo a game mientras desarrollo)~~
- ~~**13.8.** Despues de iniciar sesion con 2FA activo, el campo estaba a FALSE en el perfil (puede ser back o front) (Gallego)~~
- ~~**13.9.** El creador de torneos no puede elegir un Alias~~
- ~~**13.10.** Detectar desconexión de socket: en 1v1 el juego termina (gana el jugador que queda),~~ en FFA el juego continua
- ~~**13.11.** Las invitaciones a partidas no están sincronizadas al iniciar~~
- ~~**13.12.** Como se gestiona en DB cuando se juega una local ?~~
- ~~**13.13.** Falta fixear el backend para los mensajes bloqueados~~ (kinda working)
- ~~**13.14.** Recap Screen muestra mismos datos a todos los clientes, el tiempo de partida no es el mismo para todos (?)~~
- ~~**13.15.** Quies es local y quien es guest en localmatch ? (actualizar hud)~~
- ~~**13.16.** Se puede navegar a /game sin sesión iniciada o sin un juego válido lanzado~~

- **13.17** Tantos de local game no se guardan bien ?
- ~~**13.18** Las stats no se actualizan correctamente~~
- ~~**13.19** Crear struct de bracket en TournamentContext~~ (Rama torneo)
- ~~**13.20** Crear evento socket para Trigerizar game + actualizar bracket(viene con estado de torneo)~~ (Rama torneo)
- ~~**13.21** Llamar a match_tournamen/{id}/end en recapScreen_torneo~~(Rama torneo)

### 14. Endpoints que necesito
- ~~**14.1** Endpoint para leer las estadisticas (se necesita en perfil y antes de matches) (Endpoint creado, falta implementar en frontEnd)~~ + Falta stats torneo
- ~~**14.2** Endpoint para leer la experiencia~~ 
- ~~**14.3** Endpoint para guardar la experiencia~~ 
- ~~**14.4** Endpoint para guardar matches~~ (No vamos a enviar aqui la xp)
- ~~**14.5** Endpoint para leer matches (historial) (Falta mejorar frontEnd)~~
- ~~**14.6** Endpoint para borrar cuenta (?)~~ (No se va a crear)



