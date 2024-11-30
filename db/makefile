# Variables
DOCKER_IMAGE_NAME = crafo-postgres:15.10-alpine
CONTAINER_NAME = crafo_postgres
ENV_FILE = .env
DB_PORT = 5432

# Default target: Build the image
build:
	podman build -t $(DOCKER_IMAGE_NAME) .

# Run the container with environment variables
run:
	podman run -d \
		--name $(CONTAINER_NAME) \
		--env-file $(ENV_FILE) \
		-p $(DB_PORT):5432 \
		$(DOCKER_IMAGE_NAME)

# Stop the container
stop:
	podman stop $(CONTAINER_NAME)

# Remove the container
remove:
	podman rm $(CONTAINER_NAME)

# Logs from the container
logs:
	podman logs $(CONTAINER_NAME)

# Connect to the PostgreSQL database
connect:
	podman exec -it $(CONTAINER_NAME) psql -U $$(grep POSTGRES_USER $(ENV_FILE) | cut -d '=' -f2) -d $$(grep POSTGRES_DB $(ENV_FILE) | cut -d '=' -f2)

# Clean everything (container and image)
clean:
	podman rm -f $(CONTAINER_NAME) || true
	podman rmi $(DOCKER_IMAGE_NAME) || true

# Rebuild the image and run the container
rebuild: clean build run
