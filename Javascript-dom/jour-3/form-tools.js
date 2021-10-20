function formToObject(formElement) {
            // Récupération de la saisie
            postedData = new FormData(formElement);
            // On peut accèder au valeurs saisies avec ma méthode get
            // console.log(postedData.get("age"));
            // console.log(postedData.get("firstName"));

            const data = {};
            for (info of postedData.entries()) {
                const key = info[0];
                const val = info[1];
                data[key] = val;
            }
            return data;
        }// fin de la fonction formToObject

        