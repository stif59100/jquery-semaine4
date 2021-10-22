window.onload = function () {
    const taskList = [];
    const bloc = document.getElementById("taskRowTemplate");
    const tbody = document.querySelector("tbody");
    const btAdd = document.querySelector(".btn-primary");
    const taskInput = document.getElementById("taskName");
    const categoryInput = document.getElementById("category");
    const form = document.getElementById("form");

    //-----------------------------------------

    //fonction
    form.onsubmit = function (eventAdd) {
        eventAdd.preventDefault();
        const clone = bloc.cloneNode(true);
        clone.removeAttribute("id");
        person = formToObject(eventAdd.target);
        console.log(eventAdd);
        const taskInputVal = taskInput.value;
        const categoryInputVal = categoryInput.value;
        const id = new Date().getTime();
        clone.children[1].innerHTML = taskInputVal;
        clone.children[2].innerHTML = categoryInputVal;
        clone.children[2].setAttribute("id", id);
        tbody.appendChild(clone);
    };

    function formToObject(formElement) {
        postedData = new FormData(formElement);
        const data = {};
        taskList.push(data);
        console.log(taskList);
        console.log(data);

        for (info of postedData.entries()) {
            const key = info[0];
            const val = info[1];
            data[key] = val;
        }
        return data;

    }
    //--------------------------------------------

    //fonction suppprimer

    tbody.onclick = function (toDelete) {
        if (toDelete.target.classList.contains("btn-danger")) {
            toDelete.path[2].remove();
            console.log(toDelete);
        }
    };

    //-------------------------------------------

    //Fonction des listes déroulantes

    const categorieHtml = document.getElementById("category");
    const categorieSearch = document.getElementById("search-category");
    const categories = ["santé", "maison", "loisirs", "formation"];
    for (var index in categories) {
        var option = document.createElement("option");
        option.value = categories[index];
        option.textContent = categories[index];
        categorieHtml.appendChild(option);
    }

    for (var index in categories) {
        var option = document.createElement("option");
        option.value = categories[index];
        option.textContent = categories[index];
        categorieSearch.appendChild(option);

    }

    const newData = {};

};