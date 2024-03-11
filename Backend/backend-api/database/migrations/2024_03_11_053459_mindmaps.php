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
            $table->foreignId('user_id')->constrained()-> onDelete('cascade');;//->references('id') ->on('users')
            $table->string('title')->default('untitled')->nullable();
            $table->string('content')->nullable();
            $table->string('connections')->nullable();
            $table->string('positions')->unique();
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




