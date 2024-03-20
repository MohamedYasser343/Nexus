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
        Schema::create('nodes', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('mindmap_id')->index();
            $table->string('title');
            $table->string('notes')->nullable();
            $table->string('image')->nullable();
            $table->integer('x_position')->default(0);
            $table->integer('y_position')->default(0);
            $table->timestamps();

            $table->foreign('mindmap_id')->references('id')->on('mindmaps')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('nodes');
    }
};
