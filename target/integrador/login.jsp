<%@page import="ar.com.integrador.domain.Orador"%>
<%@page import="java.util.List"%>

<!doctype html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/estilos-propios.css">
    <link rel="shortcut icon" href="./img/codoacodo-min.png" type="image/x-icon">

    <title>Trabajo Integrador</title>
    <style>
        body {
            height: 100vh;
            display: grid;
            grid-template-rows: 10% 75% 15%;
            grid-template-areas: "header" "main" "footer";
        }

        header {
            grid-area: header;
        }

        main {
            grid-area: main;
            overflow: auto;
        }

        footer {
            grid-area: footer;

        }
    </style>
</head>

<body>

    <header>
        <nav class="navbar navbar-dark bg-dark fixed-top navbar-expand-lg">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">
                    <img src="img/codoacodo-min.png" alt="Codo a Codo logo"> Conf Bs As
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                    <ul class="navbar-nav mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="./index.jsp">La conferencia</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./index.jsp#oradores">Los oradores</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./index.jsp#lugar">El lugar y la fecha</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./index.jsp#form-orador">Conviértete en orador</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn-compra-tickets" href="comprar-tickets.html">Comprar tickets</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">LogIn</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <main class="d-flex justify-content-center align-items-center">
        <section class="mt-5 container" id="form-orador">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xl-7">
                    <h2 class="titulo-gral mb-3">LogIn</h2>

                    <!-- Formulario de inicio de sesión -->
                    <form action="<%=request.getContextPath()%>/LoginAdminController" method="POST">
                        <div class="row justify-content-center">
                            <div class="col-8 mb-3 mb-4">
                                <input type="text" class="form-control" name="nombre" placeholder="Usuario" required>
                            </div>
                            <div class="col-8 mb-3 mb-4">
                                <input type="password" class="form-control" name="password" placeholder="Contraseña"
                                    required>
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="col-8 mb-3">
                                <div class="d-grid">
                                    <button type="submit" class="btn btn-lg btn-form">LogIn</button>
                                </div>
                            </div>
                        </div>
                    </form>

                    <!-- Mostrar mensaje de error si existe -->
                    <% if (request.getAttribute("error") != null) { %>
                        <div class="alert alert-danger" role="alert">
                            <%= request.getAttribute("error") %>
                        </div>
                    <% } %>

                    <!-- Nuevo botón para administrar usuarios -->
                    <div class="row justify-content-center">
                        <div class="col-8 mb-3">
                            <div class="d-grid">
                                <a href="<%=request.getContextPath()%>/AdminUsuariosController"
                                    class="btn btn-lg btn-secondary">Administrar Usuarios</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <footer id="main-footer">
        <div class="container">
            <ul class="nav justify-content-center justify-content-lg-between align-items-center">
                <li class="nav-item">
                    <a class="nav-link" href="#">Preguntas <span>frecuentes</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contáctanos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Prensa</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Conferencias</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Términos y <span>condiciones</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Privacidad</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Estudiantes</a>
                </li>
            </ul>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>

</html>
