#include "../include/fadel_abderrahmen.h"

void renderMainDisplay(SDL_Renderer* renderer) {
    // Implement main display visualization
    SDL_SetRenderDrawColor(renderer, 0, 255, 0, 255);
    SDL_Rect rect = {150, 150, 100, 100};
    SDL_RenderFillRect(renderer, &rect);
}
