function ValidarFormProductoEdit() {
    var codigo = $("#txtBoxCodigo").value
    var nombre = $("#txtBoxNombre").value
    var descripcion = $("#txtBoxDescripcion").value
    var imagenURL = $("#txtBoxImagen").value
    var precio = $("#txtBoxPrecio").value
    var stock = $("#txtBoxStock").value
    var marca = $("#dropDownMarcas").value
    var categoria = $("#dropDownCategorias").value
    var result = true;

    if (codigo === "") {
        $("#txtBoxCodigo").removeClass("is-valid");
        $("#txtBoxCodigo").addClass("is-invalid");
        result = false;
    } else {
        $("#txtBoxCodigo").removeClass("is-invalid");
        $("#txtBoxCodigo").addClass("is-valid");
    }

    if (nombre === "") {
        $("#txtBoxNombre").removeClass("is-valid");
        $("#txtBoxNombre").addClass("is-invalid");
        result = false;
    } else {
        $("#txtBoxNombre").removeClass("is-invalid");
        $("#txtBoxNombre").addClass("is-valid");
    }

    if (descripcion === "") {
        $("#txtBoxDescripcion").removeClass("is-valid");
        $("#txtBoxDescripcion").addClass("is-invalid");
        result = false;
    } else {      
        $("#txtBoxDescripcion").removeClass("is-invalid");
        $("#txtBoxDescripcion").addClass("is-valid");
    }

    if (imagenURL === "") {
        $("#txtBoxImagen").removeClass("is-valid");
        $("#txtBoxImagen").addClass("is-invalid");
        result = false;
    } else {      
        $("#txtBoxImagen").removeClass("is-invalid");
        $("#txtBoxImagen").addClass("is-valid");
    }

    if (precio === "") {
        $("#txtBoxPrecio").removeClass("is-valid");
        $("#txtBoxPrecio").addClass("is-invalid");
        result = false;
    } else {      
        $("#txtBoxPrecio").removeClass("is-invalid");
        $("#txtBoxPrecio").addClass("is-valid");
    }

    if (stock === "") {
        $("#txtBoxStock").removeClass("is-valid");
        $("#txtBoxStock").addClass("is-invalid");
        result = false;
    } else {      
        $("#txtBoxStock").removeClass("is-invalid");
        $("#txtBoxStock").addClass("is-valid");
    }

    if (marca === 0) {
        $("#txtBoxMarca").removeClass("is-valid");
        $("#txtBoxMarca").addClass("is-invalid");
        result = false;
    } else {      
        $("#txtBoxMarca").removeClass("is-invalid");
        $("#txtBoxMarca").addClass("is-valid");
    }

    if (categoria === 0) {
        $("#txtBoxCategoria").removeClass("is-valid");
        $("#txtBoxCategoria").addClass("is-invalid");
        result = false;
    } else {      
        $("#txtBoxCategoria").removeClass("is-invalid");
        $("#txtBoxCategoria").addClass("is-valid");
    }

    return result;
}