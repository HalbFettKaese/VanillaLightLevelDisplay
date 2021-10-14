#version 150

#moj_import <fog.glsl>
#moj_import <light_display_settings.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;
in vec4 normal;
in vec2 cornerPos;
in vec2 lightLevel;

out vec4 fragColor;

void main() {
    int darknessDanger = lightLevel.x < 1. ? 0 : (lightLevel.y < 1. ? 1 : 2);
    if (darknessDanger > 0 && any(greaterThan(
        abs(cornerPos), 
        vec2(1. - lineWidth*2.)
    ))) {
        //fragColor = vec4(lightLevel, 0, 1);
        fragColor = vec4(darknessDanger == 1 ? vec3(1, 1, 0) : vec3(1, 0, 0), 1);
    } else {
        vec4 color = texture(Sampler0, texCoord0) * vertexColor * ColorModulator;
        fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
    }

}
