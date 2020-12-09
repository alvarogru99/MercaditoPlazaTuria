function datosProducto(id) {

    fetch(URL_PATH + "/api/descripcion/" + id)
        .then((res) => res.json())
        .then((res) => {
            var nombre = document.getElementById("nombre");
            var descripcion = document.getElementById("descripcion");

            nombre.innerHTML = res.nombre;
            descripcion.innerHTML = res.descripcion;
        })
}