shader_type spatial;
render_mode cull_disabled;

varying float y;

void vertex() {
	// Called for every vertex the material is visible on.
	// VERTEX = (MODELVIEW_MATRIX * vec4(VERTEX, 1.0)).xyz;
	y = VERTEX.y;
}

void fragment() {
	ALBEDO = vec3(0, 1.0-y, 0);
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
