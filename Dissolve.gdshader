shader_type canvas_item;

uniform sampler2D dissolve_texture;
uniform float amount : hint_range(0.0, 1.0);

// Looks COOL if he dissolve texture has a width, or height, of 1!
void fragment()
{
    vec4 main_texture = texture(TEXTURE, UV);
    vec4 noise_texture = texture(dissolve_texture, UV);
    main_texture.a *= 1.0 - floor(amount + min(1, noise_texture.x));
    COLOR = main_texture;
}
