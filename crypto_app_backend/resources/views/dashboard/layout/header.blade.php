<?php
use \App\Http\Controllers\TransactionController;
use \App\Http\Controllers\AdminController;



?>

{{AdminController::checkUser()}}

<!DOCTYPE html>
<html lang="en">

    
<!-- Mirrored from coderthemes.com/simple/layouts/vertical/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 14 Apr 2022 03:38:30 GMT -->
<head>
        <meta charset="utf-8" />
        <title>Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Dashboard" name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="{{ asset('logo/coinix.png') }}">
        <!-- App css -->
        <link href="{{ asset('admin/css/bootstrap.min.css') }}" rel="stylesheet" type="text/css" id="bootstrap-stylesheet" />
        <link href="{{ asset('admin/css/icons.min.css') }}" rel="stylesheet" type="text/css" />
        <link href="{{  asset('admin/css/app.min.css') }}" rel="stylesheet" type="text/css" id="app-stylesheet" />

    </head>

    <body>

        <!-- Begin page -->
        <div id="wrapper">
                
            <!-- Topbar Start -->
            <div class="navbar-custom">
                <ul class="list-unstyled topnav-menu float-right mb-0">

                


                 


                </ul>

                <!-- LOGO -->
                <div class="logo-box">
                    <a href="/" class="logo text-center logo-dark">
                        <span class="logo-lg">
                            
                            <img src="{{ asset('assets/logo/coinix_black.png') }}" alt="" height="26">
                            <!-- <span class="logo-lg-text-dark">Simple</span> -->
                        </span>
                        <span class="logo-sm">
                            <!-- <span class="logo-lg-text-dark">S</span> -->
                            <img src="{{ asset('assets/logo/coinix_black.png') }}" alt="" height="22">
                        </span>
                    </a>

                    <a href="/" class="logo text-center logo-light">
                        <span class="logo-lg">
                            <img src="{{ asset('assets/logo/coinix_black.png') }}" alt="" height="26">
                            <!-- <span class="logo-lg-text-light">Simple</span> -->
                        </span>
                        <span class="logo-sm">
                            <!-- <span class="logo-lg-text-light">S</span> -->
                            <img src="{{ asset('logo/coinix.png') }}" alt="" height="22">
                        </span>
                    </a>
                </div>

                <ul class="list-unstyled topnav-menu topnav-menu-left m-0">
                    <li>
                        <button class="button-menu-mobile">
                            <i class="mdi mdi-menu"></i>
                        </button>
                    </li>
        
                    <li class="d-none d-sm-block">
                        <form class="app-search">
                            <div class="app-search-box">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search...">
                                    <div class="input-group-append">
                                        <button class="btn" type="submit">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </li>
                </ul>
            </div>
            <!-- end Topbar --> <!-- ========== Left Sidebar Start ========== -->
<div class="left-side-menu">


                <!-- <div class="user-box">
                        <div class="float-left">
                            <img src="assets/images/users/avatar-1.jpg" alt="" class="avatar-md rounded-circle">
                        </div>
                        <div class="user-info">
                            <a href="#">Stanley Jones</a>
                            <p class="text-muted m-0">Administrator</p>
                        </div>
                    </div> -->
    
            <!--- Sidemenu -->
            <div id="sidebar-menu">
    
                <ul class="metismenu" id="side-menu">
    
                    <li class="menu-title">Navigation</li>
    
                    <li>
                        <a href="/dashboard">
                            <i class="ti-home"></i>
                            <span> Dashboard </span>

                        </a>
                    </li>
                    <li>
                        <a href="/transactions/credits">
                            <i class="ti-pie-chart"></i>
                            <span class="">Credit request</span>
                            <span class="badge badge-primary float-right">{{count(TransactionController::getPendingCreditTransactions())}}</span>

                        </a>
                    </li>
                    <li>
                        <a href="/transactions/debits">
                            <i class="ti-pie-chart"></i>
                            <span class="">Debit request</span>
                            <span class="badge badge-primary float-right">{{count(TransactionController::getPendingDebitTransactions())}}</span>

                        </a>
                    </li>
                    <li>
                        <a href="/transactions">
                            <i class="ti-pie-chart"></i>
                            <span>All  Transactions  </span>
                            
                        </a>
                    </li>

                    <li>
                        <a href="/coin/add">
                            <i class="ti-paint-bucket"></i>
                            <span> Add coin </span>
                        </a>
                    </li>
                    <li >
                        <a>
                    
                        <form method="post" action="{{ route('logout') }}">
                            @csrf
                           
                            <input type="submit" value="logout"/>
                        </form>
</a>
                    </li>

                    
    
                   
    
                   
                   
    
                   
                </ul>
    
            </div>
            <!-- End Sidebar -->
    
            <div class="clearfix"></div>

    
    </div>
    <!-- Left Sidebar End -->
                <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->

            <div class="content-page">
                <div class="content">

                  