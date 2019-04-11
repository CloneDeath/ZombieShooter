shader_type canvas_item;
uniform vec2 resolution = vec2(10, 10);

vec4 get_sample(vec2 offset, vec2 output_res, vec2 screen_uv, sampler2D screen_tex){
	vec2 sample = floor(screen_uv * output_res + offset) / output_res;
	return textureLod(screen_tex, sample, 0.0).rgba;
}

void fragment() {
	vec4 sample = get_sample(vec2(0.5, 0.5), resolution, SCREEN_UV, SCREEN_TEXTURE);
	COLOR = sample / vec4(1, 1, 1, 1);
}
