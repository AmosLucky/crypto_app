@include('dashboard.layout.header')

<div class="container-fluid">

                        <!-- start  -->
                        <div class="row ">
                            <div class="col-12">
                                <div>
                                    <h4 class="header-title mb-3">Add Coin</h4>
                                    
                                </div>
                            </div>
                        </div>
                        <!-- end row -->

                        <div class="row ">

                            <div class="col-lg-6">
                                @include('layouts.alert')
                                <form class="form-horizontal" method="POST" action="{{ route('store_coin') }}" enctype="multipart/form-data">
                                    @csrf
                                    <div class="form-group row">
                                        <label class="col-md-2 col-form-label">Name</label>
                                        <div class="col-md-10">
                                            <input type="text" name="name" class="form-control" placeholder="name" require="">
                                        </div>
                                        
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-2 col-form-label" for="example-email">Symbol</label>
                                        <div class="col-md-10">
                                            <input type="text"  name="symbol" class="form-control" placeholder="Symbol" require="" >
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-2 col-form-label" for="example-password">Wallet address</label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" name="address" placeholder="Wallet address" require="">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-md-2 col-form-label" for="example-placeholder">Coin Image</label>
                                        <div class="col-md-10">
                                            <input type="file" class="form-control" name="image"  placeholder="Username" require="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-2 col-form-label" for="example-textarea">QR code</label>
                                        <div class="col-md-10">
                                        <input type="file" class="form-control" name="qr_code"  placeholder="Username" require="">

                                           
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-md-2 col-form-label" for="example-placeholder"></label>
                                        <div class="col-md-10">
                                            <input type="submit" class="form-control btn-success" name="submit" value="Submit">
                                        </div>
                                    </div>

                                </form>
                            </div>
                            <!-- end -->

                            <div class="col-lg-6">
                                <h2>Coins</h2>

                                <table id="datatable" class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                        <thead>
                                            <tr>
                                             <th>Name</th>
                                             
                                               
                                                <th>Action</th>
                                                
                                            </tr>
                                        </thead>

                                        <tbody>

                                @foreach($coins as $coin)

                                <form method="POST" action="{{ route('update_coin') }}" enctype="multipart/form-data">
                                @csrf

                                <tr>
                                <td>
                                {{$coin->name}}
                                </td>
                                <td>
                                    <img src="{{ asset('storage/images/'.$coin->image) }}" height="50" width="50" />
                                    <br>
                                    <br>
                                    <p> name</p>
                                   <input name="name" value="{{$coin->name}}" />
                                   <br>
                                   <br>
                                    <p> Wallet address</p>
                                   <input name="address" value="{{$coin->address}}" />
                                   <input type="hidden" name="old_code" value="{{$coin->qr_code}}" />
                                   <br>
                                   <br>
                                   <img src="{{ asset('storage/images/'.$coin->qr_code) }}" height="50" width="50" />

                                   <p> Change Qr code (optional)</p>
                                   <input type="file" class="form-control" name="qr_code"  placeholder="qr_code" require="">

                                   <br>
                                   <input type="hidden" name="id" value="{{$coin->id}}" />

                               <!-- <a href="coin/delete/{{$coin->id}}">
                               <button class="btn btn-danger">
                                    Delete
                                </button>
                               </a> -->
                               <br>
                               
                               <input class="btn btn-primary" value="Update" type="submit">
                                   
                                
                                </td>
                                </tr>
</form>

                               




                                @endforeach

                        </tbody>
                        </table>


                            </div>


</div>



                    @include('dashboard.layout.footer')