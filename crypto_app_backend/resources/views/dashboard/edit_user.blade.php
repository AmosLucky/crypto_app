<?php
use \App\Http\Controllers\BalanceController;

?>
@include('dashboard.layout.header')

<div class="container-fluid">

                        <!-- start  -->
                        <div class="row ">
                            <div class="col-12">
                                <div>
                                    <h4 class="header-title mb-3"> Edit {{$user->name}}</h4>
                                    
                                </div>
                            </div>
                        </div>
                        <!-- end row -->

                        <div class="row pt-2">
                       <div class="col-lg-12">
                       @include('layouts.alert')
                       </div>

                            <div class="col-lg-6">
                            <h2>User Details</h2>
                              
                                <form class="form-horizontal" method="POST" action="{{ route('update_user') }}">
                                    @csrf
                                    <!-- <div class="form-group row">
                                        <label class="col-md-2 col-form-label">Balance</label>
                                        <div class="col-md-10">
                                            <input type="number" name="balance" class="form-control" value="{{
                                                   
                                                   BalanceController::getUserTotalBalance($user->id);
                                               }}" readonly="">
                                        </div>
                                    </div> -->
                                    <div class="form-group row">
                                        <label class="col-md-2 col-form-label" for="example-email">Email</label>
                                        <div class="col-md-10">
                                            <input type="email" value="{{$user->email}}" name="email" class="form-control" placeholder="Email">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-2 col-form-label" for="example-password">Name</label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" name="name" value="{{$user->name}}">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-md-2 col-form-label" for="example-placeholder">Username</label>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" name="username" value="{{$user->username}}" placeholder="Username">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-2 col-form-label" for="example-textarea">Access</label>
                                        <div class="col-md-10">
                                           <select class="form-control" name="access">
                                            <option value="{{$user->access}}">{{$user->access}}</option>
                                            
                                            @if($user->access == "admin")
                                            <option value="user">user</option>
                                            @else
                                            <option value="admin">admin</option>
                                            @endif

                                           </select>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-md-2 col-form-label" for="example-placeholder"></label>
                                        <div class="col-md-10">
                                            <input type="submit" class="form-control btn-success" name="submit" value="Submit">
                                        </div>
                                    </div>
                                    <input type="hidden" class="form-control btn-success" name="id" value="{{$user->id}}">

                                </form>
                            </div>
                            <!-- end -->

                            <div class="col-lg-6">
                                <h2>Balance</h2>

                           

                            @foreach(BalanceController::getUserBalance($user->id) as $balance)

                            <form class="form-horizontal" method="POST" action="{{ route('update_balance') }}">
                                    @csrf

                            <div class="form-group row">
                                        <label class="col-md-2 col-form-label" for="example-email">{{$balance->name}}</label>
                                        <div class="col-md-6">
                                            
                                            <input type="" value="{{$balance->balance}}" name="balance" class="form-control" placeholder="Amount">
                                        </div>
                                        <div class="col-md-2">
                                            <input type="submit" value="update"  class="btn btn-success">
                                        </div>
                                    

                            </div>
                            <input type="hidden" name="id" value="{{$balance->id}}" />

                                            </form>

                            @endforeach
                                            </div>


</div>



                    @include('dashboard.layout.footer')