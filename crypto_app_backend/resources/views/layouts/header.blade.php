@php

$company_name = "Coinix Wallet";

@endphp
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from themesflat.co/html/icolandhtml/ by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 26 Mar 2023 16:51:40 GMT -->
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{$company_name}}</title>

    <!-- Styles -->
    <link rel="stylesheet" href="{{ asset('app/dist/app.css')}} ">
    <!-- end Styles -->

    <!-- Favicon and Touch Icons  -->
    <link rel="shortcut icon" href="{{ asset('logo/coinix.png') }}">
    <link rel="apple-touch-icon-precomposed" href="assets/images/logo/favicon.png">

</head>
<body class="home-main header-fixed" data-magic-cursor="show">
    
    <!-- Preloading -->
    <div class="preloader">
        <div class=" loader">
            <div class="square"></div>
            <div class="path">
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
            </div>
          <p class="text-load">Loading :</p>
        </div>
    </div> 
    <!-- End Preloading -->
    
    <!-- MAGIC CURSOR -->
		<div class="mouse-cursor cursor-outer"></div>
		<div class="mouse-cursor cursor-inner"></div>


    <!-- Header -->
    <header id="header_main" class="header">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="header__body">
                        <div class="header__logo">
                            <a href="/">
                                <img id="site-logo" src="{{ asset('assets/logo/coinix_white2.png') }}"
                                alt="Coinix wallet" width="165" height="40"
                                data-retina="{{ asset('assets/logo/coinix_white2.png') }}" data-width="165"
                                data-height="40">
                            </a>
                        </div>

                        <div class="header__right">
                            <nav id="main-nav" class="main-nav">
                                <ul id="menu-primary-menu" class="menu">
                                    
                                <li class="menu-item">
                                        <a href="/">Home</a>
                                    </li>
                                   
                                    <li class="menu-item">
                                        <a href="about">About Us</a>
                                    </li>
                                    <li class="menu-item">
                                        <a href="contact">Contact Us</a>
                                    </li>
                                   
                                    <li class="menu-item"><a href="login">Sign In</a></li>
                                            <li class="menu-item"><a href="register">Sign Up</a></li>
                                </ul>
                            </nav>
                            <div class="group-button">
                                <a class="btn-action" href="login">
                                    <span>LOGIN</span>
                                </a>
                            </div>
                            <div class="mobile-button"><span></span></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- end Header -->