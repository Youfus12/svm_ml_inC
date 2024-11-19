#include "../include/ali_hamo.h"

void renderAlgorithmVisualization(SDL_Renderer* renderer) {
    // Implement Bayer algorithm visualization
    SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
    SDL_Rect rect = {100, 100, 200, 200};
    SDL_RenderFillRect(renderer, &rect);
}
