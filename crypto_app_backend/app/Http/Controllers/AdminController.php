<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Coin;
use App\Models\User;
use App\Models\Transaction;

class AdminController extends Controller
{
    //
    public function index()
    {
        $transactions = Transaction::all();
        $users = User::orderBy('id', 'desc')->get();
        $coins = Coin::all();
       
        return view('dashboard.index', compact("users","transactions","coins"));
    }

    public static function checkUser()
    {

        if(!auth()->user()){
            return redirect()->to('mobile-user')->send();

            header("Location: /user");

        }
        
       else if(auth()->user()->is_admin != 1){
            //dd(auth()->user()->is_admin);

            return redirect()->to('mobile-user')->send();

            header("Location: /user");

       }

    }



}
