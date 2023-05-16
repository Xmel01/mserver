echo "Welcome to Minecraft server setup"
echo "Building Minecraft server..."
CMD /c "docker build . -t minecraft-server"
echo "Running Minecraft server..."
CMD /c "docker run -d -p 25565:25565 minecraft-server" 
echo "Exiting setup..."
pause

