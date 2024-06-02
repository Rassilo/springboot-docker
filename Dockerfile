# Stage 1: Build the application
FROM gradle:6.7.0-jdk11 as builder
WORKDIR /app

# Copy only the build.gradle and gradle files to cache dependencies
COPY build.gradle settings.gradle /app/
COPY gradle /app/gradle

# Download dependencies
RUN gradle build -x test --no-daemon

# Copy the rest of the project and build
COPY . /app
RUN gradle build -x test --no-daemon

# Stage 2: Run the application
FROM openjdk:11-jre-slim
WORKDIR /app

# Copy the built jar file from the previous stage
COPY --from=builder /app/build/libs/*.jar app.jar

# Expose the port the app runs on
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]
