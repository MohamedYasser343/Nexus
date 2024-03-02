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
        Schema::create('mindmap', function (Blueprint $table){

            $table->id();
            $table->string('title')->default('untitled');
            $table->json('content')->nullable();
            $table->json('connections')->nullable();
            $table->json('positions')->unique();
            $table->boolean('editable')->default(true);




        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::drop('mindmap');
    }
};
