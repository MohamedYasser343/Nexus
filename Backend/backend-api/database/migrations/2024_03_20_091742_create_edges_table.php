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
        Schema::create('edges', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('mindmap_id')->index();
            $table->unsignedBigInteger('from_node_id')->index();
            $table->unsignedBigInteger('to_node_id')->index();
            $table->timestamps();

            $table->foreign('mindmap_id')->references('id')->on('mindmaps')->onDelete('cascade');
            $table->foreign('from_node_id')->references('id')->on('nodes')->onDelete('cascade');
            $table->foreign('to_node_id')->references('id')->on('nodes')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('edges');
    }
};
