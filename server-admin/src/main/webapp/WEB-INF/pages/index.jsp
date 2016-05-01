<%@page import="org.wso2.security.demo.headersecurity.Constants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- Meta, title, CSS, favicons, etc. -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>Server Manager</title>

  <!-- Bootstrap core CSS -->

  <link href="css/bootstrap.min.css" rel="stylesheet">

  <link href="fonts/css/font-awesome.min.css" rel="stylesheet">
  <link href="css/animate.min.css" rel="stylesheet">

  <!-- Custom styling plus plugins -->
  <link href="css/custom.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/maps/jquery-jvectormap-2.0.3.css" />
  <link href="css/icheck/flat/green.css" rel="stylesheet" />
  <link href="css/floatexamples.css" rel="stylesheet" type="text/css" />

  <script src="js/jquery.min.js"></script>
  <script src="js/nprogress.js"></script>

  <!--[if lt IE 9]>
        <script src="../assets/js/ie8-responsive-file-warning.js"></script>
        <![endif]-->

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

</head>


<body class="nav-md">
  <div class="container body">
    <div class="main_container">

      <!-- top navigation -->
      <div class="top_nav">
        <div class="nav_menu">
            <div style="padding-top:20px;padding-left:20px;font-size:large;font-weight:600;display: inline-block;">
            	<i class="fa fa-server"></i> Server Manager
            </div>
            <ul class="nav navbar-nav navbar-right">
              <li class="">
                <span class="user-profile">
                  User : <%=session.getAttribute(Constants.SESSION_ATTRIBUTE_USER) %>
                </span>
                <a href="<%=request.getContextPath() %>/logout" class="button" style="display: inline-block;">Logout</a>
              </li>
            </ul>
        </div>

      </div>
      <!-- /top navigation -->


      <!-- page content -->
      <div class="right_col" role="main">

        <!-- top tiles -->
        <div class="row tile_count">
          <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
            <div class="left"></div>
            <div class="right">
              <span class="count_top"><i class="fa fa-server"></i> Total Servers</span>
              <div class="count">26</div>
              <span class="count_bottom"><i class="green">4% </i> From last Week</span>
            </div>
          </div>
          <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
            <div class="left"></div>
            <div class="right">
              <span class="count_top"><i class="fa fa-clock-o"></i> Average Up-time</span>
              <div class="count">99.99%</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>0% </i> From last Week</span>
            </div>
          </div>
          <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
            <div class="left"></div>
            <div class="right">
              <span class="count_top"><i class="fa fa-server"></i> Total VMs</span>
              <div class="count" id="vm_count">134</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>8% </i> From last Week</span>
            </div>
          </div>
          <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
            <div class="left"></div>
            <div class="right">
              <span class="count_top"><i class="fa fa-user"></i> Total Pods</span>
              <div class="count">193</div>
              <span class="count_bottom"><i class="red"><i class="fa fa-sort-desc"></i>12% </i> From last Week</span>
            </div>
          </div>
          <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
            <div class="left"></div>
            <div class="right">
              <span class="count_top"><i class="fa fa-user"></i> Total Containers</span>
              <div class="count" id="container_count">854</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
            </div>
          </div>
          <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
            <div class="left"></div>
            <div class="right">
              <span class="count_top"><i class="fa fa-check"></i> Alerts</span>
              <div class="count red">6</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>1% </i> From last Week</span>
            </div>
          </div>

        </div>
        <!-- /top tiles -->

        <div class="row">
          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="dashboard_graph">

              <div class="row x_title">
                <div class="col-md-6">
                  <h3>Server Activities</h3>
                </div>
              </div>

              <div class="col-md-9 col-sm-9 col-xs-12">
                <div id="placeholder" style="height: 260px;" class="demo-placeholder"></div>
              </div>
              <div class="col-md-3 col-sm-3 col-xs-12 bg-white">
                <div class="x_title">
                  <h2>Top Resource Consumers</h2>
                  <div class="clearfix"></div>
                </div>

                <div class="col-md-12 col-sm-12 col-xs-6">
                  <div>
                    <p>Database Instances</p>
                    <div class="">
                      <div class="progress progress_sm" style="width: 76%;">
                        <div id="prog1" class="progress-bar bg-green" role="progressbar" data-transitiongoal="80"></div>
                      </div>
                    </div>
                  </div>
                  <div>
                    <p>Application Servers</p>
                    <div class="">
                      <div class="progress progress_sm" style="width: 76%;">
                        <div id="prog2" class="progress-bar bg-green" role="progressbar" data-transitiongoal="60"></div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-6">
                  <div>
                    <p>Caching Servers</p>
                    <div class="">
                      <div class="progress progress_sm" style="width: 76%;">
                        <div id="prog3" class="progress-bar bg-green" role="progressbar" data-transitiongoal="40"></div>
                      </div>
                    </div>
                  </div>
                  <div>
                    <p>Other</p>
                    <div class="">
                      <div class="progress progress_sm" style="width: 76%;">
                        <div id="prog4" class="progress-bar bg-green" role="progressbar" data-transitiongoal="20"></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="clearfix"></div>
            </div>
          </div>
        </div>
        <br />
		<div class="row">
          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="dashboard_graph">

              <div class="row x_title">
                <div class="col-md-6">
                  <h3>Control Commands</h3>
                </div>
              </div>
              <jsp:include page="control.jsp" />
              <div class="clearfix"></div>
            </div>
          </div>
        </div>
        <br />
        <!-- footer content -->
        <footer>
          <div class="copyright-info">
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
      <!-- /page content -->

    </div>
  </div>


  <script src="js/bootstrap.min.js"></script>

  <!-- bootstrap progress js -->
  <script src="js/progressbar/bootstrap-progressbar.min.js"></script>
  <script src="js/nicescroll/jquery.nicescroll.min.js"></script>
  <!-- icheck -->
  <script src="js/icheck/icheck.min.js"></script>
  <!-- daterangepicker -->
  <script type="text/javascript" src="js/moment/moment.min.js"></script>
  <script type="text/javascript" src="js/datepicker/daterangepicker.js"></script>
  <!-- chart js -->
  <script src="js/chartjs/chart.min.js"></script>

  <script src="js/custom.js"></script>

  <!-- flot js -->
  <!--[if lte IE 8]><script type="text/javascript" src="js/excanvas.min.js"></script><![endif]-->
  <script type="text/javascript" src="js/flot/jquery.flot.js"></script>
  <script type="text/javascript" src="js/flot/jquery.flot.pie.js"></script>
  <script type="text/javascript" src="js/flot/jquery.flot.orderBars.js"></script>
  <script type="text/javascript" src="js/flot/jquery.flot.time.min.js"></script>
  <script type="text/javascript" src="js/flot/date.js"></script>
  <script type="text/javascript" src="js/flot/jquery.flot.spline.js"></script>
  <script type="text/javascript" src="js/flot/jquery.flot.stack.js"></script>
  <script type="text/javascript" src="js/flot/curvedLines.js"></script>
  <script type="text/javascript" src="js/flot/jquery.flot.resize.js"></script>
  <!-- pace -->
  <script src="js/pace/pace.min.js"></script>
  <script>
	function randomIntFromInterval(min,max) {
      	return Math.floor(Math.random()*(max-min+1)+min);
  	}
  	setInterval(function() {
  		var containers = parseInt($('#container_count').html());
  		var prog1 = parseInt($('#prog1').attr('aria-valuenow'));
  		var prog2 = parseInt($('#prog2').attr('aria-valuenow'));
  		var prog3 = parseInt($('#prog3').attr('aria-valuenow'));
  		var prog4 = parseInt($('#prog4').attr('aria-valuenow'));
  		
  		var rand = randomIntFromInterval(-5,+5);
  		var rand1 = randomIntFromInterval(-5,+5);
  		var rand2 = randomIntFromInterval(-5,+5);
  		var rand3 = randomIntFromInterval(-5,+5);
  		var rand4 = randomIntFromInterval(-5,+5);
  		
  		if(containers < 800 && rand < 0) { rand *= -1; }
  		else if(containers > 950 && rand > 0) { rand *= -1; }
  		containers = containers + rand;
  		
  		if(prog1 < 85 && rand1 < 0) { rand1 *= -1; }
  		else if(prog1 > 60 && rand1 > 0) { rand1 *= -1; }
  		prog1 = prog1 + rand1;
  		
  		if(prog2 < 45 && rand2 < 0) { rand2 *= -1; }
  		else if(prog2 > 60 && rand2 > 0) { rand2 *= -1; }
  		prog2 = prog2 + rand2;
  		
  		if(prog3 < 35 && rand3 < 0) { rand3 *= -1; }
  		else if(prog3 > 45 && rand3 > 0) { rand3 *= -1; }
  		prog3 = prog3 + rand3;
  		
  		if(prog4 < 0 && rand4 < 0) { rand4 *= -1; }
  		else if(prog4 > 35 && rand4 > 0) { rand4 *= -1; }
  		prog4 = prog4 + rand4;
  		
  		$('#container_count').html(containers);
  		
  		$('#prog1').css('width', prog1+'%').attr('aria-valuenow', prog1);
  		$('#prog2').css('width', prog2+'%').attr('aria-valuenow', prog2);
  		$('#prog3').css('width', prog3+'%').attr('aria-valuenow', prog3);
  		$('#prog4').css('width', prog4+'%').attr('aria-valuenow', prog4);
  		
  	}, 1500);
  </script>
  <script type="text/javascript">
	$(function() {
		// We use an inline data source in the example, usually data would
		// be fetched from a server
		var data1 = [], data2 = [], data3 = [], totalPoints = 300;

		function getRandomData(list) {
			if (list.length > 0) {
				//list = list.slice(1);
				list.shift();
			}

			// Do a random walk
			while (list.length < totalPoints) {
				var prev = list.length > 0 ? list[list.length - 1] : 50, y = prev + (Math.random() * 10 - 5);
				if (y < 0) {
					y = 0;
				} else if (y > 80) {
					y = 80;
				}
				list.push(y);
			}
			
			// Zip the generated y values with the x values
			var res = [];
			for (var i = 0; i < list.length; ++i) {
				res.push([i, list[i]])
			}
			return res;
		}

		// Set up the control widget
		var updateInterval = 500;
		$("#updateInterval").val(updateInterval).change(function () {
			var v = $(this).val();
			if (v && !isNaN(+v)) {
				updateInterval = +v;
				if (updateInterval < 1) {
					updateInterval = 1;
				} else if (updateInterval > 2000) {
					updateInterval = 2000;
				}
				$(this).val("" + updateInterval);
			}
		});

		var data = [
					{ data: getRandomData(data1), label: "Memory Usage" },
					{ data: getRandomData(data2), label: "Network Usage" },
					{ data: getRandomData(data3), label: "CPU Usage" }
				];

		var plot = $.plot("#placeholder", data, {
			series: {
				shadowSize: 0	// Drawing is faster without shadows
			},
			yaxis: {
				min: 0,
				max: 100
			},
			xaxis: {
				show: false
			},
			legend: { position: "sw" }
		});

		function update() {
			plot.setData([getRandomData(data1),getRandomData(data2),getRandomData(data3)]);
			// Since the axes don't change, we don't need to call plot.setupGrid()
			plot.draw();
			setTimeout(update, updateInterval);
		}
		update();
	});

	</script>
  <!-- /footer content -->
</body>

</html>
