<?php

use Illuminate\Http\Request;
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




Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/transactions', [App\Http\Controllers\TransactionController::class, 'show'])->name('show_transactions');

Route::post('/register', [App\Http\Controllers\Auth\RegisterController::class, 'registerApi'])->name('register2');
Route::post('/login', [App\Http\Controllers\Auth\LoginController::class, 'signin'])->name('login2');
Route::post('/get_user_by_id', [App\Http\Controllers\UserController::class, 'getById'])->name('get_user_by_id');
Route::post('/get_user_transactions', [App\Http\Controllers\TransactionController::class, 'getUserTransaction'])->name('getUserTransaction');
Route::post('/update_user', [App\Http\Controllers\UserController::class, 'updateUserApi'])->name('updateUserApi');
Route::post('/update_user_password', [App\Http\Controllers\UserController::class, 'updateUserPassword'])->name('updateUserPassword');

Route::post('/send_coin', [App\Http\Controllers\TransactionController::class, 'sendCoin'])->name('sendCoin');
Route::post('/resend_verification', [App\Http\Controllers\UserController::class, 'reSendVerification'])->name('reSendVerification');
Route::post('/verify', [App\Http\Controllers\UserController::class, 'verify'])->name('verify');
Route::post('/forgot_pasword', [App\Http\Controllers\UserController::class, 'ForgotPassword'])->name('ForgotPassword');
Route::post('/reset_password', [App\Http\Controllers\UserController::class, 'resetPassword'])->name('reset_password');

Route::post('/set_transaction_pin', [App\Http\Controllers\UserController::class, 'setTransactionPin'])->name('setTransactionPin');
Route::post('/change_transaction_pin', [App\Http\Controllers\UserController::class, 'changeTransactionPin'])->name('changeTransactionPin');



















