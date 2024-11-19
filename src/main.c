#include <stdio.h>
#include <stdlib.h>
#include "../include/ali_hamo.h"
#include "../include/fadel_abderrahmen.h"

int main()
{
    // Initialize SDL
    if (SDL_Init(SDL_INIT_VIDEO) != 0)
    {
        printf("SDL Initialization Error: %s\n", SDL_GetError());
        return 1;
    }

    // Create three windows
    SDL_Window *window1 = SDL_CreateWindow("Algorithm Visualization", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 640, 480, SDL_WINDOW_SHOWN);
    SDL_Window *window2 = SDL_CreateWindow("Main Display", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 640, 480, SDL_WINDOW_SHOWN);

    SDL_Renderer *renderer1 = SDL_CreateRenderer(window1, -1, SDL_RENDERER_ACCELERATED);
    SDL_Renderer *renderer2 = SDL_CreateRenderer(window2, -1, SDL_RENDERER_ACCELERATED);

    // Event loop
    int quit = 0;
    SDL_Event e;

    while (!quit)
    {
        // Handle events
        while (SDL_PollEvent(&e))
        {
            if (e.type == SDL_QUIT)
                quit = 1;
        }

        // Clear renderers
        SDL_SetRenderDrawColor(renderer1, 0, 0, 0, 255);
        SDL_RenderClear(renderer1);
        renderAlgorithmVisualization(renderer1); // Call Team Member 2's function
        SDL_RenderPresent(renderer1);

        SDL_SetRenderDrawColor(renderer2, 255, 255, 255, 255);
        SDL_RenderClear(renderer2);
        renderMainDisplay(renderer2); // Call Team Member 3's function
        SDL_RenderPresent(renderer2);
    }

    // Cleanup
    SDL_DestroyRenderer(renderer1);
    SDL_DestroyRenderer(renderer2);
    SDL_DestroyWindow(window1);
    SDL_DestroyWindow(window2);
    SDL_Quit();

    return 0;
}
