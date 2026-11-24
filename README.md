# taskflow

Aplicación móvil desarrollada en **Flutter** para gestionar tareas académicas. Carga una lista de tareas desde una API con **Dio**, permite ver el detalle de cada una y abrir un formulario para crear una nueva, con navegación mediante **go_router**.

> Proyecto del curso de Flutter — Semana 5, Sesión 9.

## Características

- Lista de tareas cargada desde una API, con título, prioridad e indicador de estado (completada / pendiente).
- Estados de carga, error (con botón "Reintentar") y lista vacía.
- Actualización de la lista con el botón de refrescar o deslizando hacia abajo.
- Pantalla de detalle con título, descripción, prioridad, estado y usuario asignado.
- Formulario de nueva tarea con validación del título, que devuelve un borrador (`TaskDraft`) a la lista.
- Navegación declarativa con rutas y parámetros (`/task/:id`).
- Manejo del caso en que la tarea no existe ("No se encontró esta tarea.").
- Tema Material 3 basado en `ColorScheme.fromSeed` (color índigo).

## Tecnologías

| Tecnología | Versión | Uso |
|------------|---------|-----|
| Flutter / Dart | SDK ^3.13.7 | Framework y lenguaje |
| Material Design 3 | - | Interfaz de usuario |
| go_router | ^18.1.3 | Navegación y rutas |
| provider | ^6.1.5+1 | Gestión de estado (`TasksViewModel`) |
| dio | ^5.11.1 | Cliente HTTP para consumir la API REST |
| flutter_lints | ^6.0.0 | Reglas de estilo y análisis de código (desarrollo) |

## Estructura del proyecto

```
lib/
├── main.dart
├── app/
│   └── taskflow_app.dart              # MaterialApp.router y rutas
├── core/
│   └── app_theme.dart                 # Tema de la app
└── features/tasks/
    ├── data/
    │   ├── task_api_service.dart          # Llamadas a la API
    │   ├── remote_task_repository.dart    # Repositorio remoto
    │   ├── local_task_repository.dart     # Repositorio local
    │   └── task_repository.dart           # Contrato del repositorio
    ├── domain/
    │   └── task.dart                      # Modelo Task
    └── presentation/
        ├── task_list_screen.dart          # Lista de tareas
        ├── task_detail_screen.dart        # Detalle de tarea
        ├── task_form_screen.dart          # Formulario de nueva tarea
        └── tasks_view_model.dart          # Estado y lógica de la lista
```

## Modelo de datos

La clase `Task` contiene los siguientes campos:

| Campo | Tipo | Descripción |
|-------|------|-------------|
| `id` | `int` | Identificador único |
| `title` | `String` | Título de la tarea |
| `description` | `String` | Descripción detallada |
| `priority` | `String` | Prioridad: Alta, Media o Baja |
| `isCompleted` | `bool` | Indica si la tarea está completada |
| `userId` | `int` | Usuario al que pertenece |

> La API de pruebas no trae prioridad, por eso la lista muestra "Sin prioridad (API)".

## Navegación

| Ruta | Pantalla | Descripción |
|------|----------|-------------|
| `/` | `TaskListScreen` | Lista de tareas |
| `/new` | `TaskFormScreen` | Formulario de nueva tarea |
| `/task/:id` | `TaskDetailScreen` | Detalle de la tarea seleccionada |

- Desde la lista se navega al detalle con `context.push('/task/${task.id}')`. El `id` se lee con `state.pathParameters['id']`.
- El botón "Nueva tarea" abre el formulario con `context.push<TaskDraft>('/new')` y recibe el borrador al cerrarse.

## Instalación y ejecución

### Requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado, con un SDK de Dart `^3.13.7` o superior
- Un emulador, dispositivo físico o navegador configurado
- Conexión a internet (la lista se carga desde una API)

### Pasos

```bash
# 1. Clonar el repositorio
git clone <URL-DE-TU-REPOSITORIO>
cd taskflow

# 2. Instalar dependencias
flutter pub get

# 3. Ejecutar la app
flutter run
```

## Capturas de pantalla

| Lista de tareas | Detalle de tarea |
|-----------------|------------------|
| ![Lista](screenshots/lista.png) | ![Detalle](screenshots/detalle.png) |

## Estado actual

- Listar tareas desde la API (GET): hecho.
- Ver detalle de una tarea: hecho.
- Formulario con validación: hecho. Por ahora solo devuelve un borrador y **no crea la tarea en el servidor**.

## Próximos pasos

- Crear tareas en el servidor (POST) — sesión 10.
- Editar y eliminar tareas.
- Marcar tareas como completadas desde la lista.
- Filtros por prioridad y estado.

## Autor

**Shirlesita**
Materia APP Moviles — ULEAM
GitHub: Shili-2302 (https://github.com/Shili-2302)

---

## Alcance de TaskFlow

**Problema:** necesito organizar mis actividades académicas (entregar el informe de laboratorio, estudiar para el examen de Flutter, preparar la exposición grupal, leer el capítulo de Base de Datos y publicar el proyecto en GitHub) y saber cuáles me faltan por hacer.

**Usuario objetivo:** estudiante que planifica sus entregas semanales.

### Historias de usuario y criterios de aceptación

1. Como estudiante, quiero listar mis tareas para ver qué debo hacer.
   **Criterio:** la lista muestra título, prioridad y estado de cada tarea (por ejemplo, "Entregar informe de laboratorio – Prioridad: Alta – pendiente").
2. Como estudiante, quiero abrir una tarea para leer su descripción.
   **Criterio:** al tocar una tarjeta aparece el detalle de la tarea elegida (por ejemplo, "Subir el PDF a la plataforma antes del viernes").
3. Como estudiante, quiero crear una tarea para registrar un pendiente.
   **Criterio:** el formulario guarda una tarea válida y la lista la muestra.
4. Como estudiante, quiero editar una tarea para corregir sus datos.
   **Criterio:** los cambios guardados aparecen en lista y detalle.
5. Como estudiante, quiero eliminar una tarea terminada (como "Crear repositorio en GitHub") para limpiar la lista.
   **Criterio:** después de confirmar, la tarea desaparece de la lista.

### Modelo de datos

`Task`: `id` (entero único), `title` (texto), `description` (texto), `priority` (Alta, Media o Baja), `isCompleted` (verdadero/falso), `userId` (entero que identifica al usuario de prueba).

### Pantallas previstas

- **Lista:** tarjetas de tareas y acción para crear.
- **Detalle:** información completa y futuras acciones de editar o eliminar.
- **Formulario:** campos de título, descripción y prioridad.

### Requisitos no funcionales

- La navegación debe tener textos comprensibles.
- Un id inexistente debe mostrar un mensaje ("No se encontró esta tarea.") en vez de cerrar la app.

### Contrato de API que necesitaremos

| Método | Ruta | Descripción |
|--------|------|-------------|
| GET | `/tasks` | Listar tareas |
| GET | `/tasks/:id` | Consultar detalle |
| POST | `/tasks` | Crear tarea |
| PATCH | `/tasks/:id` | Actualizar tarea |
| DELETE | `/tasks/:id` | Eliminar tarea |

