<!-- Footer -->
<footer class="footer style-2">
        <div class="footer__top">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="content">
                            <h3 class="">Don't miss out, Stay updated</h3>
                            <form action="#" class="d-none .d-lg-block .d-xl-none" id="subscribe-form">
                                <input type="email" placeholder="Enter your email" required="" id="subscribe-email">
                                <button class="btn-action s2" type="submit" id="subscribe-button"> <span class="effect">SUBSCRIBE</span></button>
                            </form>
                            <p>Don’t hesitate to subscribe to latest news about crypto markets as well as crucial financial knowledge to become successful investors in a global standard.</p>
                            <ul class="list-social d-none">
                                <li><a href="#"><span class="icon-twitter"></span></a></li>
                                <li><a href="#"><span class="icon-facebook"></span></a></li>
                                <li><a href="#"><span class="icon-place"></span></a></li>
                                <li><a href="#"><span class="icon-youtobe"></span></a></li>
                                <li><a href="#"><span class="icon-tiktok"></span></a></li>
                                <li><a href="#"><span class="icon-reddit"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-5">
                        
                    </div>
                </div>
            </div>
        </div>
        <div class="footer__bottom center">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <p>© 2023. All rights reserved </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- End Footer -->
    <a id="scroll-top"></a>

    <script src="app/js/jquery.min.js"></script>
    <script src="app/js/jquery.easing.js"></script>
    <script src="app/js/app.js"></script>
    <script src="app/js/count-down.js"></script>
    <script src="app/js/aos.js"></script>
    <script src="app/js/chart.js"></script>
    <script>
        AOS.init();
      </script>

      <script>
        let  numberPercent = document.querySelectorAll('.countbar')
        let getPercent = Array.from(numberPercent)
            getPercent.map((items) => {
                let startCount = 0
                let progressBar = () => {
                    startCount ++
                    items.style.width = `${startCount}%`
                    if(startCount == items.dataset.percentnumber) {
                        clearInterval(stop)
                    }
                }
                let stop = setInterval(() => {
                    progressBar()
                },25)
            })
            
      </script>
      <script>
          const data1 = {
            labels: [
                'Marketing',
                'Bussiness Development',
                'Product Development',
                'Reserve',
                'Reserve',
                'Token Sale'
            ],
            datasets: [{
                label: 'My First Dataset',
                data: [25, 25, 10 , 10 , 10 , 20],
                backgroundColor: [
                '#3D88FB',
                '#5637C8',
                '#00D199',
                '#C87B07',
                '#A92535',
                '#9116CD'
                ], 
            }]
        };

        const config1 = {
            type: 'doughnut',
            data: data1,
            width:240,
            options: {
                maintainAspectRatio: false,
                plugins: {
                    legend: false // Hide legend
                },
                scales: {
                    y: {
                        display: false // Hide Y axis labels
                    },
                    x: {
                        display: false // Hide X axis labels
                    }
                }   
            }
        };

            const myChart1 = new Chart(
            document.getElementById('myChart1'),
            config1
            );
            const myChart2 = new Chart(
            document.getElementById('myChart2'),
            config1
        );
      </script>

      <script src="app/js/mouse.js"></script>


</body>

</html>