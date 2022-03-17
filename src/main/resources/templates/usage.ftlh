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
    <title>Usage</title>
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
    <h1 class="display-6">Usage</h1>
    <ul id="usage">
        <li>Code snippets should be accessible via UUID links. <code>POST /api/code/new</code> should return a UUID of the snippet instead of a number.<br>
        </li>
        <li><code>POST /api/code/new</code> should take a JSON object with a field <code>code</code> and two other fields:<br> 1. <code>time</code> field contains the time (in seconds) during which the snippet is accessible. <br> 2. <code>views</code>                field contains a number of views allowed for this snippet.<br> Remember, that 0 and negative values should correspond to the absence of the restriction.<br>
        </li>
        <li><code>GET /code/new</code> should contain two elements on top of the others:<br> 1. <code>&lt;input id="time_restriction" type="text"/&gt;</code> should contain the time restriction.<br> 2.
            <code>&lt;input id="views_restriction" type="text"/&gt;</code> should contain the views restriction<br>
            <br> Remember that POST request should contain numbers, not strings.<br>
        </li>
        <li><code>GET /api/code/latest</code> and <code>GET /code/latest</code> should not return any restricted snippets.<br>
        </li>
        <li><code>GET /api/code/UUID</code> should not be accessible if one of the restrictions is triggered. Return <code>404 Not Found</code> in this case and all the cases when no snippet with such a UUID was found.<br>
        </li>
        <li><code>GET /api/code/UUID</code> should show what restrictions apply to the code piece. Use the keys <code>time</code> and <code>views</code> for that. A zero value (0) should correspond to the absence of the restriction.<br> 1. <code>time</code>                field contains the time (in seconds) during which the snippet is accessible. <br> 2. <code>views</code> field shows how many additional views are allowed for this snippet (excluding the current one).<br>
        </li>
        <li><code>GET /code/UUID</code> should contain the following elements:<br> 1.
            <code>&lt;span id="time_restriction"&gt; ... &lt;/span&gt;</code> in case the time restriction is applied.<br> 2. <code>&lt;span id="views_restriction"&gt; ... &lt;/span&gt;</code> in case the views restriction is applied.<br>
            <br> Note: if only one of the restrictions is applied, you should show only one of the above elements.<br> <a href="https://hyperskill.org/projects/130/stages/696/implement" target="_blank"><em>Source</em></a></li>
    </ul>

</div>


<script src="/js/jquery.slim.min.js"></script>
<script src="/js/bootstrap.bundle.min.js"></script>
</body>

</html>