#define OFF 0
#define Minimum 1
#define Maximum 2

const int smoothLighting = Maximum; // Adjust the split according to Smooth Lighting being set to Maximum
const vec2 brightnessThreshold = vec2(8.); // Make the split below light level 8
const float lineWidth = 1.0/16.0; // Make the lines one normal pixel wide (1/16 blocks wide)