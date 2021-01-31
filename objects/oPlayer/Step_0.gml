//Checar tecla
tecla_esquerda = keyboard_check( vk_left );
tecla_direita = keyboard_check( vk_right );
tecla_pulo = keyboard_check_pressed( vk_space ) || keyboard_check_pressed( vk_up );
tecla_interagir = keyboard_check( ord("C"));

//Calcular movimento
var movimento = tecla_direita - tecla_esquerda;

mov_horizontal = movimento * velocidade;

mov_vertical = mov_vertical + gravidade;

if ( place_meeting( x, y + 1, oWall)) && (tecla_pulo)
{
	mov_vertical = random_range(-3, -10);
}
	
//Colisão horizontal
if ( place_meeting( x + mov_horizontal, y, oWall))
{
	while ( !place_meeting( x + sign(mov_horizontal), y, oWall))
		x = x + sign( mov_horizontal );
		
	mov_horizontal = 0;
}
x = x + mov_horizontal;

//Colisão vertical
if ( place_meeting( x, y + mov_vertical, oWall))
{
	while ( !place_meeting( x, y + sign( mov_vertical ), oWall))
		y = y + sign ( mov_vertical );
		
	mov_vertical = 0;
}
y = y + mov_vertical;

//Animation
if (!place_meeting(x,y+1,oWall))
{
	sprite_index = sPlayerA;
	image_speed = 0;
	if (sign(mov_vertical) > 0) image_index = 1; else image_index = 0;
}
else
{
	image_speed = 1;
	if (mov_horizontal == 0)
	{
		sprite_index = sPlayer;
	}
	else
	{
		sprite_index = sPlayerR;
	}
}

if (mov_horizontal != 0) image_xscale = sign(mov_horizontal);