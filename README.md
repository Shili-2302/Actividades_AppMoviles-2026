# taskflow

Aplicación móvil desarrollada en **Flutter** para gestionar tareas académicas. Muestra una lista de tareas y permite ver el detalle de cada una mediante navegación con **go_router**.

> Proyecto del curso de Flutter — Semana 3, Sesión 5.

## Características

- Lista de tareas con título, prioridad e indicador de estado (completada / pendiente).
- Pantalla de detalle con título, descripción, prioridad, estado y usuario asignado.
- Navegación declarativa con rutas y parámetros (`/task/:id`).
- Manejo del caso en que la tarea no existe ("No se encontró esta tarea.").
- Tema Material 3 basado en `ColorScheme.fromSeed` (color índigo).

## Tecnologías

| Tecnología | Uso |
|------------|-----|
| Flutter / Dart | Framework y lenguaje |
| Material Design | Interfaz de usuario |
| go_router | Navegación y rutas |

## Estructura del proyecto

```
lib/
├── main.dart   # Punto de entrada, rutas, pantallas y datos de ejemplo
└── task.dart   # Modelo Task
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

## Navegación

| Ruta | Pantalla | Descripción |
|------|----------|-------------|
| `/` | `TaskListScreen` | Lista de tareas |
| `/task/:id` | `TaskDetailScreen` | Detalle de la tarea seleccionada |

Desde la lista se navega al detalle con `context.push('/task/${task.id}')`. El `id` se lee con `state.pathParameters['id']` y se busca en la lista con `findTask`.

## Instalación y ejecución

### Requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado
- Un emulador, dispositivo físico o navegador configurado

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

Si `go_router` no está instalado:

```bash
flutter pub add go_router
```

## Capturas de pantalla

| Lista de tareas | Detalle de tarea |
|-----------------|------------------|
| ![Lista](screenshots/lista.png) | ![Detalle](screenshots/detalle.png) |

## Próximos pasos

- Crear, editar y eliminar tareas.
- Marcar tareas como completadas desde la lista.
- Persistencia de datos (base de datos local o API).
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

La API concreta se elegirá después. Estas rutas son requisitos, no direcciones de un servidor ya conectado.