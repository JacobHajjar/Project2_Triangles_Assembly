//  Author information
//  Author name: Jacob Hajjar
//  CPSC240-1
//  Author email: hajjarj@csu.fullerton.edu
//  Program name: Welcome Pythagoras
#include <stdio.h>

// Declaration of area function in assembly.
double triangle();

int main(){
    printf("Welcome to the Right Triangles Program by Jacob Hajjar\n");
    printf("The main function recieved %f and plans to keep it.\n", triangle());
    printf("Zero wil be returned to the operating system\n");
    return 0;
}