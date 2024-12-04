# Crafo - Collaborative Workshop Management Platform

Crafo is a platform designed to streamline the management of collaborative workshops. It enables workshop creators to manage events, attendees, and photos, while participants can share their experiences, interact with others, and stay connected. Administrators oversee the entire platform to ensure smooth operation.

---

## 🚀 **Features**

### For Administrators
- Full control over users, workshops, and platform-wide resources.
- Manage roles and permissions.
- Access global platform statistics.

### For Workshop Creators
- Create, update, and archive workshops.
- Manage workshop descriptions with photos (1-5 images).
- Track attendees and send notifications to participants.
- Access workshop statistics, including attendee count, photos, and comments.

### For Assistants
- Register for workshops and participate.
- Upload photos during workshops.
- Interact with photos via likes and comments.
- Receive notifications related to workshops they are attending.

---

## 🛠️ **Tech Stack**

- **Frontend**: Vue.js with Vuetify for UI components.
- **Backend**: Node.js (Express.js) for API.
- **Database**: PostgreSQL for relational data storage.
- **Storage**: Firebase for storing images and authentication.
- **Containerization**: Podman for managing containers.
- **Documentation**: OpenAPI for API specs.

---

## 📂 **Project Structure**

Crafo/
├── backend/             # Node.js API
├── frontend/            # Vue.js application
├── db/                  # Database scripts and migrations
├── docs/                # API documentation (OpenAPI YAML)
├── tests/               # Automated tests
├── README.md            # Project documentation
└── .env.example         # Environment variable template

---

## ⚙️ **Setup**

### 1. Clone the Repository
git clone https://github.com/your-username/crafo.git
cd crafo

### 2. Configure Environment Variables
- Copy the `.env.example` file and update the values as needed:
cp .env.example .env

### 3. Start the Database
- Build and run the PostgreSQL container using Podman:
cd db
make rebuild-db

### 4. Start the Backend
- Navigate to the backend directory and install dependencies:
cd backend
npm install
npm start

### 5. Start the Frontend
- Navigate to the frontend directory and install dependencies:
cd frontend
npm install
npm run serve

---

## 🔗 **Endpoints Overview**

- Full API documentation is available in the `/docs` folder or online.
- Example endpoints:
  - **`GET /workshops`**: List all workshops.
  - **`POST /workshops`**: Create a new workshop (Creators/Admins only).
  - **`POST /photos/{photo_id}/like`**: Like a photo (Assistants only).

---

## 🧪 **Running Tests**

### Backend Tests
cd backend
npm run test

### Frontend Tests
cd frontend
npm run test

---

## 📄 **License**

Crafo is licensed under the MIT License. See LICENSE for details.

---

## 🤝 **Contributing**

We welcome contributions! Follow these steps:
1. Fork the repository.
2. Create a feature branch: `git checkout -b feature-name`.
3. Commit your changes: `git commit -m "Add feature description"`.
4. Push the branch: `git push origin feature-name`.
5. Open a Pull Request.

---

## 🛡️ **Security**

If you discover a vulnerability, please email us at `security@crafo.com` instead of raising an issue.

---

## 🌟 **Credits**

Crafo is proudly developed by a passionate team of developers dedicated to collaborative experiences.
