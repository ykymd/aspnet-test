# Base of your container
FROM microsoft/aspnet:latest

# Copy the project into folder and then restore packages
COPY . /app
WORKDIR /app/src/WebApplication1
RUN ["dnu","restore"]

# Open this port in the container
EXPOSE 5000
# Start application
ENTRYPOINT ["dnx","-p","project.json", "web"]