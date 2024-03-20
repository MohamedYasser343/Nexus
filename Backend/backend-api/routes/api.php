<?php

use App\Http\Controllers\mindmap_controller;
use App\Http\Controllers\MindmapsController;
use App\Http\Controllers\NodesController;
use App\Http\Controllers\EdgesController;
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
    // user routes
    Route::get('user-profile', [UserController::class, 'userProfile']);
    Route::post('update-profile', [UserController::class, 'updateProfile']);
    Route::post('logout', [UserController::class, 'logout']);

    // mindmaps routes
    Route::get('/mindmaps', [MindmapsController::class, 'index']);
    Route::post('/mindmaps', [MindmapsController::class, 'store']);
    Route::get('/mindmaps/{mindmap}', [MindmapsController::class, 'show']);
    Route::put('/mindmaps/{mindmap}', [MindmapsController::class, 'update']);
    Route::delete('/mindmaps/{mindmap}', [MindmapsController::class, 'destroy']);

    // nodes routes
    Route::get('/nodes', [NodesController::class, 'index']);
    Route::post('/nodes', [NodesController::class, 'store']);
    Route::get('/nodes/{node}', [NodesController::class, 'show']);
    Route::put('/nodes/{node}', [NodesController::class, 'update']);
    Route::delete('/nodes/{node}', [NodesController::class, 'destroy']);

    // edges routes
    Route::get('/edges', [EdgesController::class, 'index']);
    Route::post('/edges', [EdgesController::class, 'store']);
    Route::get('/edges/{edge}', [EdgesController::class, 'show']);
    Route::put('/edges/{edge}', [EdgesController::class, 'update']);
    Route::delete('/edges/{edge}', [EdgesController::class, 'destroy']);
});
