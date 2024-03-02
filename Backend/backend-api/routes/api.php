<?php

use App\Http\Controllers\mindmap_controller;
use App\Http\Controllers\UserController;
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
    Route::post('logout', [UserController::class, 'logout']);
});

Route::get('/index', [mindmap_controller::class,'index']);
Route::get('/show/{id}', [mindmap_controller::class,'show']);
Route::post('/store', [mindmap_controller::class,'store']);
Route::patch('/edit', [mindmap_controller::class,'update']);
Route::delete('/delete/{id}', [mindmap_controller::class,'destroy']);

