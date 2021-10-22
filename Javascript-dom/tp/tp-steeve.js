const taskList = [];
const categories = ["formation", "loisirs", "maison", "santé"];

// création de la variable de type fonction qui va permettre le unchange sur les ckeckbox (bouton à cocher)
const changeCheckbox = function (element) {
    //recuperation de l id de la task
    var id= element.target.value;
    console.log(id)
    for (var task in taskList) {
        if (taskList[task].id == id) {
            //mise à jour tatus
            taskList[task].done = !taskList[task].done;
        }
    }
}

window.onload = function () {

    const categorieHtml = document.getElementById("category");
    const categorieSearch = document.getElementById("search-category");
    const statusSearch =document.getElementsByName("status");
    const taskInput = document.getElementById("taskName");
    const categoryInput = document.getElementById("category");
    const form = document.getElementById("form")
    // variable pour la recherche des tâches
    const searchForm = document.getElementById("searchForm")

    // liste déroulantes
    for (var index in categories) {
        var option = document.createElement("option");
        // récupération de la valeurs 
        option.value = categories[index];
        // ajout dans la liste
        option.textContent = categories[index];
        categorieHtml.appendChild(option);
    }

    for (var index in categories) {
        var option = document.createElement("option");
        option.value = categories[index];
        option.textContent = categories[index];

        categorieSearch.appendChild(option);
    }

    // constantes du clone pour cibler le tbody et ses tr
    const bloc = document.getElementById("taskRowTemplate");
    const tbody = document.querySelector("tbody")
    const btAdd = document.querySelector(".btn-primary")

    //evenement sur l'envoie du formulaire pour le filtre
    searchForm.onsubmit = function (element) {
        element.preventDefault();
        console.log("submit")
        //recuperation de la categorie a filter 
        var filtreCategory = categorieSearch.value;
        //recuperation de la valeur du choice box(status)
        for (var index in statusSearch) {
            if(statusSearch[index].checked){
                filterStatus = statusSearch[index].value;
            }
        }
        // creation de constante de type boolean en fonction du choice des statuts
        var filterState = false;
        var filterAll = false;
        if(statusSearch == "done"){
            filterState = true;
        }
        else if(statusSearch =="all"){
            filterAll = true;
        }
        else{
            filterState = false;
        }
        // tableau vide par default afin d 'avoir la liste des task filter  
        const filter = [];
        //suppresion des elements déjà present dnas le tableau
        tbody.innerHTML="";
        //boucle sur la liste des task afin de pouvoir filtrer
        for (var index in taskList) {
            //filtre sur la liste en bouclant sur les objets
            if (taskList[index].category === filtreCategory && (taskList[index].done == filterState || filterAll)) {
                //creation du dom pour le tableau
                const clone = bloc.cloneNode(true)
                clone.children[1].innerHTML = taskList[index].taskName;
                clone.children[2].innerHTML = taskList[index].category;
                // à chaque ajout j'ai affecté la valeur du timestamp(id)
                clone.children[0].children[0].value = taskList[index].id;
                //à chaque ajout j'ai ajouter l'evenement onchange sur le checkbox
                clone.children[0].children[0].onchange = changeCheckbox;
                 tbody.appendChild(clone)
            }
        }
    }

//événement sur l'envoie du formulaire de creation d'une task
    form.onsubmit = function (eventadd) {
        eventadd.preventDefault();
       
        const id = new Date().getTime();
        clone.removeAttribute("id");
        person = formToObject(eventadd.target, id);
    
        //modification du texte des enfants
        const taskInputValeur = taskInput.value;
        const categoryInputValeur = categoryInput.value;

        //creation du dom lors de l'ajout d'une task dans le dom
        const clone = bloc.cloneNode(true)
        clone.children[1].innerHTML = taskInputValeur;
        clone.children[2].innerHTML = categoryInputValeur;
        // à chaque ajout j'ai affecté la valeur du timestamp(id)
        clone.children[0].children[0].value = id;
        //affected function for onchange input checkbox
        clone.children[0].children[0].onchange = changeCheckbox;
        tbody.appendChild(clone)
    }

    function formToObject(formElement, id) {
        postedData = new FormData(formElement);
        const data = {};
        taskList.push(data);
        for (info of postedData.entries()) {
            const key = info[0];
            const val = info[1];
            data[key] = val;
            // ajout de l'id unique à chaque ajout de taches
            data["id"] = id;
            //ajout de l'etat par default à false
            data["done"] = false;
        }

        return data;
    }
    //suppression du bouton en fonction de l'id present sur le input de la ligne
    tbody.onclick = function (toDelete) {
        if (toDelete.target.classList.contains("btn-danger")) {
            var tr = toDelete.target.parentElement.parentElement;
            var id = tr.children[0].children[0].value;
            tr.remove();
            for (var task in taskList) {
                if (taskList[task].id == id) {
                    taskList.splice(task, 1);

                }

            }


        }
    }

}