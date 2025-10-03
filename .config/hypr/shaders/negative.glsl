#version 300 es
precision highp float;

in vec2 v_texcoord;
uniform sampler2D u_texture; 
out vec4 fragColor; 

void main() {
    vec4 texColor = texture(u_texture, v_texcoord);
    vec3 invertedColor = vec3(1.0) - texColor.rgb;
    fragColor = vec4(invertedColor, texColor.a);
}

// the shader is broken
