shader_type spatial;

uniform vec4 albedo : source_color;
uniform sampler2D texture_albedo1 : source_color,filter_linear_mipmap,repeat_enable;
uniform sampler2D texture_albedo2 : source_color,filter_linear_mipmap,repeat_enable;
uniform vec3 uv1_scale;
uniform vec3 uv1_offset;

void vertex() {
	UV=UV*uv1_scale.xy+uv1_offset.xy;
}

void fragment() {
	vec2 base_uv = UV;
	if (VIEW_INDEX == VIEW_MONO_LEFT){
		vec4 albedo_tex = texture(texture_albedo1,base_uv);
		ALBEDO = albedo_tex.rgb;
	}
	else if (VIEW_INDEX == VIEW_RIGHT){
		vec4 albedo_tex = texture(texture_albedo2,base_uv);
		ALBEDO = albedo_tex.rgb;
	}
}
