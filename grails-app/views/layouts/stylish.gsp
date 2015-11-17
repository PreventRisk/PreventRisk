<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <g:javascript library="jquery"/>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>

  <title>PreventRisk</title>

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
                <a href="#top" onclick = $("#menu-close").click(); ><i class="fa fa-home fa-lw"></i>&nbsp; Inicio</a>
            </li>
            <li>
                <a href="#services" onclick = $("#menu-close").click(); ><i class="fa fa-shield fa-lw"></i>&nbsp; Servicios</a>
            </li>
            <li>
                <a href="#entities" onclick = $("#menu-close").click(); ><i class="fa fa-map-marker fa-lw"></i>&nbsp; Entidades cercanas</a>
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
                <h3>Hola ${session.user.lastName} ${session.user.firstName}!
                <br>Aquí sabrás qué hacer en caso de emergencias.</h3>
                <h4><a href="http://localhost:9090/PreventRisk/user/logout">Cerrar sesión</a></h4>
                <br>
            </g:if>
            <g:else>
                <h3>Aquí sabrás qué hacer en caso de emergencias.</h3>
                <h4><a href="http://localhost:9090/PreventRisk/user/login">Inicia sesión</a>. Si
                eres nuevo, regístrate <a href="http://localhost:9090/PreventRisk/user/registro">aquí</a>.</h4>
                <br>
            </g:else>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <a href="#about" class="btn btn-dark btn-lg">Saber más</a>
                </div>
            </div>
        </div>
    </header>

    <!-- Services -->
    <!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
    <section id="services" class="services bg-primary">
        <div class="container">
            <div class="row text-center">
                <div class="col-lg-10 col-lg-offset-1">
                    <h2>¿Qué te ofrecemos?</h2>
                    <hr class="small">
                    <div class="row">
                        <div class="col-md-4 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-gear fa-stack-1x text-primary"></i>
                                </span>
                                <h4>
                                    <strong>Simulador</strong>
                                </h4>
                                <p>Puedes crear una situación de emergencia y mostraremos qué hacer.</p>
                                <a href="http://localhost:9090/PreventRisk/" class="btn btn-light">Ingresar</a>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-book fa-stack-1x text-primary"></i>
                                </span>
                                <h4>
                                    <strong>Curso</strong>
                                </h4>
                                <p>Aquí podrás aprender como actuar en caso de emergencia y ver tu progreso.</p>
                                <a href="http://localhost:9090/PreventRisk/" class="btn btn-light">Ingresar</a>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-hospital-o fa-stack-1x text-primary"></i>
                                </span>
                                <h4>
                                    <strong>Entidades cercanas</strong>
                                </h4>
                                <p>En caso de emergencia, verás que entidades de salud dependiendo del caso.</p>
                                <a href="#map_markers_div" class="btn btn-light">Ver</a>
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


    <!-- Call to Action -->
    <section id="entities" class="call-to-action bg-primary">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h3>Puedes ver cual droguería o hospital es el más cercano.</h3>
                    <div class="form-group">
                        <label for="sel1"><h4>Filtrar por:</h4></label>
                        <select class="form-control" id="sel1" style ="opacity: 0.8; border-bottom: none">
                            <option disabled="disabled">-- Seleccione -- </option>
                            <option>Droguerias</option>
                            <option>Hospitales</option>
                            <option>Centros de salud</option>
                        </select>
                    </div>
                    <a href="#" class="btn btn-lg btn-dark">Ver</a>
                </div>
            </div>
        </div>
    </section>

    <div id="map_div" style="height: 450px"></div>

    <script type="text/javascript">
        var hospitalmarkers = [];
        var drugstoremakers = [];
        var gmarkers = [];
        var mapOptions = {
            zoom: 13,
            center: new google.maps.LatLng(4.6381991, -74.0862351),
            mapTypeId: google.maps.MapTypeId.HYBRID
        };

        var map = new google.maps.Map(document.getElementById('map_div'), mapOptions);
        var infowindow = new google.maps.InfoWindow();
        var marker;

        var locations = '/PreventRisk/location.json'
        $.getJSON(locations, function(data){
            $.each(data, function(key, value){
                var hospIcon = new google.maps.MarkerImage('${request.contextPath}/stylish/img/Hospital.png', null, null, null, new google.maps.Size(35,35));
                var drugIcon = new google.maps.MarkerImage('${request.contextPath}/stylish/img/Drogueria.png', null, null, null, new google.maps.Size(35,35));
                var description;
                var icon;
                if(value.class == "Hospital"){
                    description = "<h4>Hospital</h4><h5>"
                            + value.name + "</h5>" +
                    "<p><b>Tipo: </b>" + value.type + '</p>' +
                    "<p><b>Calidad: </b>" + value.quality + "</p>";
                    //icon = base + 'Hospital.png'
                    icon = hospIcon;
                }else if (value.class == "Drugstore"){
                    description = "<h4>Droguería</h4><h5>"
                            + value.name + "</h5>" +
                    "<p><b>Especialidad: </b>" + value.speciality + '</p>';
                    //icon = base + 'Drogeria.png'
                    icon = drugIcon;
                }
                var myLatlng = new google.maps.LatLng(value.longitude, value.latitude);
                //alert(myLatlng);
                var marker = new google.maps.Marker({
                    position: myLatlng,
                    map: map,
                    title: value.name,
                    icon: icon
                });
                google.maps.event.addListener(marker, 'click', (function(marker) {
                    return function() {
                        infowindow.setContent(description);
                        infowindow.open(map, marker);
                    }
                })(marker))

            });
        });

    </script>

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