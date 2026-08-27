#version 120
uniform sampler2D texture;
void main(){vec4 c=texture2D(texture,gl_TexCoord[0].st);if(c.a<0.1)discard;gl_FragColor=c;}
