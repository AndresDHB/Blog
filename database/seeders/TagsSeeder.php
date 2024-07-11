<?php

namespace Database\Seeders;

use App\Models\Tag;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class TagsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $tags = ['#DesarrolloWeb', '#Programación', '#Backend', '#Frontend', '#DevOps', '#FullStack', '#JavaScript', '#Mysql', '#OpenSource', '#Tech'];

        foreach ($tags as $tag) {
            Tag::create([
                'nombre' => $tag
            ]);
        }
    }
}
