let dangerMessage;
let errorCode;
let successMessage;
let obj;

window.onload = function() {
    let form = document.querySelector("form");

    function handleForm(event) {
        event.preventDefault();
    }
    form.addEventListener('submit', handleForm);

    dangerMessage = document.querySelector(".danger-message");
    errorCode = dangerMessage.querySelector("p");
    successMessage = document.querySelector(".success-message");
};



function send() {
    let object = {
        "code": document.getElementById("code_snippet").value,
        "views": document.getElementById("views_restriction").value,
        "time": document.getElementById("time_restriction").value,
        "password": document.getElementById("password_field").value
    };

    let json = JSON.stringify(object);
    let xhr = null;

    try {
        xhr = new XMLHttpRequest();
        xhr.open("POST", '/api/code/new', false)
        xhr.setRequestHeader('Content-type', 'application/json; charset=utf-8');
        xhr.send(json);
    } catch (error) {
        dangerMessage.style.display = "block";
        successMessage.style.display = "none";
        errorCode.innerHTML = error.message;
        return;
    }

    if (xhr.status == 200) {
        successMessage.style.display = "block";
        dangerMessage.style.display = "none";
        document.querySelector("form").reset();
        let uuid = document.querySelector("span#uuid");
        uuid.innerHTML = JSON.parse(xhr.responseText).id;
        let uuid_link = document.querySelector("a#uuid-link")
        const currentUrl = window.location.href;
        uuid_link.href = currentUrl + "code/" + JSON.parse(xhr.responseText).id
    } else {
        dangerMessage.style.display = "block";
        successMessage.style.display = "none";
        errorCode.innerHTML = xhr.status + " " + xhr.statusText;
        return;
    }
}

function check() {
    const codeId = location.pathname.substring(6);
    var object = {
        "password": document.getElementById("password_field").value,
        "id": codeId
    };
    let json = JSON.stringify(object);

    try {
        xhr = new XMLHttpRequest();
        xhr.open("POST", '/api/code/password', false)
        xhr.setRequestHeader('Content-type', 'application/json; charset=utf-8');
        xhr.send(json);

        var url = location.protocol + '//' + location.host + location.pathname + '?password=' + object.password;

        if (xhr.status == 200) {
            window.location.href = url;
        } else if (xhr.status == 400){
            dangerMessage.style.display = "block";
        } else {
            window.location.href = url;
        }
    } catch (error) {
        console.error(error.message);
    }
}
