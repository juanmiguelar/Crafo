# **Crafo API - Roles and Access Levels**

## **Available Roles**

1. **Administrator (`admin`)**  
   - Has full access to all resources and functionalities of the platform.
   - Can manage users, workshops, photos, comments, and notifications globally.

2. **Workshop Creator (`creator`)**  
   - Responsible for managing workshops they have created.
   - Can manage resources related to their workshops, such as description photos, attendees, and statistics.

3. **Assistant (`assistant`)**  
   - A participant in workshops.
   - Can register, upload photos on the day of the workshop, comment, like, and receive related notifications.

---

## **Access Matrix by Endpoint**

| **Endpoint**                          | **Admin**       | **Creator**      | **Assistant**    | **Description**                                                                           |
|---------------------------------------|-----------------|------------------|------------------|-------------------------------------------------------------------------------------------|
| **`/health`**                         | R               | R                | R                | Check server health.                                                                      |
| **`/users`**                          | C, R            | N/A              | N/A              | Create and list users.                                                                    |
| **`/users/{id}`**                     | R, U, D         | R, U (own)       | R, U (own)       | Manage user information (only own data for creators and assistants).                      |
| **`/users/login`**                    | C               | C                | C                | User login.                                                                               |
| **`/users/{id}/activity`**            | R               | R (own)          | R (own)          | View recent activities of a user.                                                        |
| **`/roles`**                          | R               | N/A              | N/A              | List all available roles.                                                                |
| **`/workshops`**                      | C, R            | C, R             | R                | Manage workshops.                                                                         |
| **`/workshops/{id}`**                 | R, U, D         | R, U, D (own)    | R                | Manage workshop details (only own for creators).                                         |
| **`/workshops/{id}/attendees`**       | R               | R                | R (if registered) | View attendees of a workshop.                                                            |
| **`/workshops/{id}/photos`**          | C, D            | C, D             | N/A              | Upload or delete description photos of a workshop.                                       |
| **`/workshops/{id}/attendee-photos`** | C, R            | R                | C, R             | Manage photos uploaded by attendees.                                                     |
| **`/photos/{photo_id}`**              | R, D            | R, D (own)       | R                | Manage individual photos.                                                                |
| **`/photos/{photo_id}/like`**         | N/A             | N/A              | C, D             | Like or unlike a photo.                                                                  |
| **`/photos/{photo_id}/report`**       | C               | C                | C                | Report an inappropriate photo.                                                           |
| **`/comments/{id}`**                  | R, U, D         | R, U, D (own)    | R, U, D (own)    | Manage comments (only own for creators and assistants).                                  |
| **`/notifications/{user_id}`**        | R               | R (own)          | R (own)          | Retrieve notifications for a user.                                                      |
| **`/notifications/{id}/mark-as-read`**| U               | U (own)          | U (own)          | Mark a notification as read.                                                             |
| **`/notifications/mark-all-as-read`** | U               | U                | U                | Mark all notifications as read.                                                         |
| **`/notifications/workshops/{workshop_id}`** | C           | C                | N/A              | Create a notification for workshop attendees.                                           |
| **`/workshops/{id}/stats`**           | R               | R (own)          | N/A              | Retrieve statistics for a workshop.                                                     |
| **`/workshops/{id}/favorite`**        | C               | N/A              | C                | Mark a workshop as favorite.                                                            |

---

## **Access Levels**

### **Admin (`admin`)**
- **Full access** to all resources and functionalities of the platform.
- Can:
  - Create, read, update, and delete any resource.
  - View global statistics and details for any user.

### **Creator (`creator`)**
- Manages **only their own workshops** and related resources.
- Can:
  - Create, edit, and delete workshops they have created.
  - View attendees and manage notifications for their workshops.
  - Upload description photos for their workshops.

### **Assistant (`assistant`)**
- Participant with limited access to workshops and public resources.
- Can:
  - Upload photos in workshops they are registered for.
  - Comment and like photos.
  - Receive notifications related to their workshops.

---

### **Additional Notes**
- **Resource Ownership**: 
  - Both `creator` and `assistant` have limited access to resources they have created or are related to them (e.g., comments, photos).
- **Restrictions**:
  - `Assistants` cannot modify global or unrelated resources.
  - `Creators` cannot manage users or resources of other workshops.
