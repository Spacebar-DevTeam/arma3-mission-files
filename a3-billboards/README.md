# README.md

## Custom Texture Setup for Mission File

This repository contains instructions on how to apply custom `.paa` textures to objects in your Arma 3 mission file. This example demonstrates applying a custom billboard texture.

### Folder Structure
Ensure your mission folder follows this structure:
```
YourMissionFolder\
├── pgm\
│   ├── phuket.paa
├── mission.sqm
```

### Editing the Mission File
To edit the mission file (`mission.sqm`) in Eden Editor:
1. Copy your mission folder to:
   - **Singleplayer:** `C:\Users\YourUsername\Documents\Arma 3\missions\`
   - **Multiplayer:** `C:\Users\YourUsername\Documents\Arma 3 - Other Profiles\YourProfileName\mpmissions\`
2. Open Arma 3 and launch the **Eden Editor**.
3. Load the mission, make your changes, and save.
4. Export as a **Multiplayer mission** (`.pbo`).

### Example Code
The following example sets a custom texture for a billboard object in your mission file:
```cpp
class Item158
{
    dataType="Object";
    class PositionInfo
    {
        position[]={4833.1934,15.339883,5107.584};
        angles[]={0,5.8341117,0};
    };
    side="Empty";
    flags=5;
    class Attributes
    {
    };
    id=434;
    type="Land_Billboard_F";
    class CustomAttributes
    {
        class Attribute0
        {
            property="ObjectTextureCustom0";
            expression="_this setObjectTextureGlobal [0,_value]";
            class Value
            {
                class data
                {
                    class type
                    {
                        type[]={
                            "STRING"
                        };
                    };
                    value="pgm\phuket.paa";
                };
            };
        };
        nAttributes=1;
    };
};
```

### Deploying to Server
1. Copy the exported `.pbo` file to your **server's `mpmissions` folder**.
2. Restart the server to apply changes.
