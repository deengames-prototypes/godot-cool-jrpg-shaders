shader_type canvas_item;

uniform bool is_enabled = false;

void fragment() {
	vec4 pixel = texture(TEXTURE, UV);
	if (is_enabled) {
		// add 0.01 to prevent divide-by-zero, which is undefined (black or transparent?)
		// See: https://github.com/godotengine/godot/issues/55888
	    float interm = 0.2 / ((pixel.r + pixel.g + pixel.b + 0.001) / 3.0);
		float final = interm; // old way of doing it
		pixel = vec4(final, final, final, pixel.a);
	}
	COLOR = pixel;
}
