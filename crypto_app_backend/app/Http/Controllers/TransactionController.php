<?php

namespace App\Http\Controllers;

use App\Models\Transaction;
use Request;
use App\Models\User;
use App\Models\Coin;
use App\Models\Balance;

class TransactionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create($id)
    {
        //

              $user = User::find($id);
              $coins = Coin::all();

         return view('dashboard.add_transaction', compact("user","coins"));


    }

    // public function saveTransaction($id){
    //     $user = User::find($id);

    //     return view('dashboard.add_transaction', compact("user"));


    // }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
        $coin =  Coin::find($request['coin_id']);
        $user =  User::find($request['user_id']);
        $request['name'] = $coin->name;
        $request['symbol'] = $coin->symbol;
        $request['username'] = $user->username;
        if (!property_exists($request, "address")){
            $request['address'] =  $coin->address;

        } 
        
        $this->addBalanceToUser($request);

        Transaction::create($request->all());

        

        $msg = "Successfuly saved";

        return redirect()->back()->with(['msg' => $msg]);


    }

    /**
     * Display the specified resource.
     */
    public function show(Transaction $transactions)

    {
        $transactions = Transaction::orderBy('id', 'desc')->get();
        //
        

        if (Request::is('api/*')) {
            
            return response( $transactions, 200)
                  ->header('Content-Type', 'text/plain');
        } else {
            
            return view('dashboard.transactions', compact("transactions"));
        }


    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Transaction $transaction, $id)
    {
        //
        $transaction =  Transaction::find($id);
       
        $user =  User::find($transaction['user_id']);
        $coins =  Coin::all();
        return view('dashboard.edit_transaction', compact("transaction",'user','coins'));



    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Transaction $transaction)
    {
        //
        $transaction = Transaction::find($request['id']);
        $transaction['coin_id']= $request['coin_id'];
        $transaction['amount']= $request['amount'];
        $transaction['status']= $request['status'];
        $transaction['type']= $request['type'];
        $transaction -> update();

        $msg = "Successfuly update";

        return redirect()->back()->with(['msg' => $msg]);
    }

    public function approve(Request $request, $id)
    {
       
        $transaction = Transaction::find($id);
        if( $transaction['status']=="approved"){
            $transaction['status'] = "pending";

        }else{
            $transaction['status'] = "approved";
        }

        


       
        
        $transaction->update();

        $this->approveDisapprove($transaction);
        
       
        $msg = "Successfuly blocked";

        return redirect()->back()->with(['msg' => $msg]);

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Transaction $transaction,$id)
    {
        //

        $transaction = Transaction::find($id);

        $transaction::destroy($id);
        
       
        $msg = "Successfuly Deleted";

        return redirect()->back()->with(['msg' => $msg]);

    }

    public function addBalanceToUser(Request $request){
        $balance = Balance::where("user_id",$request['user_id'])
        ->where("coin_id",$request['coin_id'])->first();

        if($balance == null){
            Balance::create([
                'user_id'=>$request['user_id'],
                'coin_id'=>$request['coin_id'],
                'balance'=>0
            ]);
        }

        $balance = Balance::where("user_id",$request['user_id'])
        ->where("coin_id",$request['coin_id'])->first();

        $oldBalance =  $balance->balance;

        if($request['status']=="approved"){
            if($request['type']=="credit"){
               
                $newBalance = $request['amount']+$oldBalance;

                $balance['balance'] = $newBalance;
                $balance->update();


            }

         else{
            $newBalance = $oldBalance - $request['amount'];
            if($newBalance >= 0){
                $balance['balance'] = $newBalance;
                $balance->update();

            }

         }
        }
    }

    public function approveDisapprove(Transaction $transaction){

        $amount = $transaction->amount;
        $balance = Balance::where("user_id",$transaction['user_id'])
        ->where("coin_id",$transaction['coin_id'])->first();
        $oldBalance = $balance->balance;

        if( $transaction['status']=="approved" 
        && $transaction['type'] == "credit"){
            $balance['balance'] = $oldBalance + $amount;
            $balance ->update();

        }else if( $transaction['status']=="approved" 
        && $transaction['type'] == "debit"){
            $balance['balance'] = $oldBalance - $amount;
            $balance ->update();

        }
        else if( $transaction['status']=="pending" 
        && $transaction['type'] == "credit"){
            $balance['balance'] = $oldBalance - $amount;
            $balance ->update();

        }
        else if( $transaction['status']=="pending" 
        && $transaction['type'] == "debit"){
            $balance['balance'] = $oldBalance + $amount;
            $balance ->update();

        }
        
       

    } 

    public static function getPendingCreditTransactions(){
        $pendingCredit = Transaction::where("status","pending")->where("type","credit")->get();
        //$pendingDebit = Transaction::where("status","pending")->where("type","debit");

        return  $pendingCredit;



    }
    public static function getPendingDebitTransactions(){
       // $pendingCredit = Transaction::where("status","pending")->where("type","credit");
        $pendingDebit = Transaction::where("status","pending")->where("type","debit")->get();
        return  $pendingDebit;



    }

    public function pendingDebits(){
        $transactions = Transaction::where("status","pending")->where("type","debit")->get();

        return view('dashboard.transactions', compact("transactions"));



    }
    public function pendingCredits(){
        $transactions = Transaction::where("status","pending")->where("type","credit")->get();

        return view('dashboard.transactions', compact("transactions"));



    }
}
