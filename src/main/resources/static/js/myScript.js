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
        "time": document.getElementById("time_restriction").value
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
    } else {
        dangerMessage.style.display = "block";
        successMessage.style.display = "none";
        errorCode.innerHTML = xhr.status + " " + xhr.statusText;
        return;
    }
}