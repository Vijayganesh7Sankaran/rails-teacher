
    <script type="text/javascript" src="http://www.quotationspage.com/data/1mqotd.js">
    </script>
    <script src="../dists/js/jquery.min.js"></script>
    <script src="../dists/js/bootstrap.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
    <script src="../dists/js/nprogress.js"></script>
    <script src="../dists/js/sweetalert.min.js"></script>
    <!-- gauge js -->
    <script type="text/javascript" src="../dists/js/gauge/gauge.min.js"></script>
    <script type="text/javascript" src="../dists/js/gauge/gauge_demo.js"></script>
    <!-- chart js -->
    <script src="../dists/js/chartjs/chart.min.js"></script>
    <!-- bootstrap progress js -->
    <script src="../dists/js/progressbar/bootstrap-progressbar.min.js"></script>
    <!-- icheck -->
    <script src="../dists/js/icheck/icheck.min.js"></script>
    <!-- daterangepicker -->
    <script type="text/javascript" src="../dists/js/moment/moment.min.js"></script>
    <script type="text/javascript" src="../dists/js/datepicker/daterangepicker.js"></script>
    <script src="../dists/js/custom.js"></script>
    <!-- flot js -->
    <!--[if lte IE 8]><script type="text/javascript" src="../dists/js/excanvas.min.js"></script><![endif]-->
    <script type="text/javascript" src="../dists/js/flot/jquery.flot.js"></script>
    <script type="text/javascript" src="../dists/js/flot/jquery.flot.pie.js"></script>
    <script type="text/javascript" src="../dists/js/flot/jquery.flot.orderBars.js"></script>
    <script type="text/javascript" src="../dists/js/flot/jquery.flot.time.min.js"></script>
    <script type="text/javascript" src="../dists/js/flot/date.js"></script>
    <script type="text/javascript" src="../dists/js/flot/jquery.flot.spline.js"></script>
    <script type="text/javascript" src="../dists/js/flot/jquery.flot.stack.js"></script>
    <script type="text/javascript" src="../dists/js/flot/curvedLines.js"></script>
    <script type="text/javascript" src="../dists/js/flot/jquery.flot.resize.js"></script>
    <!-- worldmap -->
    <script type="text/javascript" src="../dists/js/maps/jquery-jvectormap-2.0.3.min.js"></script>
    <script type="text/javascript" src="../dists/js/maps/gdp-data.js"></script>
    <script type="text/javascript" src="../dists/js/maps/jquery-jvectormap-world-mill-en.js"></script>
    <script type="text/javascript" src="../dists/js/maps/jquery-jvectormap-us-aea-en.js"></script>
    <!-- pace -->
    <script src="../dists/js/pace/pace.min.js"></script>
    <!-- skycons -->
    <script src="../dists/js/skycons/skycons.min.js"></script>
    <script>
        NProgress.done();
    </script>
    <!--fullscreen-->
    <script>
        function toggleFullscreen(elem) {
            elem = elem || document.documentElement;
            if (!document.fullscreenElement && !document.mozFullScreenElement &&
              !document.webkitFullscreenElement && !document.msFullscreenElement) {
                if (elem.requestFullscreen) {
                    elem.requestFullscreen();
                } else if (elem.msRequestFullscreen) {
                    elem.msRequestFullscreen();
                } else if (elem.mozRequestFullScreen) {
                    elem.mozRequestFullScreen();
                } else if (elem.webkitRequestFullscreen) {
                    elem.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
                }
            } else {
                if (document.exitFullscreen) {
                    document.exitFullscreen();
                } else if (document.msExitFullscreen) {
                    document.msExitFullscreen();
                } else if (document.mozCancelFullScreen) {
                    document.mozCancelFullScreen();
                } else if (document.webkitExitFullscreen) {
                    document.webkitExitFullscreen();
                }
            }
        }

        document.getElementById('fullScreenBtn').addEventListener('click', function () {
            toggleFullscreen();
        });

    </script>
    <!--/fullscreen-->
    <script>
        
    $(document).ready(function(){
        if($(window).outerHeight(true) > $('.sizer').outerHeight(true)){
            $('footer').css('margin-top',$(window).outerHeight(true) - 145 - $('.sizer').outerHeight(true));
        }
        console.log($(window).outerHeight(true));
        console.log($('.sizer').outerHeight(true));
    });
    </script>
        
    // <script>
    //     $(document).ready(function(){
    //         if(document.URL.indexOf("#") == -1){
    //             url = document.URL + "#";
    //             location = "#";
    //             location.reload(true);
    //         }
    //     });
    // </script>