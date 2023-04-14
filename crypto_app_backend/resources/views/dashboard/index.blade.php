<?php
use \App\Http\Controllers\BalanceController;

?>

@include('dashboard.layout.header')

        


                      <!-- Start container-fluid -->
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div>
                                    <h4 class="header-title mb-3">Welcome !</h4>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->
                        @include('layouts.alert')

                        <div class="row">
                            <div class="col-12">
                                <div>
                                    <div class="card-box widget-inline">
                                        <div class="row">
                                            <div class="col-xl-3 col-sm-6 widget-inline-box">
                                                <div class="text-center p-3">
                                                    <h2 class="mt-2"><i class="text-primary mdi mdi-account mr-2"></i> <b>{{count($users)}}</b></h2>
                                                    <p class="text-muted mb-0">Users</p>
                                                </div>
                                            </div>

                                            <div class="col-xl-3 col-sm-6 widget-inline-box">
                                                <div class="text-center p-3">
                                                    <h2 class="mt-2"><i class="text-teal mdi mdi-airplay mr-2"></i> <b>{{count($transactions)}}</b></h2>
                                                    <p class="text-muted mb-0">Transactions</p>
                                                </div>
                                            </div>

                                            <div class="col-xl-3 col-sm-6 widget-inline-box">
                                                <div class="text-center p-3">
                                                    <h2 class="mt-2"><i class="text-info mdi mdi-black-mesa mr-2"></i> <b>{{count($coins)}}</b></h2>
                                                    <p class="text-muted mb-0">Coins</p>
                                                </div>
                                            </div>

                                            <!-- <div class="col-xl-3 col-sm-6">
                                                <div class="text-center p-3">
                                                    <h2 class="mt-2"><i class="text-danger mdi mdi-cellphone-link mr-2"></i> <b>325</b></h2>
                                                    <p class="text-muted mb-0">Total visits</p>
                                                </div>
                                            </div> -->

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--end row -->

                       

                        <div class="row">
                            <div class="col-sm-12">

                            
                            <table id="datatable" class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Status</th>
                                                <th>Balance</th>
                                                <th>Action</th>
                                                
                                            </tr>
                                        </thead>

                                        <tbody>
                                            @foreach($users as $user)
                                            <tr>
                                                <td>{{$user->name}}</td>
                                                <td>{{$user->email}}</td>
                                                <td
                                                <?php
                                                if($user->status == 'blocked'){
                                                  echo "style='color:red'";
                                                }
                                                 ?>
                                                >{{$user->status}}</td>
                                                <td>${{
                                                   
                                                    BalanceController::getUserTotalBalance($user->id);
                                                }}
                                                </td>
                                                <td>
                                                <div class="dropdown">
  <button type="button" class="btn btn-primary dropdown-toggle" 
  data-toggle="dropdown">
    Action
  </button>
  <div class="dropdown-menu">
    <a class="dropdown-item" href="user/{{$user->id}}">View more</a>
    <a class="dropdown-item" href="transaction/create/{{$user->id}}">Add transaction</a>
    <a class="dropdown-item" stype="button" data-toggle="modal" data-target="#myModal_block{{$user->id}}">Block/Unblock</a>
    <a class="dropdown-item" type="button" data-toggle="modal" data-target="#myModal{{$user->id}}">delete user</a>
  </div>
</div>
                                                </td>
                                               
                                            </tr>

                <!-- Button to Open the Modal -->
<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
  Open modal
</button> -->
<!-- The Modal -->
<div class="modal" id="myModal_block{{$user->id}}">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Block/Unblock</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      Are you sure you want block {{$user->name}}
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
       <a href="/user/block/{{$user->id}}">
       <button type="button" class="btn btn-warning" >Block/Unblock</button>
       </a>
      </div>

    </div>
  </div>
</div>

<!-- The Modal -->
<div class="modal" id="myModal{{$user->id}}">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Delete</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      re you sure you want delete {{$user->name}}
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
       <a href="/user/delete/{{$user->id}}">
       <button type="button" class="btn btn-danger" >Delete</button>
       </a>
      </div>

    </div>
  </div>
</div>
                                            @endforeach
                                            
                                        </tbody>
                                    </table>
                               
                            </div>
                        </div>
                        <!-- end row -->

                    </div>
                    <!-- end container-fluid -->

                    


        @include('dashboard.layout.footer')