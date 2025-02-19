/*
  What this does:

    Dynamically spawns a billboard.
      Sets its rotation (setDir).
      Applies a custom texture.
*/

// Define Billboard Spawn Position
private _billboardPos = [4833.1934,15.339883,5107.584]; // XYZ Coordinates

// Create Billboard
private _billboard = createVehicle ["Land_Billboard_F", _billboardPos, [], 0, "CAN_COLLIDE"];
_bilboard setDir 90; // Set rotation (adjust as needed)

// Apply Custom Texture
_bilboard setObjectTextureGlobal [0, "a3_billboards-main\textures\example.paa"];

// Debug Message
systemChat "Billboard Spawned Successfully!";
