-- Insert roles
INSERT INTO roles (name)
VALUES
('admin'),
('creator'),
('assistant');

-- Insert users
INSERT INTO users (name, email, password, role, bio, profile_picture)
VALUES
('Alice Johnson', 'alice@example.com', 'password123', 'creator', 'Passionate workshop creator', 'https://example.com/alice.jpg'),
('Bob Smith', 'bob@example.com', 'password123', 'assistant', 'Photography enthusiast', 'https://example.com/bob.jpg'),
('Diana Prince', 'diana@example.com', 'password123', 'creator', 'Creative mind and event host', 'https://example.com/diana.jpg'),
('Admin User', 'admin@example.com', 'adminpass123', 'admin', 'Platform administrator', 'https://example.com/admin.jpg');

-- Assign roles to users
INSERT INTO user_roles (user_id, role_id)
VALUES
(1, 2), -- Alice as creator
(2, 3), -- Bob as assistant
(3, 2), -- Diana as creator
(4, 1); -- Admin User as admin

-- Insert workshops
INSERT INTO workshops (title, description, date, location, creator_id, max_capacity)
VALUES
('Photography Basics', 'Learn the fundamentals of photography.', '2024-12-15 10:00:00', 'Room A', 1, 20),
('Creative Writing', 'Unleash your storytelling potential.', '2024-12-20 14:00:00', 'Room B', 3, 15);

-- Insert description photos
INSERT INTO photos (url, uploaded_by, workshop_id, type)
VALUES
('https://example.com/photo_basics1.jpg', 1, 1, 'description'),
('https://example.com/photo_basics2.jpg', 1, 1, 'description'),
('https://example.com/creative_writing1.jpg', 3, 2, 'description');

-- Insert attendee photos
INSERT INTO photos (url, uploaded_by, workshop_id, type, likes_count)
VALUES
('https://example.com/attendee_photo1.jpg', 2, 1, 'attendee', 10),
('https://example.com/attendee_photo2.jpg', 2, 1, 'attendee', 5),
('https://example.com/attendee_photo3.jpg', 2, 2, 'attendee', 8);

-- Insert attendees
INSERT INTO attendees (user_id, workshop_id)
VALUES
(2, 1), (2, 2);

-- Insert comments
INSERT INTO comments (photo_id, user_id, content)
VALUES
(4, 2, 'Great shot!'), 
(5, 2, 'Love the composition.');

-- Insert notifications
INSERT INTO notifications (user_id, type, message, workshop_id, photo_id, is_read)
VALUES
(2, 'new_photo', 'A new photo was uploaded to your workshop.', 1, 4, FALSE),
(2, 'comment', 'Your photo received a new comment.', 1, 4, FALSE);

-- Validation Queries
SELECT * FROM users;
SELECT * FROM roles;
SELECT * FROM user_roles;
SELECT * FROM workshops;
SELECT * FROM photos;
SELECT * FROM attendees;
SELECT * FROM comments;
SELECT * FROM notifications;
