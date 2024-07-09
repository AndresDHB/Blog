<?php

namespace Database\Factories;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Post>
 */
class PostFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $publicado = $this->faker->boolean(); // 0 o 1 aleatorio

        return [
            'titulo' => $this->faker->word(),
            'slug' => $this->faker->slug(), // Generamos un slug a partir del título
            'cuerpo' => $this->faker->paragraphs(3, true), // 3 párrafos de texto
            'resumen' => $this->faker->text(400),
            'image_path' => $this->faker->imageUrl(), // URL de imagen aleatoria
            'publicado' => $publicado,
            'category_id' => $this->faker->numberBetween(1, 5),
            'user_id' => 1, 
            'publicado_at' => $publicado ? Carbon::now() : null, // Fecha solo si publicado
        ];
    }
}
