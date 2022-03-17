<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/styles.css">
    <script src="https://kit.fontawesome.com/224143ea2d.js" crossorigin="anonymous"></script>
    <script src="/js/myScript.js"></script>
    <title>Recent codes</title>
    <link rel="icon" type="image/png" href="/imgs/code-pngrepo-com.png">
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">Sharing <img src="../static/imgs/code-pngrepo-com.png" alt="" style="height: 1em;"> Codes</a>
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
    <h1>Last 10 snippets</h1>
    <div class="list-group">
        <#list latestCodes as pieceOfCode>
            <a href="/code/${pieceOfCode.getId()}" target="_blank" class="list-group-item list-group-item-action flex-column align-items-start">
                <div class="d-flex w-100 justify-content-between">
                    <h5 class="mb-1">${pieceOfCode.getId()}</h5>
                    <small class="text-muted"><span id="load_date">${pieceOfCode.date}</span></small>
                </div>
                <p class="mb-1">${pieceOfCode.shortCode()}</p>
            </a>
        </#list>
    </div>
</div>


<script src="/js/jquery.slim.min.js"></script>
<script src="/js/bootstrap.bundle.min.js"></script>
</body>

</html>