<?php

namespace App\Http\Controllers;

use App\Models\Balance;
use App\Models\Coin;
use Illuminate\Http\Request;

class BalanceController extends Controller
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
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Balance $balance)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Balance $balance)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Balance $balance)
    {
        //
        $balance = Balance::find($request['id']);
        $balance->balance = $request['balance'];
        $balance -> update();

        $msg = "Successfuly updated";

        return redirect()->back()->with(['msg' => $msg]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Balance $balance)
    {
        //
    }

    public static function getUserTotalBalance($id)
    {
        //
        $totalBalance = 0;
        $balance = Balance::where("user_id",$id)->get();

        foreach ($balance as $bal) { 
            $totalBalance += $bal['balance'];



         }
        

         return $totalBalance;

    }
    public static function getUserBalance($id){
        $balance = Balance::where("user_id",$id)->get();

        foreach ($balance as $bal) { 
             $bal['name'] = Coin::find($bal['coin_id'])->name;



         }

        return $balance;

    }

   
}
