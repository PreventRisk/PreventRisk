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

    <!-- se agrega stilo rectangular sobresaliente -->
    <style>
    div.transbox
    {
        margin: 20px;
        background: url(${request.contextPath}/login-form/assets/img/bg-opacity.png) repeat;
        opacity:0.9;
    }
    .circular {
        width: 200px;
        height: 200px;
        border-radius: 150px;
        -webkit-border-radius: 150px;
        -moz-border-radius: 150px;
        background: url(${request.contextPath}/stylish/img/test.jpg) no-repeat;
    }

    </style>
</head>

<body>

<!-- Navigation -->


<a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i class="fa fa-bars"></i></a>
<nav id="sidebar-wrapper">
    <ul class="sidebar-nav">
        <a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle"><i class="fa fa-times"></i></a>
        <g:if test="${!session?.user}">
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

<g:if test="${!session.user}">
    <header id="top" class="header">
        <div class="text-vertical-center">
            <div class="container" >gi
                <img src="${request.contextPath}/stylish/img/preventrisk-w.png" width="200px" height="auto" />
            </div>
            <h3>Usted no tiene permiso para acceder a esta página.</h3>
            <br>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <a href="http://localhost:9090/PreventRisk/" class="btn btn-dark btn-lg">Ir a inicio</a>
                </div>
            </div>
        </div>
    </header>
</g:if>

<!-- body -->


<g:if test="${session?.user}">
    <section id="top" class="header">
        <div class="container">
            <br>
            <br>
            <center><div class="service-item">
                <img src="${request.contextPath}/stylish/img/preventrisk-w.png" width="200px" height="auto" />
                <h3>Hola ${session.user.firstName} ${session.user.lastName}! Estos son los resultados</h3>
            </div></center>
            <div class="transbox">

                <div class="row text-center">
                <div class="col-lg-10 col-lg-offset-1">
                    <br>
                    <br>
                    <br>
                    <h2>Ud. sufre de: "(Insertar variableRes)"</h2>

                    <hr class="small">
                    <br><br><br>
                    <div class="row">

                        <div class="col-md-4 col-sm-6">
                            <center><div class="circular" width="200px" height="auto"></div></center>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <div class="service-item">
                                <h4>
                                    <strong>Pasos a seguir:</strong>
                                </h4>
                                <p>1.) <br> 2.) sss<br> 3.)  <br> 4.)  <br> 5.)
                                    1.) <br> 3.)  <br> 4.)  <br> 5.)
                                1.) <br> 3.)  <br> 4.)  ffff<br> 5.)
                                1.) <br> 3.)  <br> 4.)eeeew  <br> 5.)esta es una cadena de texto muy larga para poder comprobar la indentacion de la fuente en la columana de este texto
                                    <br> 2.) www <br> 2.)</p>

                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class=  "fa fa-heart-o fa-stack-1x text-primary"></i>
                                </span>
                                <h4>
                                    <strong>Espacio para Publicidad</strong>
                                </h4>
                                <p>blabla</p>
                                <a href="http://localhost:9090/PreventRisk/emergency/" class="btn btn-light">Nothing</a>
                            </div>
                        </div>
                    </div>
                    <!-- /.row (nested) -->
                </div>
                <div class=" row">
                    <div class="col-md-4 col-sm-6">
                        <div class="service-item">
                            <span class="fa-stack fa-4x">
                            </span>
                            <h4>
                                <strong>Regresar al Inicio</strong>
                            </h4>
                            <a href="http://localhost:9090/PreventRisk/" class="btn btn-light">Inicio</a>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-6">
                        <div class="service-item">
                            <span class="fa-stack fa-4x">
                            </span>
                            <h4>
                                <strong>Empezar una nueva simulación</strong>
                            </h4>
                            <a href="http://localhost:9090/PreventRisk/emergency/emergencyType" class="btn btn-light">Nueva</a>
                        </div>
                    </div>
                </div>
            </div>

                <!-- /.col-lg-10 -->
            </div>
            </div>
            <div class="col-lg-10 col-lg-offset-1 text-center">
                <!--  <hr class="small"> -->
                <!-- /.row (nested) -->
                <a href="http://localhost:9090/PreventRisk/emergency/emergencyType" class="btn btn-dark">Nueva Simulación</a>
                <br>
                <a href="http://localhost:9090/PreventRisk" class="btn btn-dark">Volver a inicio</a>
                <br>
                <h4><a href="http://localhost:9090/PreventRisk/user/logout" class="btn btn-dark">Cerrar sesión</a></h4>
            </div>
            <!-- /.row -->
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