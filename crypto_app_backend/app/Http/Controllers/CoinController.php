<?php

namespace App\Http\Controllers;

use App\Models\Coin;
use Illuminate\Http\Request;

class CoinController extends Controller
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

        $coins = Coin::all();

        return view('dashboard.create_coin', compact("coins"));

        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

        
        //
        $file = $request->image;
        $image = $file->getClientOriginalName();
        $file->storeAs('/public/images',$image);

        // $qr_code = $request['qr_code']->getClientOriginalName();
        // $request['qr_code']->storeAs('/public/images',$qr_code);

        $file = $request->qr_code;
        $qr_code = $file->getClientOriginalName();
        $file->storeAs('/public/images',$qr_code);

        //return $qr_code;


       $coin =  Coin::create(
            [
                "image" => $image,
                "qr_code" => $qr_code,
                "name" => $request['name'],
                "symbol" => $request['symbol'],
                "address" => $request['address']
            ]
        );

      

        $coin = Coin::find($coin->id);
        $userController = new UserController();
       $userController->sendMailToAdmin(1,$coin,null);

        $msg = "Successfuly updated";

        return redirect()->back()->with(['msg' => $msg]);
      
    }

    /**
     * Display the specified resource.
     */
    public function show(Coin $coin)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Coin $coin)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Coin $coin)
    {
        $coin = Coin::find($request->id);
       

        $fileName = $request->old_code;


         if($request->hasFile("qr_code")){

      
    
         $fileName = $request->qr_code->getClientOriginalName();

         
         $request->qr_code->storeAs('/public/images',$fileName);
         } 

         $coin -> qr_code = $fileName;


         





        $coin -> address = $request->address;
        $coin -> name = $request->name;
        $coin->save();
        $msg = "Successfuly updated";

        $coin = Coin::find($coin->id);
        $userController = new UserController();
       $userController->sendMailToAdmin(3,$coin,null);

        return redirect()->back()->with(['msg' => $msg]);

        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Coin $coin, $id)
    {
        //
        $coin = Coin::find($id);
        $coin -> delete();

    }

    public static function getCoinName($id)
    {
        $coin = Coin::find($id);
        return $coin->name;

        $msg = "Successfuly deleted";

        return redirect()->back()->with(['msg' => $msg]);
        //
    }

    
}
