<%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 06/12/2015
  Time: 18:57
--%>
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
  .round {
    border-radius: 50%;
    overflow: hidden;
    width: 200px;
    height: 200px;
  }
  .round img {
    display: block;
    /* Stretch
          height: 100%;
          width: 100%; */
    min-width: 100%;
    min-height: 100%;
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
        <a href="${request.contextPath}/user/login"  onclick = $("#menu-close").click(); ><i class="fa fa-user fa-lw"></i>&nbsp; Ingresar</a>
      </li>
    </g:if>
    <g:else>
      <li class="sidebar-brand">
        <a href="${request.contextPath}/user/logout"  onclick = $("#menu-close").click(); ><i class="fa fa-user fa-lw"></i>&nbsp; Salir</a>
      </li>
    </g:else>
    <li>
      <a href="${request.contextPath}" onclick = $("#menu-close").click(); ><i class="fa fa-home fa-lw"></i>&nbsp; Inicio</a>
    </li>
    <li>
      <a href="${request.contextPath}/#services" onclick = $("#menu-close").click(); ><i class="fa fa-shield fa-lw"></i>&nbsp; Servicios</a>
    </li>
    <li>
      <a href="${request.contextPath}#entities" onclick = $("#menu-close").click(); ><i class="fa fa-map-marker fa-lw"></i>&nbsp; Entidades cercanas</a>
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
      <div class="container" >
        <img src="${request.contextPath}/stylish/img/preventrisk-w.png" width="200px" height="auto" />
      </div>
      <h3>Usted no tiene permiso para acceder a esta página.</h3>
      <br>
      <div class="row">
        <div class="col-lg-12 text-center">
          <a href="${request.contextPath}/" class="btn btn-dark btn-lg">Ir a inicio</a>
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
        <h3>${session.user.firstName} ${session.user.lastName}, lo sentimos.</h3>
      </div></center>
      <div class="transbox">

        <div class="row text-center">
          <div class="col-lg-10 col-lg-offset-1">
            <br><br><br>
            <g:if test="${name == "Datos insuficientes"}">
              <h2>${name}</h2>


            <hr class="small">
            <div class="row">

              <div class="callout">
                <h3>Repita la simulación.</h3>
              </div>
            </g:if>
              <g:else>
                  <div class="callout">
                      <h3>Oops, no deberías estar aquí.</h3>
                  </div>
              </g:else>
              <!-- /.row (nested) -->
              <div class="col-lg-10 col-lg-offset-1 text-center">
                <!--  <hr class="small"> -->
                <!-- /.row (nested) -->
                <hr class="small">
                <a href="${request.contextPath}/emergency/emergencyType" class="btn btn-dark">Nueva Simulación</a>
                <hr class="small">
                <a href="${request.contextPath}" class="btn btn-dark">Volver a inicio</a>
                <br>
                <h4><a href="${request.contextPath}/user/logout" class="btn btn-dark">Cerrar sesión</a></h4>
              </div>
            </div>
          </div>

          <!-- /.col-lg-10 -->
        </div>
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
