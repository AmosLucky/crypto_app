@if(session()->has("msg"))
      <div class="alert alert-success text-center">{{session()->get('msg')}}</div>

      @elseif(session()->has("error"))

       <div class="alert alert-danger text-center">{{session()->get('error')}}</div>

      @endif
      <br>
     @if (count($errors) > 0)
    <div class="alert alert-danger">
        <ul>
        @foreach ($errors->all() as $error)
            <li>{{ $error }}</li>
        @endforeach
        </ul>
    </div>
@endif