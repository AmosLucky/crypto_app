
@include('layouts.header')

<section class="sign-in sign-up">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="sign-in__top center">
                        <a href="/">
                            <img id="site-logo" src="{{ asset('assets/logo/coinix_white2.png') }}"
                            alt="Monteno" width="165" height="40"
                            data-retina="{{ asset('assets/logo/coinix_white2.png') }}" data-width="165"
                            data-height="40">
                        </a>
                    </div>
                    <div class="sign-in__main">
                        <div class="top center">
                            <h3 class="title">Sign up</h3>
                            <!-- <p class="fs-17">Create New Account</p> -->
                        </div>

                      

                        <form method="POST" action="{{ route('register') }}">
                        @csrf

                                <div class="row">
                                    <div class="col-12">
                                        <div>
                                           @include('layouts.alert')
                                            
                                        </div>
                                    </div>
                                </div>

                        <div class="form-group">
                              <label>Full name <span>*</span> </label>
                              <input id="name" name="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>
                             
                            </div>
                            <div class="form-group">
                              <label>Username <span>*</span> </label>
                              <input id="username" name="username" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>
                             
                            </div>
                            <div class="form-group">
                              <label> email address <span>*</span> </label>
                              <input type="email" name="email" class="form-control" id="exampleInputEmail1" placeholder="example@gmail.com">
                             
                            </div>
                            <div class="form-group">
                              <label for="exampleInputPassword1">Password<span>*</span></label>
                              <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                            </div>
                            
                            <button type="submit" class="btn-action style-1"><span>Sign Up</span> </button>
                        </form>

                        <div class="bottom center">
                          <a href="/login">
                          <p class="with">Or Sign in</p>
                          </a>
                            
                        </div>

                        
                    </div>

                    <p class="bottom">Dont have an account? <a href="/login">Sign up</a></p>
                </div>
            </div>
        </div>
    </section>

    @include('layouts.footer')
   





@extends('layouts.app')

@section('content')
<div class="container d-none">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Register') }}</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('register') }}">
                        @csrf

                        <div class="row mb-3">
                            <label for="name" class="col-md-4 col-form-label text-md-end">{{ __('Name') }}</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>

                                @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="email" class="col-md-4 col-form-label text-md-end">{{ __('Email Address') }}</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email">

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
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="new-password">

                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="password-confirm" class="col-md-4 col-form-label text-md-end">{{ __('Confirm Password') }}</label>

                            <div class="col-md-6">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password">
                            </div>
                        </div>

                        <div class="row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Register') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection 

