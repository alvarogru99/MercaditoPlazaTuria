<?php

namespace controller;

require_once("funciones.php");

use \model\Orm;
use \model\Usuario;
use \dawfony\Ti;

class UserController extends Controller
{

    public function verContacto()
    {
        echo \dawfony\Ti::render("view/contacto.phtml");
    }
    public function formularioRegistro()
    {
        echo \dawfony\Ti::render("view/formRegister.phtml");
    }

    public function procesarRegistro()
    {

        $user = new Usuario();
        $user->login_usu = strtolower($_REQUEST["login_usu"]);
        $user->password = password_hash($_REQUEST["password"], PASSWORD_DEFAULT);
        $user->email = sanitizar($_REQUEST["email"]);
        $user->direccion = sanitizar($_REQUEST["direccion"]);
        (new Orm) -> crearUsuario($user);
        // generar la vista
        $msg = "Ok, <strong>$user->login_usu</strong>. Se ha procesado tu solicitud de registro."
            ." Ahora puedes hacer login";
        echo \dawfony\Ti::render("view/msg-success.phtml", compact("msg"));
    }
    public function formularioLogin()
    {
        echo Ti::render("view/formLogin.phtml");

    }

    public function procesarLogin()
    {

        $login_usu = strtolower(sanitizar($_REQUEST["login_usu"]));
        $password = $_REQUEST["password"];
        $user = (new Orm) -> obtenerUsuario($login_usu);
        if (!$user) {
            $msg = "Usuario No Registrado";
            echo \dawfony\Ti::render("view/formRegister.phtml", compact("msg"));
        }
        if (!password_verify($password, $user->password))  {
            $msg = "Contraseña incorrecta";
            echo \dawfony\Ti::render("view/formLogin.phtml", compact("msg", "login"));
        } else {
            //GUARDAR CREDENCIALES
            $_SESSION["login"] = $login_usu;
            global $URL_PATH;
            header("Location: $URL_PATH/"); // Mandar al cliente al inicio
        }
        $totalArticulos =(new Orm)->sumaTotalArticulos(session_id());
        $sumaTotal =$totalArticulos->suma;

            (new Orm)->insertarUsuario($user);
        
            $_SESSION['login'] = $user->login_usu;
            $cesta = (new Orm)->sacarProductosDeUnCliente(session_id());
            (new Orm)->guardarPedido($_SESSION['login']);
            $id_pedido = (new Orm)->idPedido($_SESSION['login']);

            //sacamos la id y la cantidad de la cesta uno a uno y lo vamos insertando en la tabla de producto que ha comprado el cliente.
            foreach($cesta as $sacarProductos){
             (new Orm)->guardarProductos($id_pedido["id"],$sacarProductos->id_producto,$sacarProductos->cantidad);
            }
            sleep(3);
            $cod_comercio = 2222;
            $cod_pedido = $id_pedido["id"];
            $concepto = "Mercadito Plaza Turia";
            header("Location: http://localhost/pasarela/index.php?cod_comercio=$cod_comercio&cod_pedido=$cod_pedido&importe=$sumaTotal&concepto=$concepto");
        
    }
    public function retorno(){

        $cod_pedido = $_REQUEST["cod_pedido"];
        $sacarDatosPedido =  (new Orm)->sacarDatosPedidoPasarela($cod_pedido);
        $data=0;
        echo Ti::render("view/retorno.phtml", compact( "sacarDatosPedido", "data","cod_pedido"));

     }
     public function eliminarDatos($cod_pedido){
        global $URL_PATH;
        (new Orm)->eliminarDatosUsuarioCompra($cod_pedido,$_SESSION["login"],session_id());
        header("Location: $URL_PATH/");
    }
    public function hacerLogout(){
        global $URL_PATH;
        session_destroy();
        header("Location: $URL_PATH/");
    }
}
