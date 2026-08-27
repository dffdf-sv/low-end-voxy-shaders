#version 120
varying vec2 lmcoord;
varying vec3 vnormal;
void main(){gl_Position=ftransform();gl_TexCoord[0]=gl_MultiTexCoord0;lmcoord=gl_MultiTexCoord1.st;vnormal=normalize(gl_NormalMatrix*gl_Normal);}
