#include <stdio.h>

#define AXISSIZE 1000
#define VISITED 1

int main()
{
    int c, x, y, visitedCoordinate, rx, ry;
    int axis[AXISSIZE][AXISSIZE];

    visitedCoordinate = 1;

    for (x = 0; x < AXISSIZE; x++)
        for (y = 0; y < AXISSIZE; y++)
            axis[x][y] = 0;
    
    rx = ry = x = y = 500;
    axis[x][y] = VISITED;


    while ((c = getchar()) != EOF) {
        if (c == '^')
            y += 1;
        else if (c == '>')
            x += 1;
        else if (c == 'v' || c == 'V')
            y -= 1;
        else if (c == '<')
            x -=1;

        if (axis[x][y] != VISITED) {
            axis[x][y] = VISITED; 
            visitedCoordinate++;
        }
            
        c = getchar();

        if (c == '^')
            ry += 1;
        else if (c == '>')
            rx += 1;
        else if (c == 'v' || c == 'V')
            ry -= 1;
        else if (c == '<')
            rx -=1;

        if (axis[rx][ry] != VISITED) {
            axis[rx][ry] = VISITED; 
            visitedCoordinate++;
        }
    }
printf("%d\n", visitedCoordinate);
    return 0;
}
