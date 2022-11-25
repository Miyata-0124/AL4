#include "Resources/shaders/Obj.hlsli"

Texture2D<float4>tex:register(t0);// 0�ԃX���b�g�ɐݒ肳�ꂽ�e�N�X�`��
SamplerState smp:register(s0);// 0�ԃX���b�g�ɐݒ肳�ꈟt�T���v���[

float4 main(VSOutPut input) : SV_TARGET
{
	float3 light = normalize(float3(1,-1,1));// �E���� �����̃��C�g
	float light_diffuse = saturate(dot(-light, input.normal));
	float3 shade_color;
	shade_color = m_ambient;// �A���r�G���g��
	shade_color += m_diffuse * light_diffuse;// �f�B�q���[�Y��
	float4 texcolor = tex.Sample(smp, input.uv);
	return float4(texcolor.rgb * shade_color,texcolor.a * m_alpha);
}