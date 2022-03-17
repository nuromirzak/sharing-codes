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
    <form action="" onsubmit="send()">
        <div class="form-group">
            <label for="code_snippet"><h1>Share your code here!</h1></label>
            <div class="alert alert-success success-message" role="alert" style="display: none;">
                <h4 class="alert-heading">Well done!</h4>
                <p>Your UUID code is <span id="uuid">a947b880-3848-4e69-9255-4d8c6c2b8354</span>. Don't lose it, it's very important!</p>
            </div>
            <div class="alert alert-danger danger-message" role="alert" style="display: none;">
                <h4 class="alert-heading">Oops!...</h4>
                <p></p>
                <p>Please check that you have entered the correct data. The views and times field can only accept integers. For more information, click <a href="/code/usage">here.</a></p>
            </div>
            <textarea class="form-control my-3" id="code_snippet" placeholder="// Enter here..." required></textarea>
            <div class="row">
                <div class="col">
                    <label for="views_restriction">A limit on the number of views</label>
                    <input type="text" class="form-control" id="views_restriction" placeholder="Enter a limit on the number of views" value="0">
                    <small class="form-text text-muted">This will allow viewing the snippet only a certain number of times, after which the snippet is deleted from the database.</small>
                </div>
                <div class="col">
                    <label for="time_restriction">A limit on the viewing time</label>
                    <input type="text" class="form-control" id="time_restriction" placeholder="Enter a limit on the viewing time" value="0">
                    <small class="form-text text-muted">This will allow viewing a code snippet for a certain period of time, and after its expiration, the code snippet is deleted from the database.</small>
                </div>
            </div>
            <button id="send_snippet" type="submit" class="btn btn-primary">Submit</button>
        </div>
    </form>
</div>


<script src="/js/jquery.slim.min.js"></script>
<script src="/js/bootstrap.bundle.min.js"></script>
</body>

</html>