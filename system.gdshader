shader_type spatial;
uniform vec4 new_color: source_color;
uniform sampler2D TEXTURE;
varying vec3 world_vertex_position;
void vertex() {
	// Called for every vertex the material is visible on.
	world_vertex_position = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
	//}
}
float random (vec2 uv) {
    return fract(sin(dot(uv.xy, vec2(12.9898, 78.233))) * 43758.5453);
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 current_color = texture(TEXTURE,UV);
	vec3 col = vec3(world_vertex_position.x,world_vertex_position.y,world_vertex_position.z);
	vec3 rand_col = vec3(random(vec2(0,col.x)),random(vec2(0,col.y)),random(vec2(0,col.z)));
	//if (current_color.rbg == vec3(0,0,1) && current_color.g > 0.0){
	ALBEDO.rgb = current_color.rgb * new_color.rgb;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
