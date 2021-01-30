//Checar tecla
tecla_esquerda = keyboard_check( vk_left );
tecla_direita = keyboard_check( vk_right );
tecla_pulo = keyboard_check_pressed( vk_space ) || keyboard_check_pressed( vk_up );
tecla_interagir = keyboard_check( ord("C"));

//Calcular movimento
var movimento = tecla_direita - tecla_esquerda;

mov_horizontal = movimento * velocidade;

mov_vertical = mov_vertical + gravidade;

if ( place_meeting( x, y + 1, oMap)) && (tecla_pulo)
	mov_vertical = -10;
	
//Colisão horizontal
if ( place_meeting( x + mov_horizontal, y, oMap))
{
	while ( !place_meeting( x + sign(mov_horizontal), y, oMap))
		x = x + sign( mov_horizontal );
		
	mov_horizontal = 0;
}
x = x + mov_horizontal;

//Colisão vertical
if ( place_meeting( x, y + mov_vertical, oMap))
{
	while ( !place_meeting( x, y + sign( mov_vertical ), oMap))
		y = y + sign ( mov_vertical );
		
	mov_vertical = 0;
}
y = y + mov_vertical;