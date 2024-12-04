# **Crafo API - Roles y Niveles de Acceso**

## **Roles Disponibles**

1. **Administrador (`admin`)**  
   - Tiene acceso completo a todos los recursos y funcionalidades de la plataforma.
   - Puede gestionar usuarios, talleres, fotos, comentarios y notificaciones globalmente.

2. **Creador de Talleres (`creator`)**  
   - Responsable de gestionar talleres que haya creado.
   - Puede administrar recursos asociados a sus talleres, como fotos de descripción, asistentes y estadísticas.

3. **Asistente (`assistant`)**  
   - Participante en talleres.
   - Puede inscribirse, subir fotos el día del taller, comentar, dar likes y recibir notificaciones relacionadas.

---

## **Matriz de Acceso por Endpoint**

| **Endpoint**                          | **Admin**       | **Creator**      | **Assistant**    | **Descripción**                                                                            |
|---------------------------------------|-----------------|------------------|------------------|--------------------------------------------------------------------------------------------|
| **`/health`**                         | R               | R                | R                | Verifica el estado del servidor.                                                          |
| **`/users`**                          | C, R            | N/A              | N/A              | Crear y listar usuarios.                                                                  |
| **`/users/{id}`**                     | R, U, D         | R, U (propio)    | R, U (propio)    | Gestiona información de usuario (solo propio para creators y assistants).                 |
| **`/users/login`**                    | C               | C                | C                | Inicio de sesión.                                                                         |
| **`/users/{id}/activity`**            | R               | R (propio)       | R (propio)       | Ver actividades recientes de un usuario.                                                  |
| **`/roles`**                          | R               | N/A              | N/A              | Lista todos los roles disponibles.                                                       |
| **`/workshops`**                      | C, R            | C, R             | R                | Gestiona talleres.                                                                        |
| **`/workshops/{id}`**                 | R, U, D         | R, U, D (propios)| R                | Gestiona detalles de talleres (solo propios para creators).                               |
| **`/workshops/{id}/attendees`**       | R               | R                | R (si inscrito)  | Obtiene asistentes a un taller.                                                          |
| **`/workshops/{id}/photos`**          | C, D            | C, D             | N/A              | Sube o elimina fotos de descripción del taller.                                           |
| **`/workshops/{id}/attendee-photos`** | C, R            | R                | C, R             | Gestiona fotos subidas por asistentes.                                                   |
| **`/photos/{photo_id}`**              | R, D            | R, D (propias)   | R                | Gestiona fotos individuales.                                                             |
| **`/photos/{photo_id}/like`**         | N/A             | N/A              | C, D             | Da o elimina un like en una foto.                                                        |
| **`/photos/{photo_id}/report`**       | C               | C                | C                | Reporta una foto inapropiada.                                                            |
| **`/comments/{id}`**                  | R, U, D         | R, U, D (propios)| R, U, D (propios)| Gestiona comentarios (solo propios para creators y assistants).                          |
| **`/notifications/{user_id}`**        | R               | R (propias)      | R (propias)      | Consulta notificaciones de usuario.                                                      |
| **`/notifications/{id}/mark-as-read`**| U               | U (propias)      | U (propias)      | Marca una notificación como leída.                                                       |
| **`/notifications/mark-all-as-read`** | U               | U                | U                | Marca todas las notificaciones como leídas.                                              |
| **`/notifications/workshops/{workshop_id}`** | C           | C                | N/A              | Crea una notificación para asistentes del taller.                                        |
| **`/workshops/{id}/stats`**           | R               | R (propias)      | N/A              | Obtiene estadísticas de un taller.                                                      |
| **`/workshops/{id}/favorite`**        | C               | N/A              | C                | Marca un taller como favorito.                                                           |

---

## **Niveles de Acceso**

### **Admin (`admin`)**
- **Acceso total** a todos los recursos y funcionalidades de la plataforma.
- Puede:
  - Crear, leer, actualizar y eliminar cualquier recurso.
  - Consultar estadísticas globales y detalles de cualquier usuario.

### **Creator (`creator`)**
- Gestiona **solo sus propios talleres** y recursos relacionados.
- Puede:
  - Crear, editar y eliminar talleres que haya creado.
  - Ver asistentes y gestionar notificaciones de sus talleres.
  - Subir fotos de descripción de sus talleres.

### **Assistant (`assistant`)**
- Participante con acceso limitado a talleres y recursos públicos.
- Puede:
  - Subir fotos en talleres donde esté inscrito.
  - Comentar y dar likes en fotos.
  - Recibir notificaciones relacionadas con sus talleres.

---

### **Notas Adicionales**
- **Propiedad de Recursos**: 
  - Tanto `creator` como `assistant` tienen acceso limitado a recursos que hayan creado o estén relacionados con ellos (e.g., comentarios, fotos).
- **Restricciones**:
  - Los `assistants` no pueden modificar recursos globales ni ajenos.
  - Los `creators` no pueden gestionar usuarios ni recursos de otros talleres.
