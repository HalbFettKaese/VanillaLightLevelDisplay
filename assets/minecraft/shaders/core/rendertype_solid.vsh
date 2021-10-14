#version 150

#moj_import <light.glsl>
#moj_import <light_display_settings.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;
in vec3 Normal;

uniform sampler2D Sampler2;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform vec3 ChunkOffset;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;
out vec4 normal;
out vec2 cornerPos;
out vec2 lightLevel;

const vec2[4] corners = vec2[4](
    vec2(-1, 1),
    vec2(-1, -1),
    vec2(1, -1),
    vec2(1, 1)
);
void main() {
    lightLevel = 1.000001*min(
        vec2(lessThan(UV2*255./256., brightness_threshold)), 
        vec2(dot(Normal, vec3(0, 1, 0)) > 0.9));
    cornerPos = corners[gl_VertexID % 4];
    gl_Position = ProjMat * ModelViewMat * vec4(Position + ChunkOffset, 1.0);

    vertexDistance = length((ModelViewMat * vec4(Position + ChunkOffset, 1.0)).xyz);
    vertexColor = Color * minecraft_sample_lightmap(Sampler2, UV2);
    texCoord0 = UV0;
    normal = ProjMat * ModelViewMat * vec4(Normal, 0.0);
}
