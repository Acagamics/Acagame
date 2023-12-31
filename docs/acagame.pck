GDPC                 `                                                                         X   res://.godot/exported/133200997/export-1d5684106cc3dc1520a7c63bbf4f520c-debug_label.scn P            H˖s�%�
���J�YV    T   res://.godot/exported/133200997/export-234fb6894ec6226e856ab7f825500d3d-player.scn   0      �      1Tsژ�$��R����f    P   res://.godot/exported/133200997/export-3370694a3d56567dea5c3bf0058a536d-door.scn�6      �      ѭ�Sy��)����Hj�    T   res://.godot/exported/133200997/export-77e1e97968eceda4c007e89777985a50-hurtbox.scn �!      �      l��-2ք?���S?p    T   res://.godot/exported/133200997/export-7d7682dd9205a180ef2afa6af5fa7410-switch.scn  �M      �      i�H93��u�sƴ�Nǈ    P   res://.godot/exported/133200997/export-c2a7af834e91ff64325daddf58e45dc0-game.scnp            s*1����Iy�A    ,   res://.godot/global_script_class_cache.cfg          �       � TE�ۏ|{QD �    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctexp\      \      6(4�d=EQ�ǮVj,       res://.godot/uid_cache.bin  �}      �      Pz�]��U�F�q4���       res://code/CameraFollow.gd         �      I���wR�d<E$G��6�       res://code/Hitbox.gd�      �       ᱃�v��d�ed0�}       res://code/Hp.gdp      �       04�u�����=����       res://code/door.gd  p      <       ���\+R_8����M�       res://code/hurtbox.gd          A       �Y��*k�$צi� �       res://code/player.gdp      �      �8�5!6���n	���       res://code/switch.gd�      �        r����Z��aX�xL�=       res://icon.svg  @m      N      ]��s�9^w/�����       res://icon.svg.import   �i      �       =6R��iׂ���S��       res://project.binary�      1
      ϟ����
���a�D'    $   res://scenes/debug_label.tscn.remap �j      h       �i�.�i������       res://scenes/door.tscn.remap`l      a       �`�#6O�:��I�D4j�       res://scenes/game.tscn.remapk      a       Og��a�c��X07�I        res://scenes/hurtbox.tscn.remap �k      d       �m�>���`�.ڧ        res://scenes/player.tscn.remap  �k      c       2�A�Z͈�BJbB        res://scenes/switch.tscn.remap  �l      c       �]��l۬����nH���    6;�Vlist=Array[Dictionary]([{
"base": &"Node",
"class": &"Hp",
"icon": "",
"language": &"GDScript",
"path": "res://code/Hp.gd"
}, {
"base": &"Area3D",
"class": &"Hurtbox",
"icon": "",
"language": &"GDScript",
"path": "res://code/hurtbox.gd"
}])
��0)\�!��ؙ6��extends Camera3D

@export var target: Node3D
@export var offset = Vector3(0, 5, 4)
@export var move_speed = 5

func _process(delta: float) -> void:
	var target_position = target.global_position + offset
	var distance = target_position.distance_to(global_position)
	var move_delta = delta * move_speed * distance
	
	global_position = global_position.move_toward(target_position, move_delta)
	look_at(target.global_position)
L��:�G�extends Area3D

@export var hp: Hp

func _ready() -> void:
	area_entered.connect(on_area_entered)

func on_area_entered(area: Area3D):
	if area is Hurtbox:
		hp.damage(area.damage_amount)
���extends Node
class_name Hp

@export var max_hp = 3
@onready var hp = max_hp

signal death

func damage(amount: float):
	hp -= amount
	if hp <= 0:
		death.emit()
		hp = max_hp
�extends Area3D
class_name Hurtbox

@export var damage_amount = 1
�yxc��$A�v���extends CharacterBody3D

@export var max_speed = 5
@export var acceleration = 60

func _physics_process(delta: float) -> void:
	var move = get_move()
	var planar = Vector3(move.x, 0, -move.y)
	var move_target = planar * max_speed
	var move_delta = delta * acceleration
	
	velocity = velocity.move_toward(move_target, move_delta / 2)
	move_and_slide()
	velocity = velocity.move_toward(move_target, move_delta / 2)


func get_move() -> Vector2:
	var x = Input.get_axis("move_left", "move_right")
	var y = Input.get_axis("move_down", "move_up")
	return Vector2(x,y).normalized() 

func extend(value: Vector2, with: float) -> Vector3:
	return Vector3(value.x, value.y, with)


func _on_hp_death() -> void:
	global_position = Vector3.ZERO
	# todo better death
�Ȃ�uL��s3�extends Node3D

func open():
	$AnimationPlayer.play("open")
