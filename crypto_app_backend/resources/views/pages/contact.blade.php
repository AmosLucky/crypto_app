@include('layouts.header')


    <!-- Page Title -->
    <section class="page-title">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="content">
                        <h2 class="title">Contact Us</h2>
                    </div>
                </div>


    <!-- Section Contact -->
    <section class="contact" id="contact">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="block-text">
                        <h3>Contact Us</h3>
                        <p class="mt-12">We welcome any questions.
                             Please fill out the fields and file your complaints.
                              Our team is working around the clock to give you the best customer service. </p>
                    </div>
                    <ul class="contact__list">
                        <li>
                            <div class="icon"><span class="icon-message"></span></div>
                            <a href="mailto:support@coinixpro.com"><h5 class="fs-20">support@coinixpro.com</h5></a>
                        </li>
                        <!-- <li>
                            <div class="icon"><span class="icon-Calling"></span></div>
                            <h5 class="fs-20">+84 0977425031</h5>
                        </li> -->
                        <!-- <li>
                            <div class="icon"><span class="icon-telegram"></span></div>
                            <h5 class="fs-20">Join us on Telegram</h5>
                        </li> -->
                    </ul>
                </div>
                <div class="col-md-6">
                    @include('layouts.alert')
                    <div class="contact__fo" >

                        <form action="{{ route('contact') }}" method="post">
                            @csrf
                            <input type="text" placeholder="Full Name" name="name" require="">
                            <input type="email" placeholder="Email" name="email" require="">
                            <input type="tel" placeholder="Phone Number" name="phone" require="">
                            <textarea id="exampleFormControlTextarea1" rows="3" placeholder="Message" name="message"
                            require=""></textarea>

                            <button type="submit" class="btn-action"><span>SUBMIT YOUR MESSAGE</span></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

               


                
                
            </div>
        </div>
    </section>
    <!-- End Page Title -->
    <!-- <section class="page-title">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="content">
                        <h2 class="title">In Brief</h2>
                        <p>The first The Wallet for Ethereum (ETH) was launched in 2017. Since then, our team has built a unique ecosystem of blockchain-related products. Coinix squad comprises of highly experienced specialists.</p>
                    </div>
                </div>
                
            </div>
        </div>
    </section> -->


  

   

   

    <!-- Section Choose -->
    <section class="features" id="features">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="block-text center">
                        <h3 class="title">
                        Get started in 3 simple steps
                        </h3>
                        <p class="fs-17 mt-12">
                        It only takes a few minutes
                        </p>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-xl-3 col-md-6">
                    <div class="choose__box" data-aos="fade-up" data-aos-duration="800">
                        <div class="choose__box-icon center">
                            <div class="icon">
                                <span class="icon-mobile"></span>
                            </div>
                            <div class="content">
                                <h5 class="h5">Download The Wallet</h5>
                                <!-- <p class="mt-9">The process of taking into account the collective opinion of a group</p> -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="choose__box" data-aos="fade-up" data-aos-duration="1000">
                        <div class="choose__box-icon center">
                            <div class="icon">
                                <span class="icon-startup"></span>
                            </div>
                            <div class="content">
                                <h5 class="h5">Create a new wallet</h5>
                                <!-- <p class="mt-9">The platform helps investors to make easy to purchase and sell their tokens</p> -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="choose__box" data-aos="fade-up" data-aos-duration="1200">
                        <div class="choose__box-icon center">
                            <div class="icon">
                                <span class="icon-vuesax"></span>
                            </div>
                            <div class="content">
                                <h5 class="h5">Get some crypto</h5>
                                <!-- <p class="mt-9">The platform helps investors to make easy to purchase and sell their tokens</p> -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- <div class="col-xl-3 col-md-6">
                    <div class="choose__box" data-aos="fade-up" data-aos-duration="1400">
                        <div class="choose__box-icon center">
                            <div class="icon">
                                <span class="icon-mobile"></span>
                            </div>
                            <div class="content">
                                <h5 class="h5">Security your money</h5>
                                <p class="mt-9">The process of taking into account the collective opinion of a group</p>
                            </div>
                        </div>
                    </div>
                </div> -->
            </div>

            <div class="row justify-content-center">
                                <a class="btn-action" style="width:200px" href="login">
                                    <span>DOWNLOAD APP</span>
                                </a>
                            </div>
        </div>
    </section>
    <!-- End Section Choose -->

    <!-- End Section Choaboutose -->

    @include('layouts.footer')