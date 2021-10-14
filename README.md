# VanillaLightLevelDisplay
Uses a vanilla shader to display on blocks whether they are dark enough for hostile mobs to spawn at their position.
## Interpretation
* Blocks marked in red are always dark enough for monsters to spawn on them.
* Blocks marked in yellow are safe during daytime, but can still have mobs spawning on them during nighttime.
## Configuration
Values that are meant to be easy to change are defined in the file at `assets/minecraft/shaders/include/light_display_settings.glsl`, which can be edited to change the following properties:
* `lineWidth`: The fraction of a block that a drawn line covers. By default this is set to `0.0625`, which corresponds to 1/16 of a block or one pixel in a resource pack of default resolution.
* `brightnessThreshold`: The brightness starting from which the brightness is recognized as dark enough for monsters to spawn, with the first component being block light and the second component being sky light. By default, this is set to `112.` for both components, which corresponds to recognizing anything darker than light level 7 for block or sky light.

