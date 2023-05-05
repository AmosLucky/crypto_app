<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Coin;
use App\Models\User;
use App\Models\Transaction;
use App\Models\Balance;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Mail;
use DateTime;


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

    public function getById(Request $request){
        $user =  User::find($request->id);
        $coins = Coin::all();
        $totalBalance = 0;
        
        for($i = 0; $i < count($coins); $i++){
            $coins[$i]->image = asset('storage/images/'.$coins[$i]->image);
            $coins[$i]->qr_code = asset('storage/images/'.$coins[$i]->qr_code);
            $balance = Balance::where("user_id",$user->id)->where("coin_id",$coins[$i]->id)->first();
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



    public function updateUserApi(Request $request){
        $validator =  Validator::make($request->all(),[
            'name' => ['required', 'string', 'max:255'],
                'username' => ['required', 'string', 'max:255'],
                'email' => ['required', 'string', 'email', 'max:255'],
                'user_id' => ['required' ],
            ]);
        
            if($validator->fails()){
                return response()->json([
                    "status" => false,
                    "message" => $validator->errors()->first(),
                    "errors" => $validator->errors(),
                ], 200);
            }

            $emailCount = User::where("email",$request['email'])->get();

            if(count($emailCount) == 1){}


            


        $user = User::find($request['user_id']);

        if($user == null){
            return response()->json([
                "status" => false,
                "message" => "user not found",
                "errors" => $validator->errors(),
            ], 200);
        }
        $user->name = $request['name'];
        $user->username = $request['username'];
        $user->email = $request['email'];
        // $user->balance = $request['balance'];
        // $user->access = $request['access'];

        $user->update();

        $msg = "Successfuly updated";

        return response()->json( ['status'=>true,"data"=>$user], 200) ;
        

    }


    public function updateUserPassword(Request $request){
        $validator =  Validator::make($request->all(),[
                'old_password' => ['required', 'string'],
                'new_password' => ['required', 'string' ],
                'user_id' => ['required'],
               
            ]);


        
            if($validator->fails()){
                return response()->json([
                    "status" => false,
                    "message" => $validator->errors()->first(),
                    "errors" => $validator->errors(),
                ], 200);
            }

           


        $user = User::find($request['user_id']);
        if($user == null){
            return response()->json([
                "status" => false,
                "message" => "user not found",
                "errors" => $validator->errors(),
            ], 200);
        }
        if(!Hash::check($request['old_password'],$user->password)){
            return response()->json([
                "status" => false,
                "message" => "Incorrect password",
                "errors" => $validator->errors(),
            ], 200);

        }
        $user->password = Hash::make($request->new_password);
       
        // $user->balance = $request['balance'];
        // $user->access = $request['access'];

        $user->update();

        $msg = "Successfuly updated";

        return response()->json( ['status'=>true,"data"=>$user], 200) ;
        

    }


    public function resend(Request $request){
        $user = User::where('id',$request->user_id)->first();

    $user->sendEmailVerificationNotification();

    return response()->json(['status'=>true,"msg"=>"email sent"], 200) ;

    }


   public function reSendVerification(Request $request) {
   
     
    
     $name="Coinix Wallet";
     $user= User::find($request->user_id);
     $randomNumber = rand(1000, 9999);
     $user->remember_token = $randomNumber;
     $user->update();

      Mail::send('email.resend_verification',compact("user","name","randomNumber"), function($message) use ($user, $name,$randomNumber){
        
         $message->to($user->email, $name)->subject
            ('Welcome to coinix Wallet');
         $message->from('support@coinixpro.com',$name);
      });

      return response()->json(['status'=>true,"msg"=>"email sent"], 200) ;

      
   }

   



   public function verify(Request $request) {
   
     
    
    
    $user= User::find($request->user_id);
    $date = new DateTime();
 

    if($user->remember_token == $request->code){

        $user-> email_verified_at = $date->format('Y-m-d H:i:s');
        $user->update();

        return response()->json( ['status'=>true,"data"=>$user], 200) ;


    }


     
  return response()->json( ['status'=>false,"data"=>$user], 200) ;

     
  }

  public function ForgotPassword(Request $request){
    $user= User::where("email",$request->email)->first();

    if($user != null){

        $name="Coinix Wallet";
        
        $randomNumber = rand(1000, 9999);
        $user->remember_token = $randomNumber;
        $user->update();
   
         Mail::send('email.forgot_password',compact("user","name","randomNumber"), function($message) use ($user, $name,$randomNumber){
           
            $message->to($user->email, $name)->subject
               ('Welcome to coinix Wallet');
            $message->from('support@coinixpro.com',$name);
         });

         return response()->json(['status'=>true,"msg"=>"Successful"], 200) ;


    }else{
        return response()->json( ['status'=>false,"msg"=>"User with this email not found"], 200) ;

    }

  }

  public function resetPassword(Request $request){

    $user= User::where("email",$request->email)->first();

   

    if($user != null){

        if($request->code ==  $user->remember_token){
            $user->password = Hash::make($request->new_password);
            $user->update();

            return response()->json( ['status'=>true,"msg"=>"successful"], 200) ;

        
        }else{

            return response()->json( ['status'=>false,"msg"=>"Incorrect code"], 200) ;


        }

       

     }else{
        return response()->json( ['status'=>false,"msg"=>"User with this email not found"], 200) ;

    }





  }


  ///////TRANSCTION PIN////////

  public function setTransactionPin(Request $request){
    $user = User::find($request->user_id);

    if($request->type == 0){
        $user->transaction_pin = $request->transaction_pin;
        $user->update();

        return response()->json( ['status'=>true,"msg"=>"successful"], 200);


    }
    
   
    if(!Hash::check($request['password'],$user->password)){
        $user->transaction_pin = $request->transaction_pin;
        $user->update();

        return response()->json( ['status'=>true,"msg"=>"successful"], 200);



    }else{

        return response()->json( ['status'=>false,"msg"=>"An error occoureds"], 200) ;


    }

  }




    

    
}
