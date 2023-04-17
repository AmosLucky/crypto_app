<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use App\Models\Coin;
use App\Models\Balance;


class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function signin(Request $request){
        $validator =  Validator::make($request->all(),[
                'email' => ['required'],
                'password' => ['required'],
            ]);

            if($validator->fails()){
                return response()->json([
                    "status" => false,
                    "message" => $validator->errors()->first(),
                    "errors" => $validator->errors(),
                ], 200);
            }

            $user =  User::where("email",$request['email'])->first();
            if($user == null){
                return response()->json([
                    "status" => false,
                    "message" => "user not found",
                    "errors" => $validator->errors(),
                ], 200);
            }

            if(!Hash::check($request['password'],$user->password)){
                return response()->json([
                    "status" => false,
                    "message" => "user not found",
                    "errors" => $validator->errors(),
                ], 200);

            }
            $coins = Coin::all();
            $totalBalance = 0;
            for($i = 0; $i < count($coins); $i++){
                $balance = Balance::where("user_id",$user->id)->where("coin_id",$coins[$i]->id)->first();
                $coins[$i]->image = asset('storage/images/'.$coins[$i]->image);
                $coins[$i]->qr_code = asset('storage/images/'.$coins[$i]->qr_code);
                if($balance != null){
                    $coins[$i]->balance = $balance['balance'];
                    $totalBalance+=$balance['balance'];
                    
                }else{
                    Balance::create([
                        'user_id'=>$user->id,
                        'coin_id'=>$coins[$i]->id,
                        'balance'=>0
                    ]);

                    $coins[$i]->balance = 0;

                }



            }

            $user['coins'] = $coins;
            $user->balance = $totalBalance;


            return response()->json( ['status'=>true,"data"=>$user], 200) ;
    }
}
