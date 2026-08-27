#version 120

uniform sampler2D colortex0;

void main() {
    vec2 uv = gl_TexCoord[0].st;
    vec3 color = texture2D(colortex0, uv).rgb;
    float luma = dot(color, vec3(0.2126, 0.7152, 0.0722));
    color = mix(vec3(luma), color, 1.06);
    color = color / (1.0 + color);
    gl_FragColor = vec4(color, 1.0);
}
