/*
  (Apply a Custom Texture to an Existing Billboard)
  This script retextures an existing billboard.

  What this does:
      Finds all billboards near the player (within 50m).
      Applies a custom texture dynamically.
      Useful for testing multiple billboard skins.
*/

// Find all billboards in the mission
private _billboards = nearestObjects [player, ["Land_Billboard_F"], 50]; 

// Apply Custom Texture
{
    _x setObjectTextureGlobal [0, "a3_billboards-main\textures\example.paa"];
} forEach _billboards;

// Debug Message
systemChat "Texture Applied to Nearby Billboards!";
