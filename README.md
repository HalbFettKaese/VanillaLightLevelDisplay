# VanillaLightLevelDisplay
Uses a vanilla shader to display on blocks whether they are dark enough for hostile mobs to spawn at their position.
## Interpretation
* Blocks marked in red are always dark enough for monsters to spawn on them.
* Blocks marked in yellow are safe during daytime, but can still have mobs spawning on them during nighttime.
## Configuration
Values that are meant to be easy to change are defined in the file at `assets/minecraft/shaders/include/light_display_settings.glsl`, which can be edited to change the following properties:
* `smoothLighting`: Set to either `OFF`, `Minimum` or `Maximum` and is used to adjust the brightness threshold. Should be set to the same value as what is selected in the game's video settings. 
  
  `Minimum` and `Maximum` are treated as the same, so they do not need to updated when the actual settings match the other.
* `brightnessThreshold`: The brightness starting from which the brightness is recognized as dark enough for monsters to spawn, with the first component being block light and the second component being sky light. By default, this is set to `8.` for both components, which corresponds to recognizing anything darker than light level 8 for block or sky light.
* `lineWidth`: The fraction of a block that a drawn line covers. By default this is set to `1.0/16.0`, which corresponds to 1/16 of a block or one pixel in a resource pack of default resolution.

