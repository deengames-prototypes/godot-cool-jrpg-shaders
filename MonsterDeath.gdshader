shader_type canvas_item;

uniform float amount : hint_range(0, 1) = 1.0;

void fragment() {
	vec4 original = texture(TEXTURE, UV);
	
	float sprite_alpha = (1.0 - amount) * original.a; // original alpha
	float dim_alpha = original.a * min(original.r, min(original.g, original.b));
	float final_alpha = mix(dim_alpha, sprite_alpha, amount);
	vec3 pink = vec3(1.0, 0.8, 0.9) * 2.0 * amount;
	COLOR = vec4(pink.r + original.r, pink.g + original.g, pink.b + original.b, final_alpha);
	//COLOR = vec4(original.r, original.g, original.b, final_alpha);
}
