<!-- Code referenced from the following site(s): 
    https://getbootstrap.com/docs/4.6/examples/ 
    https://www.jquery-az.com/bootstrap-button-9-demos-of-custom-color-size-dropdown-navbar-and-more/
    https://www.guru99.com/jsp-form.html
-->
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        .btn-default
        {
          background-color: #60cadd;
          color:rgb(0, 0, 0);
          border-color: #233b4b;
        }
        .btn-default:hover, .btn-default:focus, .btn-default:active, .btn-default.active, .open .dropdown-toggle.btn-default {
          background-color: #224257;
          color:#FFF;
          border-color: #31347B;
         }
        
    </style>
</head>
<body class="text-center">
      
    <main class="form-signin">
    <form action="pre-home.jsp" method="GET">
        <h1 class="h3 mb-3 fw-normal">Welcome to the AniShel pet adoption site!</h1>
        <h1 class="h3 mb-3 fw-normal">Please sign in with your User ID</h1>
        <h2 class="h5 mb-3 fw-normal">(For the sake of the demo, ID's range from 1 to 15)</h2>

        <!-- get username input to use in next page -->
        <div class="form-floating">
            UserID: <input type="text" name="username"> 
        </div>

        <div class="form-floating">
            Password:  <input type="text" name="password" />
        </div>

        <div class="checkbox mb-3">
        <label> <input type="checkbox" value="remember-me"> Remember me </label>
        </div>


        <!-- button to switch to new page -->
        <button class="btn btn-default" input="submit">Sign in</button>

    </form>
        <br/>
        <a href="employee_login.jsp">
        <button id="signin" class="btn btn-default">Switch to an Employee Login</button>
        </a>
    </main>
    
    <script> /*jslint sub: true, maxerr: 50, indent: 4, browser: true */

    (function (global) {
        document.getElementById("signin").addEventListener("click", function () {
            global.localStorage.setItem("mySharedData", document.getElementById("output").value);
        }, false);
    }(window));
    </script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
  </body>
</html>
