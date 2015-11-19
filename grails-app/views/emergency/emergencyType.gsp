<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>PreventRisk - Simulador</title>

    <!-- Bootstrap Core CSS -->
    <link href="${request.contextPath}/stylish/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${request.contextPath}/stylish/css/stylish-portfolio.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${request.contextPath}/stylish/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/ico" href="${request.contextPath}/stylish/img/favicon.ico"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<!-- Navigation -->


<a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i class="fa fa-bars"></i></a>
<nav id="sidebar-wrapper">
    <ul class="sidebar-nav">
        <a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle"><i class="fa fa-times"></i></a>
        <g:if test="${!session.user}">
            <li class="sidebar-brand">
                <a href="http://localhost:9090/PreventRisk/user/login"  onclick = $("#menu-close").click(); ><i class="fa fa-user fa-lw"></i>&nbsp; Ingresar</a>
            </li>
        </g:if>
        <g:else>
            <li class="sidebar-brand">
                <a href="http://localhost:9090/PreventRisk/user/logout"  onclick = $("#menu-close").click(); ><i class="fa fa-user fa-lw"></i>&nbsp; Salir</a>
            </li>
        </g:else>
        <li>
            <a href="http://localhost:9090/PreventRisk" onclick = $("#menu-close").click(); ><i class="fa fa-home fa-lw"></i>&nbsp; Inicio</a>
        </li>
        <li>
            <a href="http://localhost:9090/PreventRisk/#services" onclick = $("#menu-close").click(); ><i class="fa fa-shield fa-lw"></i>&nbsp; Servicios</a>
        </li>
        <li>
            <a href="http://localhost:9090/PreventRisk#entities" onclick = $("#menu-close").click(); ><i class="fa fa-map-marker fa-lw"></i>&nbsp; Entidades cercanas</a>
        </li>
        <li>
            <a href="#about" onclick = $("#menu-close").click(); ><i class="fa fa-info-circle fa-lw"></i>&nbsp; Sobre nosotros</a>
        </li>
    </ul>
</nav>

<!-- Header -->
<header id="top" class="header">
    <div class="text-vertical-center">
        <div class="container" >
            <img src="${request.contextPath}/stylish/img/preventrisk-w.png" width="200px" height="auto" />
        </div>
        <g:if test="${session.user}">
            <h3>¡Bienvenido ${session.user.firstName} ${session.user.lastName} a nuestro simulador!
                <br></h3>
            <br>
        </g:if>
        <g:else>
            <h3>Para ingresar a la simulacion primero debe iniciar sesión.</h3>
            <br>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <a href="http://localhost:9090/PreventRisk/user/login" class="btn btn-dark btn-lg">Iniciar sesión</a>
                </div>
            </div>
        </g:else>
    </div>
</header>


<g:if test="${session.user}">

    <section id="services" class="services bg-primary">
        <div class="container">
            <div class="row text-center">
                <div class="col-lg-10 col-lg-offset-1">
                    <h2>Escoge la naturaleza de la emergencia</h2>
                    <hr class="small">
                    <div class="row">
                        <div class="col-md-4 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-gear fa-stack-1x text-primary"></i>
                                </span>
                                <h4>
                                    <strong>Emergencia Médica</strong>
                                </h4>
                                <p>Estas son debidas a</p>
                                <a href="http://localhost:9090/PreventRisk/emergency/emergencyType" class="btn btn-light">Empieza</a>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-book fa-stack-1x text-primary"></i>
                                </span>
                                <h4>
                                    <strong>Emergencia Medioambiental</strong>
                                </h4>
                                <p>blablabla</p>
                                <a href="http://localhost:9090/PreventRisk/" class="btn btn-light">Empieza</a>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-hospital-o fa-stack-1x text-primary"></i>
                                </span>
                                <h4>
                                    <strong>Emergencia Civil</strong>
                                </h4>
                                <p>blablabla</p>
                                <a href="#map_div" class="btn btn-light">Empieza</a>
                            </div>
                        </div>
                    </div>
                    <!-- /.row (nested) -->
                </div>
                <!-- /.col-lg-10 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>


    <section id="portfolio" class="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <!--  <hr class="small"> -->
                    <!-- /.row (nested) -->
                    <a href="http://localhost:9090/PreventRisk/" class="btn btn-dark">Regresar al Inicio</a>
                    <h4><a href="http://localhost:9090/PreventRisk/user/logout">Cerrar sesión</a></h4>
                    <br>
                </div>
                <!-- /.col-lg-10 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>
</g:if>


<!-- Footer -->
<section id = "about">
    <div class="container">
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1 text-center">
                <h4><strong>PreventRisk</strong>
                </h4>
                <p>Bogotá D.C. - Colombia</p>
                <br>
                <ul class="list-inline">
                    <li>
                        <a href="#"><i class="fa fa-facebook fa-fw fa-3x"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-twitter fa-fw fa-3x"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-dribbble fa-fw fa-3x"></i></a>
                    </li>
                </ul>
                <hr class="small">
                <p class="text-muted">Copyright &copy; PreventRisk 2015</p>
            </div>
        </div>
    </div>
</section>

<!-- jQuery -->
<script src="${request.contextPath}/stylish/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${request.contextPath}/stylish/js/bootstrap.min.js"></script>

<!-- Custom Theme JavaScript -->
<script>
    // Closes the sidebar menu
    $("#menu-close").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });
    // Opens the sidebar menu
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });
    // Scrolls to the selected menu item on the page
    $(function() {
        $('a[href*=#]:not([href=#])').click(function() {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {
                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });
    });
</script>

</body>

</html>