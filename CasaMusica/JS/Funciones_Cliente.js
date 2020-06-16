function ValidarForm() {
    var return = true;

    if (document.getElementById("txtBoxCodigo") == "") {
        document.getElementById("lblCodigoRequerido").innerText = "Requerido para el Alta!";
    } else {
        document.getElementById("lblCodigoRequerido").innerText = "";
    }
}