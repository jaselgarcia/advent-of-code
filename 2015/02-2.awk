BEGIN {
FS="x"
}
{
    LENGTH = $1; 
    WIDTH = $2; 
    HEIGHT = $3; 
    SIDE1 = LENGTH * WIDTH; 
    SIDE2 = WIDTH * HEIGHT; 
    SIDE3 = HEIGHT * LENGTH; 
    
    if (SIDE1< SIDE2) {
        MIN = SIDE1; 
        RIBBON = 2 * (LENGTH + WIDTH)} 
    else {
        MIN = SIDE2; 
        RIBBON = 2 * (WIDTH + HEIGHT)}; 
    if (SIDE3 < MIN) {
        MIN = SIDE3; 
        RIBBON = 2 * (HEIGHT + LENGTH)}; 

        AREA = 2 * (SIDE1 + SIDE2 + SIDE3) + MIN; 
        TOTAL = TOTAL + AREA; 
        BOW = LENGTH * WIDTH * HEIGHT; 
        TOTALRIBBON = TOTALRIBBON + RIBBON + BOW} 

END {
    print TOTALRIBBON
}
