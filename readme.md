# Arma 3 Mission Files

## 📌 Overview
This repository contains mission files, object placement scripts, and event setups for Arma 3. It includes `.sqm` mission files, dynamic object spawning scripts, and pre-configured templates for adding objects such as billboards, loot spawns, and environmental elements.

## 📂 Repository Structure
```
arma3-mission-files/
├── a3_billboards-main/
│   ├── example.sqm           # Example mission file with a pre-placed billboard
│   ├── scripts/
│   │   ├── billboard_spawn.sqf  # Script to dynamically spawn a billboard
│   │   ├── object_texture.sqf   # Script to apply a texture to a billboard
│   ├── pgm/                  # Textures
│   │   ├── example.paa       # Sample billboard texture
│   ├── README.md             # Instructions for setting up billboards
```

## 🚀 Getting Started

### **1. Using `example.sqm` in Eden Editor**
If you want to manually place a billboard and adjust settings:
1. Copy the `example.sqm` file into your mission folder.
2. Open Arma 3 **Eden Editor**.
3. Load the mission and customize billboard placement.
4. Save and **export as a `.pbo`** for server use.

### **2. Spawning a Billboard Dynamically**
If you prefer to spawn billboards at runtime:
1. Add `billboard_spawn.sqf` to your mission folder.
2. Open the **Debug Console** in Arma 3 and run:
   ```sqf
   [] execVM "a3_billboards-main/scripts/billboard_spawn.sqf";
   ```
3. The billboard will be placed at predefined coordinates.

### **3. Applying a Custom Texture to a Billboard**
To apply a texture to an existing billboard:
1. Add `object_texture.sqf` to your mission folder.
2. Run the following in the **Debug Console**:
   ```sqf
   [] execVM "a3_billboards-main/scripts/object_texture.sqf";
   ```
3. All nearby billboards will be updated with the custom texture.

## 🔧 Customization
- Edit `example.sqm` to change the **billboard’s position, angle, and texture**.
- Modify `billboard_spawn.sqf` to spawn multiple billboards dynamically.
- Replace `example.paa` with your own `.paa` texture to customize the billboard appearance.

## 📜 License
This project is open-source and free to use. Contributions are welcome!

---

Need help? Feel free to submit an **Issue** or a **Pull Request**. 
