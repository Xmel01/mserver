echo "Welcome to Minecraft server setup"
echo "Building & Running Minecraft server..."
CMD /c "docker compose up -d && docker attach minecraft-server"
echo "Exiting setup..."


