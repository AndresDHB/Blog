<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('posts', function (Blueprint $table) {
            $table->integer('id', true);
            $table->string('titulo');
            $table->string('slug')->unique();
            $table->mediumText('cuerpo');
            $table->text('resumen');
            $table->string('image_path')->nullable();
            $table->char('publicado')->default(0);
            $table->tinyInteger('category_id');
            $table->foreign('category_id')->references('id')->on('categories');
            $table->foreignId('user_id')->constrained();
            $table->timestamp('publicado_at')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('posts');
    }
};
