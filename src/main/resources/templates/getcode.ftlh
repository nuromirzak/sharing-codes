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
    <title>Share your code!</title>
    <link rel="icon" type="image/png" href="/imgs/code-pngrepo-com.png">

<#--    Special for this page-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.5.0/styles/default.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.5.0/highlight.min.js"></script>
    <script>
        hljs.initHighlightingOnLoad();
    </script>
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">Sharing <img src="../static/imgs/code-pngrepo-com.png" alt="" style="height: 1em;"> Codes</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <ul class="navbar-nav mr-auto">
            <li><a class="nav-link" href="/code/recent">Recent codes</a></li>
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
    <h1 class="display-6">${pieceOfCode.getId()}</h1>
    <span id="load_date">${pieceOfCode.getDate()}</span>
    <#if pieceOfCode.isTimeLimit()>
        <br>
        <small>The code will be available for <u><span id="time_restriction">${pieceOfCode.getTime()}</span></u> seconds</small>
    </#if>
    <#if pieceOfCode.isViewsLimit()>
        <br>
        <#if pieceOfCode.getViews() == 0>
            <small><u><span id="views_restriction">No more views allowed</small>
        <#else>
            <small><u><span id="views_restriction">${pieceOfCode.getViews()}</span></u> more views allowed</small>
        </#if>
    </#if>
    <pre id="code_snippet" class="border border-dark p-0"><code>${pieceOfCode.getCode()}</code></pre>
</div>


<script src="/js/jquery.slim.min.js"></script>
<script src="/js/bootstrap.bundle.min.js"></script>
</body>

</html>