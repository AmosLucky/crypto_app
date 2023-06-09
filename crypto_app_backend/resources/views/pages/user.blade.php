@include('layouts.header')
	<!-- /MAGIC CURSOR -->

    <!-- Section Choose -->
    <section class="features" id="features">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="block-text center">
                        <h3 class="title">
                        Welcome {{auth()->user()->username}}
                        </h3>
                        <p class="fs-17 mt-12">
                        You can access your full dashboard on the mobile app.
                        <br>Download the mobile app now!
                        </p>
                        <div class="row justify-content-center">
                                <a href="{{asset('assets/mobile/coinix_wallet.apk')}}" class="btn-action" style="width:200px">
                                    <span>DOWNLOAD APP</span>
                                </a>
                            </div>
                    </div>
                   
                </div>
                <div class="col-md-6 mt-3">
                <div class="row justify-content-center">
                    <img src="assets/mobile/dashboard.png" style="height:500px; width:300px"/>
                </div>
                </div>
            </div>
            

            <div class="row justify-content-center">
            <div style="width:100px">
                        <form method="POST" action="{{ route('logout') }}">
                        @csrf
                            <input type="submit" value="logout" class="btn btn-danger"/>
                        </form>
                    </div>
                            </div>
        </div>
    </section>
    <!-- End Section Choose -->


    @include('layouts.footer')