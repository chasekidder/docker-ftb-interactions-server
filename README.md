Licensed under Apache 2.0

Usage:
1. Download the server install executable from the FTB website and place it in the same folder as the Dockerfile.
2. Verify that the Dockerfile is including your installer file.
3. Build the image.
4. Start a container and map the container's 25565 port to a host port.
5. Point minecraft to <hostIP>:<hostPort>.
