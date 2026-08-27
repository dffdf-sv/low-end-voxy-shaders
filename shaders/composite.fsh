#version 120

uniform sampler2D colortex0;
uniform float BRIGHTNESS;
uniform float SATURATION;
uniform float CONTRAST;
varying vec2 texcoord;

void main() {
    vec3 color = texture2D(colortex0, texcoord).rgb;

    // Keep the final image in a safe SDR range. No HDR tonemap that can wash
    // the whole frame to white on Intel integrated graphics.
    color *= BRIGHTNESS;

    float luma = dot(color, vec3(0.2126, 0.7152, 0.0722));
    color = mix(vec3(luma), color, SATURATION);
    color = (color - 0.5) * CONTRAST + 0.5;
    color = clamp(color, 0.0, 1.0);

    gl_FragColor = vec4(color, 1.0);
}
