<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Coin;
use App\Models\User;
use App\Models\Transaction;

class UserController extends Controller
{
    //


    public function delete(Request $request, $id)
    {
       
        $users = User::find($id);
        $users::destroy($id);
        
       
        $msg = "Successfuly Deleted";

        return redirect()->back()->with(['msg' => $msg]);

    }
    public function block(Request $request, $id)
    {
       
        $users = User::find($id);
        if( $users['status']=="active"){
            $users['status'] = "blocked";

        }else{
            $users['status'] = "active";
        }
       
        
        $users->update();
        
       
        $msg = "Successfuly blocked";

        return redirect()->back()->with(['msg' => $msg]);

    }

    public function view(Request $request, $id){
        $user = User::find($id);

        return view('dashboard.edit_user', compact("user"));


    }

    public function update(Request $request){
        $user = User::find($request['id']);
        $user->name = $request['name'];
        $user->username = $request['username'];
        $user->email = $request['email'];
        $user->balance = $request['balance'];
        $user->access = $request['access'];

        $user->update();

        $msg = "Successfuly updated";

        return redirect()->back()->with(['msg' => $msg]);
        

    }


    public function addTransaction($id){
        $user = User::find($id);
        $coins = Coin::all();

        return view('dashboard.add_transaction', compact("user",'coins'));


    }

    
}
