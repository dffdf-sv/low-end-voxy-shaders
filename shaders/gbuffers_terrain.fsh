#version 120
uniform sampler2D texture;
varying vec2 texcoord;
varying vec2 lmcoord;
varying vec3 vnormal;
void main(){vec4 a=texture2D(texture,texcoord);if(a.a<0.1)discard;float n=max(dot(normalize(vnormal),normalize(vec3(0.25,0.75,0.35))),0.0);float light=0.48+0.34*lmcoord.y+0.20*lmcoord.x+0.10*n;gl_FragColor=vec4(a.rgb*light,a.a);}
