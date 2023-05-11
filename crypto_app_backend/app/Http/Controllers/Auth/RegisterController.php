<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use App\Models\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\Coin;
use App\Models\Balance;
use Illuminate\Http\Request;
use Mail;
use App\Http\Controllers\UserController;
class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;
    

    /**
     * Where to redirect users after registration.
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
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'username' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:6' ],
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\Models\User
     */
    protected function create(array $data)
    {
        $user =  User::create([
            'username' => $data['name'],
            'name' => $data['name'],
            'transaction_pin' => "",
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
        ]);

        $coins =  Coin::all();
        foreach($coins as $coin){
            $balance = Balance::create([
                "user_id"=>$user->id,
                "coin_id"=> $coin->id,
                'balance'=>0
            ]);
        }

       




        $this->welcomeMail($user->id);


        $user = User::find($user->id);


        $userController = new UserController();
        $userController->sendMailToAdmin(2,null,$user);





        return $user;
    }

   public function registerApi(Request $request){

    $validator =  Validator::make($request->all(),[
        'name' => ['required', 'string', 'max:255'],
            'username' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:6' ],
        ]);
    
        if($validator->fails()){
            return response()->json([
                "status" => false,
                "message" => $validator->errors()->first(),
                "errors" => $validator->errors(),
            ], 200);
        }



    $user =  User::create([
        'username' => $request['name'],
        'name' => $request['name'],
        'email' => $request['email'],
        
        'password' => Hash::make($request['password']),
        'transaction_pin'=>""
    ]);

    $user = User::find($user->id);

    $coins =  Coin::all();
    foreach($coins as $coin){
        $balance = Balance::create([
            "user_id"=>$user->id,
            "coin_id"=> $coin->id,
            'balance'=>0
        ]);
        $coin->image = asset('storage/images/'.$coin->image);
        $coin->qr_code = asset('storage/images/'.$coin->qr_code);
    }
    $user['coins'] = $coins;

    $this->welcomeMail($user->id);

    $userController = new UserController();
    $userController->sendMailToAdmin(2,null,$user);

    


    return response()->json( ['status'=>true,"data"=>$user], 200) ;

    }


    public function welcomeMail(String $id) {
        $user = User::find($id);
      
     $name="Coinix Wallet";
     //$user= User::find($request->id);
     $randomNumber = rand(1000, 9999);
     $user->remember_token = $randomNumber;
     $user->update();

      Mail::send('email.welcome_mail',compact("user","name","randomNumber"), function($message) use ($user, $name,$randomNumber){
        
         $message->to($user->email, $name)->subject
            ('Welcome to coinix Wallet');
         $message->from('support@coinixpro.com',$name);
      });
       }

       


   
    

    

    
}
