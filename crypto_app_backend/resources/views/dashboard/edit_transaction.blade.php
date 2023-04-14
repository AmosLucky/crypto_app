@include('dashboard.layout.header')

<div class="container-fluid">

                        <!-- start  -->
                        <div class="row ">
                            <div class="col-12">
                                <div>
                                    <h4 class="header-title mb-3"> Add transactio to {{$user->name}}</h4>
                                    
                                </div>
                            </div>
                        </div>
                        <!-- end row -->

                        <div class="row justify-content-center">

                            <div class="col-lg-6">
                                @include('layouts.alert')
                                <form class="form-horizontal" method="POST" action="{{ route('update_transaction') }}">
                                    @csrf
                                    <div class="form-group row">
                                        <label class="col-md-2 col-form-label">Amount</label>
                                        <div class="col-md-10">
                                            <input type="number" name="amount" value="{{$transaction->amount}}" class="form-control">
                                        </div>
                                    </div>


                                   

                                    
                                    <div class="form-group row">
                                        <label class="col-md-2 col-form-label" for="example-textarea">Coin</label>
                                        <div class="col-md-10">
                                           <select class="form-control" name="coin_id">
                                           <option value="{{$transaction->id}}">{{$transaction->name}} </option>


                                           @foreach($coins as $coin)
                                           <option value="{{$coin->id}}">{{$coin->name}} ({{$coin->symbol}})</option>
                                           @endforeach
                                           

                                           </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-2 col-form-label" for="example-textarea">Status</label>
                                        <div class="col-md-10">
                                           <select class="form-control" name="status">
                                           
                                            <option value="{{$transaction->status}}">{{$transaction->status}}</option>

                                          
                                           <option value="approved">Approved</option>
                                           <option value="pending">Pending</option>
                                          
                                           

                                           </select>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-md-2 col-form-label" for="example-textarea">Type</label>
                                        <div class="col-md-10">
                                           <select class="form-control" name="type">

                                           <option value="{{$transaction->type}}">{{$transaction->type}} </option>


                                          
                                           
                                           <option value="credit">Credit</option>
                                           <option value="debit">Debit</option>
                                          
                                           

                                           </select>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-md-2 col-form-label" for="example-placeholder"></label>
                                        <div class="col-md-10">
                                            <input type="submit" class="form-control btn-success" name="submit" value="Submit">
                                        </div>
                                    </div>
                                    <input type="hidden" class="form-control btn-success" name="user_id" value="{{$user->id}}">
                                    <input type="hidden" class="form-control btn-success" name="id" value="{{$transaction->id}}">


                                </form>
                            </div>
                            <!-- end -->


</div>



                    @include('dashboard.layout.footer')