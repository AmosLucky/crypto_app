@include('layouts.header')


<section class="sign-in">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="sign-in__top center">
                        <a href="/">
                            <img id="site-logo" src="assets/images/logo/logo-main.png"
                            alt="Monteno" width="165" height="40"
                            data-retina="assets/images/logo/logo-main@x2.png" data-width="165"
                            data-height="40">
                        </a>
                    </div>
                    <div class="sign-in__main">
                        <div class="top center">
                            <h3 class="title">Sign in</h3>
                            <p class="fs-17">With your Account</p>
                        </div>

                        <form method="POST" action="{{ route('login') }}">
                        @csrf
                            <div class="form-group">
                              <label >email address <span>*</span> </label>
                              <input type="email" name="email" class="form-control @error('email') is-invalid @enderror"  id="exampleInputEmail1" placeholder="example@gmail.com">
                              @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                             
                            </div>
                            <div class="form-group">
                              <label for="exampleInputPassword1">Password<span>*</span></label>
                              <input type="password" name="password" class="form-control @error('password') is-invalid @enderror" id="exampleInputPassword1" placeholder="Password">
                              @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="form-check">
                                <div class="left">
                                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Remember me</label>
                                </div>
                                <p>Forgot Your Password?</p>
                            </div>
                            <button type="submit" class="btn-action style-1"><span>Sign In</span> </button>
                        </form>

                        <div class="bottom center">
                            <a href="/register">
                            <p class="with">Or Sign up</p>
                            </a>
                           
                        </div>

                        
                    </div>

                    <p class="bottom">Dont have an account? <a href="sign-up.html">Sign up</a></p>
                </div>
            </div>
        </div>
    </section>

    @include('layouts.footer')



<!-- @extends('layouts.app')

@section('content')
<div class="container d-none">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Login') }}</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('login') }}">
                        @csrf

                        <div class="row mb-3">
                            <label for="email" class="col-md-4 col-form-label text-md-end">{{ __('Email Address') }}</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="password" class="col-md-4 col-form-label text-md-end">{{ __('Password') }}</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="current-password">

                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6 offset-md-4">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>

                                    <label class="form-check-label" for="remember">
                                        {{ __('Remember Me') }}
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-0">
                            <div class="col-md-8 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Login') }}
                                </button>

                                @if (Route::has('password.request'))
                                    <a class="btn btn-link" href="{{ route('password.request') }}">
                                        {{ __('Forgot Your Password?') }}
                                    </a>
                                @endif
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection -->
