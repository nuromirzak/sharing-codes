<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="page-status" content="unavailable"/>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/styles.css">
    <script src="https://kit.fontawesome.com/224143ea2d.js" crossorigin="anonymous"></script>
    <script src="/js/myScript.js"></script>
    <title>Secret code snippet!</title>
    <link rel="icon" type="image/png" href="/imgs/code-pngrepo-com.png">
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">Sharing <img src="/imgs/code-pngrepo-com.png" alt="" style="height: 1em;"> Codes</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <ul class="navbar-nav mr-auto">
            <li><a class="nav-link" href="/code/latest">Recent codes</a></li>
            <li><a class="nav-link" href="/code/usage">Usage</a></li>
            <li><a class="nav-link" href="/code/about">About</a></li>
        </ul>
        <span class="navbar-text">
                <a href="https://github.com/nuromirzak/sharing-codes" target="_blank">
                    <i class="fa-brands fa-github fa-2xl" style="color: black"></i>
                </a>
            </span>
    </div>
</nav>

<div class="container p-3">
    <form action="" onsubmit="check()">
        <div class="form-group">
            <label for="code_snippet"><h1>Secret code snippet 😎</h1></label>
            <div class="d-flex justify-content-center">
                <div class="row">
                    <div class="col">
                        <label for="password_field">Enter your password:</label>
                        <div class="d-flex justify-content-center">
                            <input type="text" class="form-control" id="password_field" placeholder="Secret password" style="margin-right: 10px;">
                            <button id="open_snippet" type="submit" class="btn btn-primary">Submit</button>
                        </div>
                        <small class="form-text text-muted">This code snippet has been encrypted. You must enter your password to view this code.</small>
                        <div class="alert alert-danger danger-message" role="alert" style="display: none;">
                            <h4 class="alert-heading">Oops!...</h4>
                            <p></p>
                            <p>Please check that you have entered the correct data.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>


<script src="/js/jquery.slim.min.js"></script>
<script src="/js/bootstrap.bundle.min.js"></script>
</body>

</html>