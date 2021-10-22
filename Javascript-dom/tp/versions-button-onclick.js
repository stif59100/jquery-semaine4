window.onload = function () {

    // on cible le formulaire
    const form = document.getElementById("newTaskForm");         // <form>
    // on cible le template
    const template = document.querySelector("#taskRowTemplate"); // <tr>
    // Boutton ajouter une chose à faire
    const btAdd = document.querySelector("#newTaskForm button");      // <button>
    // on cible le tbody
    const tbody = document.querySelector("#taskTable tbody");    // <tbody>
    // on cibles les inputs
    const taskInput = document.getElementById("taskName");       // <input>  

    // on recupere le <select> du formulaire 1 
    const categorieHtml = document.getElementById("category");   // <select>
    // on recupere le <select> du formulaire 2
    const categorieSearch = document.getElementById("search-category");
    // Tableau des categorie a mettre dans les <select>
    const categories = ["santé", "maison", "loisirs", "formation"];

    // liste déroulantes
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

    // Tableau pour enregistrer les saisies de l'utilisateur
    const taskList = [
        //{ taskName: 'Faire du sport', category: 'santé', done: false, id: 1000 },
    ];

    // Ajout d'une ligne au click
    btAdd.onclick = function () {

        // on recupere les valeurs des champs du formulaire
        const taskInputVal = taskInput.value;           // valeur de <input>
        const categoryInputVal = categorieHtml.value;   // valeur du <select>
        const id = new Date().getTime();                // generer un id unique             

        // clone de la ligne
        const clone = template.cloneNode(true);  
              
        // suppression de l'id sur le clone
        clone.removeAttribute("id");

        // modification du texte des deux enfants (les td)
        /*clone.children[1].innerHTML = taskInputVal;
        clone.children[2].innerHTML = categoryInputVal;
        clone.children[2].setAttribute("id", id);*/

        // Ajout du clone au parent
        tbody.appendChild(clone);
    }

    // Suppression de la ligne sur to do list
    tbody.onclick = function (ev) {

        if (ev.target.classList.contains("delete")) {
            ev.target.parentElement.parentElement.remove();
            //ev.path[2].remove();
        }       
    }

    // cibler tous les inputs de type checkbox
    const buttonList = document.querySelectorAll("tbody tr td input");

    //boucles sur les checkbox pour ajouter evenement onchange
    for (bt of buttonList) {
        bt.onchange = function (ev) {
            console.log(ev);
        }
    }
}