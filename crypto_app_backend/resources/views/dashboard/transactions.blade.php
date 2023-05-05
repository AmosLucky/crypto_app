@include('dashboard.layout.header')

        


                      <!-- Start container-fluid -->
                    <div class="container-fluid">
                        
                        <!-- end row -->
                        @include('layouts.alert')


                       

                        <div class="row">
                            <div class="col-sm-12">

                            
                            <table id="datatable" class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                        <thead>
                                            <tr>
                                             <th>Username</th>
                                             <th>amount</th>
                                                <th>Coin</th>
                                                <th>Type</th>
                                                <th>Address</th>
                                                <th>Status</th>
                                                
                                                <th>Action</th>
                                                
                                            </tr>
                                        </thead>
                                        

                                        <tbody>
                                            @foreach($transactions as $transaction)
                                            <tr>
                                            <td>{{$transaction->username}}</td>
                                                <td>${{$transaction->amount}}</td>
                                                <td <?php
                                                if($transaction->type == 'debit'){
                                                  echo "style='color:red'";
                                                }
                                                 ?>>{{$transaction->type}}</td>
                                                <td>{{$transaction->name}}</td>
                                                
                                                <td>
                                                  <input value="{{$transaction->address}}"/>
                                                </td>
                                                <td>{{$transaction->status}}</td>
                                                <td>
                                                <div class="dropdown">
  <button type="button" class="btn btn-primary dropdown-toggle" 
  data-toggle="dropdown">
    Action
  </button>
  <div class="dropdown-menu">
    <a class="dropdown-item" href="transaction/{{$transaction->id}}">View more</a>
    <a class="dropdown-item" stype="button" data-toggle="modal" data-target="#myModal_block{{$transaction->id}}">Approve / Disapprove</a>
    <a class="dropdown-item" type="button" data-toggle="modal" data-target="#myModal{{$transaction->id}}">delete transaction</a>
  </div>
</div>
                                                </td>
                                               
                                            </tr>

                <!-- Button to Open the Modal -->
<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
  Open modal
</button> -->
<!-- The Modal -->
<div class="modal" id="myModal_block{{$transaction->id}}">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Approve / Disapprove</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      Are you sure you want proceed
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
       <a href="/transaction/approve/{{$transaction->id}}">
       <button type="button" class="btn btn-warning" >Approve/ Disapprove</button>
       </a>
      </div>

    </div>
  </div>
</div>

<!-- The Modal -->
<div class="modal" id="myModal{{$transaction->id}}">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Delete</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      Are you sure you want delete 
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
       <a href="/transaction/delete/{{$transaction->id}}">
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