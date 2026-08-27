#version 120

uniform sampler2D colortex0;
varying vec2 texcoord;

// Iris shader-pack options. These appear in Shader Pack Settings.
const float BRIGHTNESS = 0.72; // [0.45 0.55 0.65 0.72 0.80 0.90 1.00]
const float SATURATION = 1.03; // [0.85 0.95 1.00 1.03 1.10]
const float CONTRAST = 0.96;   // [0.85 0.90 0.96 1.00 1.05]

void main() {
    vec3 color = texture2D(colortex0, texcoord).rgb;

    // Keep the final image in a safe SDR range. Do not use the previous
    // HDR-style color/(1+color) operation, which caused the white wash.
    color *= BRIGHTNESS;

    float luma = dot(color, vec3(0.2126, 0.7152, 0.0722));
    color = mix(vec3(luma), color, SATURATION);
    color = (color - 0.5) * CONTRAST + 0.5;
    color = clamp(color, 0.0, 1.0);

    gl_FragColor = vec4(color, 1.0);
}
