<?php

use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\Auth\ObatController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::middleware('auth:sanctum')->get('/user', [AuthController::class, 'user']);
Route::post('/register', [AuthController::class, 'register']);
Route::post('sanctum/token', [AuthController::class, 'token']);
Route::get('/data-user', [AuthController::class, 'data_user']);

Route::group(['middleware' => 'auth:sanctum'], function () {
    foreach (glob(base_path('routes/links*.php')) as $filename) {
        require $filename;
    }
});

// Route::post('token/delete', [AuthController::class, 'delete']);
Route::post('token/delete', [AuthController::class, 'delete'])->middleware('auth:sanctum');



// Now ObatController
Route::get('search-obat', [ObatController::class, 'search_obat']);
Route::get('search-kategori', [ObatController::class, 'search_kategori']);
Route::get('show-kategori', [ObatController::class, 'show_kategori']);
Route::get('kategori-data', [ObatController::class, 'get_kategori_obat']);
Route::get('show-obat', [ObatController::class, 'show_obat']);
Route::get('user/view-preferences', [ObatController::class, 'view_preferences']);
Route::post('user/add-preferences', [ObatController::class, 'add_preferences']);
Route::post('user/remove-preferences', [ObatController::class, 'del_preferences']);




