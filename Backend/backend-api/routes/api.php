<?php

use App\Http\Controllers\mindmap_controller;
use App\Http\Controllers\MindmapController;
use App\Http\Controllers\UserController;
use Illuminate\Auth\Events\Authenticated;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('register', [UserController::class, 'register']);
Route::post('login', [UserController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('user-profile', [UserController::class, 'userProfile']);
    Route::post('update-profile', [UserController::class, 'updateProfile']);
    Route::get('user/{user_id}/index', [MindmapController::class,'index']) ;// add integrity later
    Route::get('user/{user_id}/show/{id}', [MindmapController::class,'show']) ;
    Route::post('user/{user_id}/store', [MindmapController::class,'store']) ;//add integrity later
    Route::patch('user/{user_id}/edit/{id}', [MindmapController::class,'update']) ;
    Route::delete('user/{user_id}/delete/{id}', [MindmapController::class,'destroy']) ;
    Route::post('logout', [UserController::class, 'logout']);
});





