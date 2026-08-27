#version 120
uniform sampler2D texture;
varying vec2 texcoord;
varying vec2 lmcoord;
varying vec3 vnormal;
void main(){
    vec4 a=texture2D(texture,texcoord);
    if(a.a<0.1)discard;
    // Preserve the Minecraft texture colour. The final composite handles
    // brightness so terrain cannot become a solid white surface.
    gl_FragColor=vec4(a.rgb,a.a);
}
