<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/
// Route::get('/foo', function () {
//     Artisan::call('storage:link');
// });
// Route::get('/link', function () {        
//   $target = '/home/u859369819/domains/coinixpro.com/public_html/storage/app/public';
//   $shortcut = '/home/u859369819/domains/coinixpro.com/public_html/public/storage';
//   symlink($target, $shortcut);
// });

// Route::get('/linkstorage', function () {
//     $targetFolder = base_path().'/storage/app/public';
//     $linkFolder = $_SERVER['DOCUMENT_ROOT'].'/storage';
//     symlink($targetFolder, $linkFolder); 
// });


Route::get('/', function () {
    return view('welcome');
});
Route::get('/about', function () {
    return view('pages.about');
});
Route::get('/contact', function () {
    return view('pages.contact');
});


Route::get('mobile-user',function () {
    return view('pages.user');
});

Route::post('/contact', [App\Http\Controllers\UserController::class, 'contact'])->name('contact');


Route::post('/resend_verification', [App\Http\Controllers\UserController::class, 'reSendVerification'])->name('reSendVerification');




Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');


Auth::routes();
Route::group( [ 'middleware' => 'auth' ], function(){
    // Route::get('/home',  function(){
    //     return view('dashboard.index');});
    Route::get('/dashboard', [App\Http\Controllers\AdminController::class, 'index'])->name('dashboard');
    Route::get('/user/delete/{id}', [App\Http\Controllers\UserController::class, 'delete'])->name('delete');
    Route::get('/user/block/{id}', [App\Http\Controllers\UserController::class, 'block'])->name('block');
    Route::get('/user/{id}', [App\Http\Controllers\UserController::class, 'view'])->name('view');
    Route::post('/user', [App\Http\Controllers\UserController::class, 'update'])->name('update_user');
    Route::get('transaction/create/{id}', [App\Http\Controllers\TransactionController::class, 'create'])->name('add_transaction');
    Route::post('transaction/store', [App\Http\Controllers\TransactionController::class, 'store'])->name('store_transaction');
    Route::post('/coin/add', [App\Http\Controllers\CoinController::class, 'store'])->name('store_coin');
    Route::get('/coin/add', [App\Http\Controllers\CoinController::class, 'create'])->name('create_coin');
    Route::post('/coin/update', [App\Http\Controllers\CoinController::class, 'update'])->name('update_coin');

    
    Route::get('coin/delete/{id}', [App\Http\Controllers\CoinController::class, 'destroy'])->name('destroy_coin');

    Route::get('/transactions', [App\Http\Controllers\TransactionController::class, 'show'])->name('show_transactions');
    Route::get('/transaction/approve/{id}', [App\Http\Controllers\TransactionController::class, 'approve'])->name('approve_transactions');
    Route::get('/transaction/delete/{id}', [App\Http\Controllers\TransactionController::class, 'destroy'])->name('delete_transactions');
    Route::get('/transaction/{id}', [App\Http\Controllers\TransactionController::class, 'edit'])->name('edit_transaction');
    Route::post('/transaction/update', [App\Http\Controllers\TransactionController::class, 'update'])->name('update_transaction');

    Route::post('/balance/update', [App\Http\Controllers\BalanceController::class, 'update'])->name('update_balance');
    Route::get('transactions/debits', [App\Http\Controllers\TransactionController::class, 'pendingDebits'])->name('pending_debit_transactions');
    Route::get('transactions/credits', [App\Http\Controllers\TransactionController::class, 'pendingCredits'])->name('pending_credit_transactions');





     //Route::get('/email', 'VerificationController@show')->name('verification.notice');
    // Route::get('/email/verify/{id}/{hash}', 'VerificationController@verify')->name('verification.verify')->middleware(['signed']);

   





    




    









    

        // Route::get('/dashboard',  function(){
        //     return view('dashboard.index');
        // });
        // Route::get('add_property',  function(){
        });
