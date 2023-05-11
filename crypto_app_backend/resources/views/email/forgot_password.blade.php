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
 <h1>Hi {{$user->username}}</h1>
  <!-- <h1>token :{{$randomNumber}}</h1> -->
  
</div>
  
<div class="container">
  <div class="row">
    <div class="col-sm-12">
      <p>Forgot password</p>
      
      <p>We received a request to reset the email for you accoun </p>
      <h3>Password reset code: </h3>
      <h1>{{$randomNumber}}</h1>
      <p>To reset your password, Enter the above code</p>
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
