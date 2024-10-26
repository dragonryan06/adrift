shader_type canvas_item;

void fragment() {
	COLOR.rgb = texture(TEXTURE,UV).rgb;
	COLOR.a = texture(TEXTURE,UV).r * 0.15;
}
