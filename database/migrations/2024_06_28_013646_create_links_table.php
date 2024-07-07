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
        Schema::create('links', function (Blueprint $table) {
            $table->smallInteger('id', true);
            $table->string('name', 70);
            $table->string('url', 70)->nullable();
            $table->string('icon', 100);
            $table->string('active', 100)->nullable();
            $table->string('tipo', 5);
            $table->string('tipo_nombre', 70);
            $table->string('orden', 3);
            $table->char('estado', 1)->default(1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('links');
    }
};
