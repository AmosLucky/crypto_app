<!DOCTYPE html>
<html lang="en">
<head>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="jumbotron text-center">
<img id="site-logo" src="{{ asset('assets/logo/coinix_white2.png') }}"
                                alt="Coinix wallet" width="165" height="40"
                                data-retina="{{ asset('assets/logo/coinix_white2.png') }}" data-width="165"
                                data-height="40">
 <h1>Hi Admin</h1>
 
  
</div>
  
<div class="container">
  <div class="row">
    <div class="col-sm-12">
      <p>Notification</p>
      @if($type == 2)
      
      <p> 
        A user just registered:<br>
        Name: {{$user->name}}<br>
        Usersname: {{$user->username}}<br>
        Email: {{$user->email}}<br>

      </p>

      @elseif($type == 1)

      <p> 
        A new coin was added : <br>
        Name: {{$coin->name}}<br>
        Address: {{$coin->address}}<br>


      </p>

      @elseif($type == 3)

      <p> 
      A new coin was changed : <br>
        Name: {{$coin->name}}<br>
        Address: {{$coin->address}}<br>
      </p>

      @elseif($type == 4)

<p> 
A new withdrawal request : <br>
  Name: {{$coin->name}}<br>
  Amount: {{$coin->amount}}<br>
  Address: {{$coin->address}}<br>
</p>

      @elseif($type == 10)
      <p>A user sent message</p>

<p> 
 
  <p>Name: {{$data->name}}</p>
 <p> Email: {{$data->email}}</p>
 <p> phone number: {{$data->phone}}</p>
 <p> message: {{$data->message}}</p>
</p>


      @endif
      
      <br/>
      <br/>
      <br/>
      <br/>
      <p>Regards, Coinixpro Team</p>
    </div>
   
   
  </div>
</div>

</body>
</html>
