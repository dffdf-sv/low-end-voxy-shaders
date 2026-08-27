#version 120
varying vec2 texcoord;
varying vec2 lmcoord;
varying vec3 vnormal;
void main(){gl_Position=ftransform();texcoord=gl_MultiTexCoord0.st;lmcoord=gl_MultiTexCoord1.st;vnormal=normalize(gl_NormalMatrix*gl_Normal);}