���extends Area3D

signal activate

func _ready() -> void:
	body_entered.connect(on_body_entered)
	
func on_body_entered(body: Node3D):
	activate.emit()
��J���d�RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script           local://PackedScene_kvxto �          PackedScene          	         names "         DebugLabel 
   transform 
   billboard    no_depth_test    text 
   font_size    outline_size    Label3D    	   variants            �?            K�9?�[0?    �[0�K�9?                              Player    @                node_count             nodes        ��������       ����                                                  conn_count              conns               node_paths              editable_instances              version             RSRC�i���C�IW�_�RSRC                     PackedScene            ��������                                            u      ..    Player    resource_local_to_scene    resource_name    custom_solver_bias    margin    plane    script    lightmap_size_hint 	   material    custom_aabb    flip_faces    add_uv2    uv2_padding    radius    radial_steps 	   sections    section_length    section_rings    cap_top    cap_bottom    curve    background_mode    background_color    background_energy_multiplier    background_intensity    background_canvas_max_layer    background_camera_feed_id    sky    sky_custom_fov    sky_rotation    ambient_light_source    ambient_light_color    ambient_light_sky_contribution    ambient_light_energy    reflected_light_source    tonemap_mode    tonemap_exposure    tonemap_white    ssr_enabled    ssr_max_steps    ssr_fade_in    ssr_fade_out    ssr_depth_tolerance    ssao_enabled    ssao_radius    ssao_intensity    ssao_power    ssao_detail    ssao_horizon    ssao_sharpness    ssao_light_affect    ssao_ao_channel_affect    ssil_enabled    ssil_radius    ssil_intensity    ssil_sharpness    ssil_normal_rejection    sdfgi_enabled    sdfgi_use_occlusion    sdfgi_read_sky_light    sdfgi_bounce_feedback    sdfgi_cascades    sdfgi_min_cell_size    sdfgi_cascade0_distance    sdfgi_max_distance    sdfgi_y_scale    sdfgi_energy    sdfgi_normal_bias    sdfgi_probe_bias    glow_enabled    glow_levels/1    glow_levels/2    glow_levels/3    glow_levels/4    glow_levels/5    glow_levels/6    glow_levels/7    glow_normalized    glow_intensity    glow_strength 	   glow_mix    glow_bloom    glow_blend_mode    glow_hdr_threshold    glow_hdr_scale    glow_hdr_luminance_cap    glow_map_strength 	   glow_map    fog_enabled    fog_light_color    fog_light_energy    fog_sun_scatter    fog_density    fog_aerial_perspective    fog_sky_affect    fog_height    fog_height_density    volumetric_fog_enabled    volumetric_fog_density    volumetric_fog_albedo    volumetric_fog_emission    volumetric_fog_emission_energy    volumetric_fog_gi_inject    volumetric_fog_anisotropy    volumetric_fog_length    volumetric_fog_detail_spread    volumetric_fog_ambient_inject    volumetric_fog_sky_affect -   volumetric_fog_temporal_reprojection_enabled ,   volumetric_fog_temporal_reprojection_amount    adjustment_enabled    adjustment_brightness    adjustment_contrast    adjustment_saturation    adjustment_color_correction 	   _bundled       Script    res://code/CameraFollow.gd ��������   PackedScene    res://scenes/player.tscn G�����`   PackedScene    res://scenes/hurtbox.tscn �h�<�:1A   PackedScene    res://scenes/switch.tscn ���Q=c�t   PackedScene    res://scenes/door.tscn v�=n���   #   local://WorldBoundaryShape3D_swsi7 �         local://TubeTrailMesh_2jr6u �         local://Environment_ktnj1          local://PackedScene_cbyv4 e         WorldBoundaryShape3D             TubeTrailMesh            �@                           ?         Environment                    ���>���>���>  �?$                  PackedScene    t      	         names "   !      Game    Node3D 	   Camera3D 
   transform    script    target    Player    DirectionalLight3D    Ground    StaticBody3D    CollisionShape3D    shape    World    Node    Hexagon    mesh 	   skeleton    MeshInstance3D 	   Hexagon2 	   Hexagon3 	   Hexagon4 	   Hexagon5 	   Hexagon6 	   Hexagon7    Hurtbox 	   Hurtbox2 	   Hurtbox3    WorldEnvironment    environment    Switch    Door    open 	   activate    	   variants            �?            ��?:�Z?    :�Z���?    w��@O�@                                     �?              �?              �?      �?         �?            탄>�Fw?    �Fw�탄>                           �?              �?              �?      ��                                �?              �?              �?Xs�@  ������     �?              �?              �?'1ZA  ������     �?              �?              �?���A  ����[�     �?              �?              �?ff�A  ����[�     �?              �?              �?.��A  ������     �?              �?              �?�=  ���w�              �?              �?              �?�*�?��?��i�     �?              �?              �?(՚���?����     �?              �?              �?(՚���?��I�                       �?              �?              �?  �A   ?  �@            1�;�      ��      �?      �?    1�;�  �A              node_count             nodes     �   ��������       ����                      ����                  @               ���                                 ����                     	      ����               
   
   ����                           ����                     ����                  	                    ����      
            	                    ����                  	                    ����                  	                    ����                  	                    ����                  	                    ����                  	               ���                           ���                           ���                                 ����                     ���                           ���                         conn_count             conns                                      node_paths              editable_instances              version             RSRCPg1��Fo�RSRC                     PackedScene            ��������                                            |      resource_local_to_scene    resource_name    custom_solver_bias    margin    radius    script    render_priority 
   next_pass    transparency    blend_mode 
   cull_mode    depth_draw_mode    no_depth_test    shading_mode    diffuse_mode    specular_mode    disable_ambient_light    vertex_color_use_as_albedo    vertex_color_is_srgb    albedo_color    albedo_texture    albedo_texture_force_srgb    albedo_texture_msdf 	   metallic    metallic_specular    metallic_texture    metallic_texture_channel 
   roughness    roughness_texture    roughness_texture_channel    emission_enabled 	   emission    emission_energy_multiplier    emission_operator    emission_on_uv2    emission_texture    normal_enabled    normal_scale    normal_texture    rim_enabled    rim 	   rim_tint    rim_texture    clearcoat_enabled 
   clearcoat    clearcoat_roughness    clearcoat_texture    anisotropy_enabled    anisotropy    anisotropy_flowmap    ao_enabled    ao_light_affect    ao_texture 
   ao_on_uv2    ao_texture_channel    heightmap_enabled    heightmap_scale    heightmap_deep_parallax    heightmap_flip_tangent    heightmap_flip_binormal    heightmap_texture    heightmap_flip_texture    subsurf_scatter_enabled    subsurf_scatter_strength    subsurf_scatter_skin_mode    subsurf_scatter_texture &   subsurf_scatter_transmittance_enabled $   subsurf_scatter_transmittance_color &   subsurf_scatter_transmittance_texture $   subsurf_scatter_transmittance_depth $   subsurf_scatter_transmittance_boost    backlight_enabled 
   backlight    backlight_texture    refraction_enabled    refraction_scale    refraction_texture    refraction_texture_channel    detail_enabled    detail_mask    detail_blend_mode    detail_uv_layer    detail_albedo    detail_normal 
   uv1_scale    uv1_offset    uv1_triplanar    uv1_triplanar_sharpness    uv1_world_triplanar 
   uv2_scale    uv2_offset    uv2_triplanar    uv2_triplanar_sharpness    uv2_world_triplanar    texture_filter    texture_repeat    disable_receive_shadows    shadow_to_opacity    billboard_mode    billboard_keep_scale    grow    grow_amount    fixed_size    use_point_size    point_size    use_particle_trails    proximity_fade_enabled    proximity_fade_distance    msdf_pixel_range    msdf_outline_size    distance_fade_mode    distance_fade_min_distance    distance_fade_max_distance    lightmap_size_hint 	   material    custom_aabb    flip_faces    add_uv2    uv2_padding    height    radial_segments    rings    is_hemisphere 	   _bundled       Script    res://code/hurtbox.gd ��������   PackedScene    res://scenes/debug_label.tscn [�`�
��7      local://SphereShape3D_pi1ob �      !   local://StandardMaterial3D_pkjtr �         local://SphereMesh_ri1f4 �         local://PackedScene_0fjpq          SphereShape3D             StandardMaterial3D          ��x?    ���>  �?         SphereMesh             PackedScene    {      	         names "   
      Hurtbox    script    Area3D    CollisionShape3D    shape    MeshInstance3D    material_override    mesh    DebugLabel    text    	   variants                                                            Hurtbox       node_count             nodes     &   ��������       ����                            ����                           ����                           ���         	                conn_count              conns               node_paths              editable_instances              version             RSRC�}%:RSRC                     PackedScene            ��������                                                  ..    Hp    resource_local_to_scene    resource_name    lightmap_size_hint 	   material    custom_aabb    flip_faces    add_uv2    uv2_padding    radius    height    radial_segments    rings    script    custom_solver_bias    margin 	   _bundled       Script    res://code/player.gd ��������   PackedScene    res://scenes/debug_label.tscn [�`�
��7   Script    res://code/Hitbox.gd ��������   Script    res://code/Hp.gd ��������      local://CapsuleMesh_a6ck7 �         local://CapsuleShape3D_1rvxm �         local://CapsuleShape3D_rvqs5 (         local://PackedScene_n2uhb S         CapsuleMesh          ff�?         CapsuleShape3D          ff�?         CapsuleShape3D    
      ��?         PackedScene          	         names "         Player    script 
   max_speed    CharacterBody3D    MeshInstance3D    mesh    DebugLabel    CollisionShape3D    shape    Hitbox    hp    Area3D    Hp    Node    _on_hp_death    death    	   variants    	                                                                                             node_count             nodes     A   ��������       ����                                  ����                    ���                            ����                        	   ����         
  @                    ����                           ����                   conn_count             conns                                      node_paths              editable_instances              version             RSRC=��\RSRC                     PackedScene            ��������                                            �      .. 	   Blockage    resource_local_to_scene    resource_name    render_priority 
   next_pass    transparency    blend_mode 
   cull_mode    depth_draw_mode    no_depth_test    shading_mode    diffuse_mode    specular_mode    disable_ambient_light    vertex_color_use_as_albedo    vertex_color_is_srgb    albedo_color    albedo_texture    albedo_texture_force_srgb    albedo_texture_msdf 	   metallic    metallic_specular    metallic_texture    metallic_texture_channel 
   roughness    roughness_texture    roughness_texture_channel    emission_enabled 	   emission    emission_energy_multiplier    emission_operator    emission_on_uv2    emission_texture    normal_enabled    normal_scale    normal_texture    rim_enabled    rim 	   rim_tint    rim_texture    clearcoat_enabled 
   clearcoat    clearcoat_roughness    clearcoat_texture    anisotropy_enabled    anisotropy    anisotropy_flowmap    ao_enabled    ao_light_affect    ao_texture 
   ao_on_uv2    ao_texture_channel    heightmap_enabled    heightmap_scale    heightmap_deep_parallax    heightmap_flip_tangent    heightmap_flip_binormal    heightmap_texture    heightmap_flip_texture    subsurf_scatter_enabled    subsurf_scatter_strength    subsurf_scatter_skin_mode    subsurf_scatter_texture &   subsurf_scatter_transmittance_enabled $   subsurf_scatter_transmittance_color &   subsurf_scatter_transmittance_texture $   subsurf_scatter_transmittance_depth $   subsurf_scatter_transmittance_boost    backlight_enabled 
   backlight    backlight_texture    refraction_enabled    refraction_scale    refraction_texture    refraction_texture_channel    detail_enabled    detail_mask    detail_blend_mode    detail_uv_layer    detail_albedo    detail_normal 
   uv1_scale    uv1_offset    uv1_triplanar    uv1_triplanar_sharpness    uv1_world_triplanar 
   uv2_scale    uv2_offset    uv2_triplanar    uv2_triplanar_sharpness    uv2_world_triplanar    texture_filter    texture_repeat    disable_receive_shadows    shadow_to_opacity    billboard_mode    billboard_keep_scale    grow    grow_amount    fixed_size    use_point_size    point_size    use_particle_trails    proximity_fade_enabled    proximity_fade_distance    msdf_pixel_range    msdf_outline_size    distance_fade_mode    distance_fade_min_distance    distance_fade_max_distance    script    lightmap_size_hint 	   material    custom_aabb    flip_faces    add_uv2    uv2_padding    size    subdivide_width    subdivide_height    subdivide_depth    custom_solver_bias    margin    data    backface_collision    length 
   loop_mode    step    tracks/0/type    tracks/0/imported    tracks/0/enabled    tracks/0/path    tracks/0/interp    tracks/0/loop_wrap    tracks/0/keys    _data 	   _bundled       Script    res://code/door.gd ��������   PackedScene    res://scenes/debug_label.tscn [�`�
��7   !   local://StandardMaterial3D_ppchb (         local://BoxMesh_vo6f6 c         local://BoxShape3D_h0jn8 {         local://BoxMesh_22rou �      $   local://ConcavePolygonShape3D_wiqey �         local://Animation_4m0bu �         local://AnimationLibrary_ar1g8 [         local://PackedScene_dhva1 �         StandardMaterial3D          ��/?���; �}?  �?o         BoxMesh    o         BoxShape3D    v      ffF@   @333?o         BoxMesh    o         ConcavePolygonShape3D    |   #   $      �   ?   ?   ?   ?   ?   �   �   ?   ?   ?   ?   ?   �   ?   �   �   ?   ?   ?   �   �   ?   �   ?   �   �   �   ?   �   �   �   �   ?   �   �   ?   ?   ?   ?   ?   �   ?   �   ?   ?   ?   �   ?   �   �   ?   �   ?   �   ?   �   �   ?   ?   �   �   �   �   ?   ?   �   �   ?   �   �   �   ?   ?   ?   �   ?   ?   ?   ?   �   �   ?   ?   �   ?   �   ?   ?   �   �   �   ?   ?   �   ?   �   �   �   ?   �   ?   ?   �   �   �   �   �o      
   Animation 	            open �         position_3d �          �         �            �         �         �   !   
         �?      �?      �?  �?      @@    o         AnimationLibrary    �               open          o         PackedScene    �      	         names "         Door    script    Node3D 	   Blockage 
   transform    freeze    freeze_mode    RigidBody3D    MeshInstance3D    material_override    mesh 	   skeleton    CollisionShape3D    shape    DebugLabel    text    Visuals    StaticBody3D    MeshInstance3D2    MeshInstance3D3    AnimationPlayer 
   libraries    	   variants                      �?              �?              �?      �?                   ffF@               @            333?                                                                     Door      �?               @              �?   �  �?                           �?               @              �?   @  �?         �@              �?              �?       @                                node_count             nodes     �   ��������       ����                            ����                                      ����         	      
                             ����                    ���   	         
                     ����                     ����         
                       ����                     ����                          ����         
          	             ����        
             ����                          ����         
                       ����                     ����                           ����                   conn_count              conns               node_paths              editable_instances              version       o      RSRCԘ���Wv�RSRC                     PackedScene            ��������                                            {      resource_local_to_scene    resource_name    custom_solver_bias    margin    size    script    render_priority 
   next_pass    transparency    blend_mode 
   cull_mode    depth_draw_mode    no_depth_test    shading_mode    diffuse_mode    specular_mode    disable_ambient_light    vertex_color_use_as_albedo    vertex_color_is_srgb    albedo_color    albedo_texture    albedo_texture_force_srgb    albedo_texture_msdf 	   metallic    metallic_specular    metallic_texture    metallic_texture_channel 
   roughness    roughness_texture    roughness_texture_channel    emission_enabled 	   emission    emission_energy_multiplier    emission_operator    emission_on_uv2    emission_texture    normal_enabled    normal_scale    normal_texture    rim_enabled    rim 	   rim_tint    rim_texture    clearcoat_enabled 
   clearcoat    clearcoat_roughness    clearcoat_texture    anisotropy_enabled    anisotropy    anisotropy_flowmap    ao_enabled    ao_light_affect    ao_texture 
   ao_on_uv2    ao_texture_channel    heightmap_enabled    heightmap_scale    heightmap_deep_parallax    heightmap_flip_tangent    heightmap_flip_binormal    heightmap_texture    heightmap_flip_texture    subsurf_scatter_enabled    subsurf_scatter_strength    subsurf_scatter_skin_mode    subsurf_scatter_texture &   subsurf_scatter_transmittance_enabled $   subsurf_scatter_transmittance_color &   subsurf_scatter_transmittance_texture $   subsurf_scatter_transmittance_depth $   subsurf_scatter_transmittance_boost    backlight_enabled 
   backlight    backlight_texture    refraction_enabled    refraction_scale    refraction_texture    refraction_texture_channel    detail_enabled    detail_mask    detail_blend_mode    detail_uv_layer    detail_albedo    detail_normal 
   uv1_scale    uv1_offset    uv1_triplanar    uv1_triplanar_sharpness    uv1_world_triplanar 
   uv2_scale    uv2_offset    uv2_triplanar    uv2_triplanar_sharpness    uv2_world_triplanar    texture_filter    texture_repeat    disable_receive_shadows    shadow_to_opacity    billboard_mode    billboard_keep_scale    grow    grow_amount    fixed_size    use_point_size    point_size    use_particle_trails    proximity_fade_enabled    proximity_fade_distance    msdf_pixel_range    msdf_outline_size    distance_fade_mode    distance_fade_min_distance    distance_fade_max_distance    lightmap_size_hint 	   material    custom_aabb    flip_faces    add_uv2    uv2_padding    subdivide_width    subdivide_height    subdivide_depth 	   _bundled       Script    res://code/switch.gd ��������   PackedScene    res://scenes/debug_label.tscn [�`�
��7      local://BoxShape3D_k27tm �      !   local://StandardMaterial3D_md8eo �         local://BoxMesh_ys3s1 �         local://PackedScene_6ctl7          BoxShape3D             StandardMaterial3D              ��?��1?  �?         BoxMesh             PackedScene    z      	         names "   
      Switch    script    Area3D    CollisionShape3D    shape    MeshInstance3D    material_override    mesh    DebugLabel    text    	   variants                                                            Switch       node_count             nodes     &   ��������       ����                            ����                           ����                           ���         	                conn_count              conns               node_paths              editable_instances              version             RSRCH����GST2   �   �      ����               � �        $  RIFF  WEBPVP8L  /������!"2�H�l�m�l�H�Q/H^��޷������d��g�(9�$E�Z��ߓ���'3���ض�U�j��$�՜ʝI۶c��3� [���5v�ɶ�=�Ԯ�m���mG�����j�m�m�_�XV����r*snZ'eS�����]n�w�Z:G9�>B�m�It��R#�^�6��($Ɓm+q�h��6�5��I��'���F�"ɹ{�p����	"+d������M�q��� .^>и��6��a�q��gD�h:L��A�\D�
�\=k�(���_d2W��dV#w�o�	����I]�q5�*$8Ѡ$G9��lH]��c�LX���ZӞ3֌����r�2�2ؽL��d��l��1�.��u�5�!�]2�E��`+�H&�T�D�ި7P��&I�<�ng5�O!��͙������n�
ؚѠ:��W��J�+�����6��ɒ�HD�S�z�����8�&�kF�j7N�;YK�$R�����]�VٶHm���)�rh+���ɮ�d�Q��
����]	SU�9�B��fQm]��~Z�x.�/��2q���R���,snV{�7c,���p�I�kSg�[cNP=��b���74pf��)w<:Ŋ��7j0���{4�R_��K܅1�����<߁����Vs)�j�c8���L�Um% �*m/�*+ �<����S��ɩ��a��?��F�w��"�`���BrV�����4�1�*��F^���IKJg`��MK������!iVem�9�IN3;#cL��n/�i����q+������trʈkJI-����R��H�O�ܕ����2
���1&���v�ֳ+Q4蝁U
���m�c�����v% J!��+��v%�M�Z��ꚺ���0N��Q2�9e�qä�U��ZL��䜁�u_(���I؛j+0Ɩ�Z��}�s*�]���Kܙ����SG��+�3p�Ei�,n&���>lgC���!qյ�(_e����2ic3iڦ�U��j�q�RsUi����)w��Rt�=c,if:2ɛ�1�6I�����^^UVx*e��1�8%��DzR1�R'u]Q�	�rs��]���"���lW���a7]o�����~P���W��lZ�+��>�j^c�+a��4���jDNὗ�-��8'n�?e��hҴ�iA�QH)J�R�D�̰oX?ؿ�i�#�?����g�к�@�e�=C{���&��ށ�+ڕ��|h\��'Ч_G�F��U^u2T��ӁQ%�e|���p ���������k	V����eq3���8 � �K�w|�Ɗ����oz-V���s ����"�H%* �	z��xl�4��u�"�Hk�L��P���i��������0�H!�g�Ɲ&��|bn�������]4�"}�"���9;K���s��"c. 8�6�&��N3R"p�pI}��*G��3@�`��ok}��9?"@<�����sv� ���Ԣ��Q@,�A��P8��2��B��r��X��3�= n$�^ ������<ܽ�r"�1 �^��i��a �(��~dp-V�rB�eB8��]
�p ZA$\3U�~B�O ��;��-|��
{�V��6���o��D��D0\R��k����8��!�I�-���-<��/<JhN��W�1���H�#2:E(*�H���{��>��&!��$| �~�\#��8�> �H??�	E#��VY���t7���> 6�"�&ZJ��p�C_j���	P:�a�G0 �J��$�M���@�Q��[z��i��~q�1?�E�p�������7i���<*�,b�е���Z����N-
��>/.�g�'R�e��K�)"}��K�U�ƹ�>��#�rw߶ȑqF�l�Ο�ͧ�e�3�[䴻o�L~���EN�N�U9�������w��G����B���t��~�����qk-ί�#��Ξ����κ���Z��u����;{�ȴ<������N�~���hA+�r ���/����~o�9>3.3�s������}^^�_�����8���S@s%��]K�\�)��B�w�Uc۽��X�ǧ�;M<*)�ȝ&����~$#%�q����������Q�4ytz�S]�Y9���ޡ$-5���.���S_��?�O/���]�7�;��L��Zb�����8���Guo�[''�،E%���;����#Ɲ&f��_1�߃fw�!E�BX���v��+�p�DjG��j�4�G�Wr����� 3�7��� ������(����"=�NY!<l��	mr�՚���Jk�mpga�;��\)6�*k�'b�;	�V^ݨ�mN�f�S���ն�a���ϡq�[f|#U����^����jO/���9͑Z��������.ɫ�/���������I�D��R�8�5��+��H4�N����J��l�'�כ�������H����%"��Z�� ����`"��̃��L���>ij~Z,qWXo�}{�y�i�G���sz�Q�?�����������lZdF?�]FXm�-r�m����Ф:�З���:}|x���>e������{�0���v��Gş�������u{�^��}hR���f�"����2�:=��)�X\[���Ů=�Qg��Y&�q�6-,P3�{�vI�}��f��}�~��r�r�k�8�{���υ����O�֌ӹ�/�>�}�t	��|���Úq&���ݟW����ᓟwk�9���c̊l��Ui�̸~��f��i���_�j�S-|��w�R�<Lծd�ٞ,9�8��I�Ү�6 *3�ey�[�Ԗ�k��R���<������
g�R���~��a��
��ʾiI9u����*ۏ�ü�<mԤ���T��Amf�B���ĝq��iS��4��yqm-w�j��̝qc�3�j�˝mqm]P��4���8i�d�u�΄ݿ���X���KG.�?l�<�����!��Z�V�\8��ʡ�@����mK�l���p0/$R�����X�	Z��B�]=Vq �R�bk�U�r�[�� ���d�9-�:g I<2�Oy�k���������H�8����Z�<t��A�i��#�ӧ0"�m�:X�1X���GҖ@n�I�겦�CM��@������G"f���A$�t�oyJ{θxOi�-7�F�n"�eS����=ɞ���A��Aq�V��e����↨�����U3�c�*�*44C��V�:4�ĳ%�xr2V�_)^�a]\dZEZ�C 
�*V#��	NP��\�(�4^sh8T�H��P�_��}���a[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://c1se08mvki4rr"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
 cd�c�z�7{9W^8t�[remap]

path="res://.godot/exported/133200997/export-1d5684106cc3dc1520a7c63bbf4f520c-debug_label.scn"
����:[remap]

path="res://.godot/exported/133200997/export-c2a7af834e91ff64325daddf58e45dc0-game.scn"
�"���tI%����:[remap]

path="res://.godot/exported/133200997/export-77e1e97968eceda4c007e89777985a50-hurtbox.scn"
4���U�A�[remap]

path="res://.godot/exported/133200997/export-234fb6894ec6226e856ab7f825500d3d-player.scn"
���d7��nunS[remap]

path="res://.godot/exported/133200997/export-3370694a3d56567dea5c3bf0058a536d-door.scn"
X�1�JؚX���[remap]

path="res://.godot/exported/133200997/export-7d7682dd9205a180ef2afa6af5fa7410-switch.scn"
Y�4��'�Љ�v�<svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><g transform="translate(32 32)"><path d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99z" fill="#363d52"/><path d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99zm0 4h96c6.64 0 12 5.35 12 11.99v95.98c0 6.64-5.35 11.99-12 11.99h-96c-6.64 0-12-5.35-12-11.99v-95.98c0-6.64 5.36-11.99 12-11.99z" fill-opacity=".4"/></g><g stroke-width="9.92746" transform="matrix(.10073078 0 0 .10073078 12.425923 2.256365)"><path d="m0 0s-.325 1.994-.515 1.976l-36.182-3.491c-2.879-.278-5.115-2.574-5.317-5.459l-.994-14.247-27.992-1.997-1.904 12.912c-.424 2.872-2.932 5.037-5.835 5.037h-38.188c-2.902 0-5.41-2.165-5.834-5.037l-1.905-12.912-27.992 1.997-.994 14.247c-.202 2.886-2.438 5.182-5.317 5.46l-36.2 3.49c-.187.018-.324-1.978-.511-1.978l-.049-7.83 30.658-4.944 1.004-14.374c.203-2.91 2.551-5.263 5.463-5.472l38.551-2.75c.146-.01.29-.016.434-.016 2.897 0 5.401 2.166 5.825 5.038l1.959 13.286h28.005l1.959-13.286c.423-2.871 2.93-5.037 5.831-5.037.142 0 .284.005.423.015l38.556 2.75c2.911.209 5.26 2.562 5.463 5.472l1.003 14.374 30.645 4.966z" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 919.24059 771.67186)"/><path d="m0 0v-47.514-6.035-5.492c.108-.001.216-.005.323-.015l36.196-3.49c1.896-.183 3.382-1.709 3.514-3.609l1.116-15.978 31.574-2.253 2.175 14.747c.282 1.912 1.922 3.329 3.856 3.329h38.188c1.933 0 3.573-1.417 3.855-3.329l2.175-14.747 31.575 2.253 1.115 15.978c.133 1.9 1.618 3.425 3.514 3.609l36.182 3.49c.107.01.214.014.322.015v4.711l.015.005v54.325c5.09692 6.4164715 9.92323 13.494208 13.621 19.449-5.651 9.62-12.575 18.217-19.976 26.182-6.864-3.455-13.531-7.369-19.828-11.534-3.151 3.132-6.7 5.694-10.186 8.372-3.425 2.751-7.285 4.768-10.946 7.118 1.09 8.117 1.629 16.108 1.846 24.448-9.446 4.754-19.519 7.906-29.708 10.17-4.068-6.837-7.788-14.241-11.028-21.479-3.842.642-7.702.88-11.567.926v.006c-.027 0-.052-.006-.075-.006-.024 0-.049.006-.073.006v-.006c-3.872-.046-7.729-.284-11.572-.926-3.238 7.238-6.956 14.642-11.03 21.479-10.184-2.264-20.258-5.416-29.703-10.17.216-8.34.755-16.331 1.848-24.448-3.668-2.35-7.523-4.367-10.949-7.118-3.481-2.678-7.036-5.24-10.188-8.372-6.297 4.165-12.962 8.079-19.828 11.534-7.401-7.965-14.321-16.562-19.974-26.182 4.4426579-6.973692 9.2079702-13.9828876 13.621-19.449z" fill="#478cbf" transform="matrix(4.162611 0 0 -4.162611 104.69892 525.90697)"/><path d="m0 0-1.121-16.063c-.135-1.936-1.675-3.477-3.611-3.616l-38.555-2.751c-.094-.007-.188-.01-.281-.01-1.916 0-3.569 1.406-3.852 3.33l-2.211 14.994h-31.459l-2.211-14.994c-.297-2.018-2.101-3.469-4.133-3.32l-38.555 2.751c-1.936.139-3.476 1.68-3.611 3.616l-1.121 16.063-32.547 3.138c.015-3.498.06-7.33.06-8.093 0-34.374 43.605-50.896 97.781-51.086h.066.067c54.176.19 97.766 16.712 97.766 51.086 0 .777.047 4.593.063 8.093z" fill="#478cbf" transform="matrix(4.162611 0 0 -4.162611 784.07144 817.24284)"/><path d="m0 0c0-12.052-9.765-21.815-21.813-21.815-12.042 0-21.81 9.763-21.81 21.815 0 12.044 9.768 21.802 21.81 21.802 12.048 0 21.813-9.758 21.813-21.802" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 389.21484 625.67104)"/><path d="m0 0c0-7.994-6.479-14.473-14.479-14.473-7.996 0-14.479 6.479-14.479 14.473s6.483 14.479 14.479 14.479c8 0 14.479-6.485 14.479-14.479" fill="#414042" transform="matrix(4.162611 0 0 -4.162611 367.36686 631.05679)"/><path d="m0 0c-3.878 0-7.021 2.858-7.021 6.381v20.081c0 3.52 3.143 6.381 7.021 6.381s7.028-2.861 7.028-6.381v-20.081c0-3.523-3.15-6.381-7.028-6.381" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 511.99336 724.73954)"/><path d="m0 0c0-12.052 9.765-21.815 21.815-21.815 12.041 0 21.808 9.763 21.808 21.815 0 12.044-9.767 21.802-21.808 21.802-12.05 0-21.815-9.758-21.815-21.802" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 634.78706 625.67104)"/><path d="m0 0c0-7.994 6.477-14.473 14.471-14.473 8.002 0 14.479 6.479 14.479 14.473s-6.477 14.479-14.479 14.479c-7.994 0-14.471-6.485-14.471-14.479" fill="#414042" transform="matrix(4.162611 0 0 -4.162611 656.64056 631.05679)"/></g></svg>
��   [�`�
��7   res://scenes/debug_label.tscn��s�>L?   res://scenes/game.tscn�h�<�:1A   res://scenes/hurtbox.tscnG�����`   res://scenes/player.tscn���Q=c�t   res://scenes/switch.tscnG�rl��\   res://icon.svgv�=n���   res://scenes/door.tscn�: �M�/   res://docs/index.icon.pngkÌ�Yb%   res://docs/index.apple-touch-icon.pngGMEkui   res://docs/index.png�y�L<&�;   res://docs/acagame.icon.png���2�HB2'   res://docs/acagame.apple-touch-icon.png>�Q=��   res://docs/acagame.png}�=Ry!ECFG
      application/config/name         Acagame    application/run/main_scene          res://scenes/game.tscn     application/config/features(   "         4.0    GL Compatibility       application/config/icon         res://icon.svg     input/move_left�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   A   	   key_label             unicode    a      echo          script         input/move_right�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   D   	   key_label             unicode    d      echo          script         input/move_up�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   W   	   key_label             unicode    w      echo          script         input/move_down�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   S   	   key_label             unicode    s      echo          script         input/attack�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode       	   key_label             unicode           echo          script      #   rendering/renderer/rendering_method         gl_compatibility$3~�tB�8�P��#