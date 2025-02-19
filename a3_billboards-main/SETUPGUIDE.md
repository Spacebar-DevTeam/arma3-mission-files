# SETUP GUIDE.md

## Setting Up Custom Textures in Arma 3 Missions

### Prerequisites
- Arma 3 installed
- Eden Editor access
- FTP or direct access to your Arma 3 server

### Step 1: Preparing the Mission File
1. Copy your mission folder (e.g., `Exile.chernarusredux`) to your local machine's `mpmissions` folder:
   ```
   C:\Users\YourUsername\Documents\Arma 3 - Other Profiles\YourProfileName\mpmissions\
   ```
2. Create an `pgm` folder inside the mission directory.
3. Place your `.paa` texture files inside the `images` folder.

### Step 2: Editing the Mission in Eden Editor
1. Launch **Arma 3** and go to **Eden Editor**.
2. Open your mission from the `mpmissions` folder.
3. Assign a custom texture to an object using:
   ```cpp
   _this setObjectTextureGlobal [0, "pgm\phuket.paa"];
   ```
4. Save and **export as a Multiplayer mission (`.pbo`)**.

### Step 3: Uploading to Server
1. Upload the `.pbo` file to your **server's `mpmissions` folder`**.
2. Restart the server to apply changes.

### Troubleshooting
- Ensure the `.paa` file exists in the correct `pgm` folder.
- Double-check paths in `mission.sqm` or any script referencing the texture.
- Restart the server after making changes to ensure they apply.
