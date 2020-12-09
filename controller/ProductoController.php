<?php
namespace controller;
require_once ("funciones.php");
use \model\Orm;
use \dawfony\Ti;

class ProductoController extends Controller
{

    function listarProductos($pagina = 1) {
        global $config;
        global $URL_PATH;
        $orm = new Orm;
        $productos = $orm->obtenerProductosPagina($pagina);
        $cuenta = (new Orm)->contarProductos();
        $numpaginas = ceil ($cuenta / $config["productos_por_pagina"]);
        echo Ti::render("view/listado.phtml",compact("productos", "numpaginas", "pagina", "cuenta"));
    }
    function listadoProductos($pagina = 1) {
        global $config;
        global $URL_PATH;
        $orm = new Orm;
        $productos = $orm->obtenerProductos($pagina);
        $cuenta = (new Orm)->contarProductos();
        $numpaginas = ceil ($cuenta / $config["productos_por_listado"]);
        $ruta = "$URL_PATH/productos/page/";
        echo Ti::render("view/productos.phtml",compact("productos", "cuenta", "numpaginas", "pagina", "ruta"));
    }
    function verProducto($id) {
        $orm = new Orm;
        $producto = $orm ->obtenerProducto($id);
        echo Ti::render("view/producto.phtml", compact("producto"));
    }

    function realizarCompra(){

        $nombre = $_REQUEST["nombre"] ="";
        $password = $_REQUEST["password"] ="";

        $articulosCesta = (new Orm)->articulosEnCesta(session_id());
        $totalArticulos = (new Orm)->sumaTotalArticulos(session_id());
        $productos = (new Orm)->obternerProductos(); 
        $data = $articulosCesta->total;
        $sumaTotal =$totalArticulos->suma;
        echo Ti::render("view/pedido.phtml",compact("data","sumaTotal","productos","nombre","password"));
    }

    function eliminarProducto($id){
        global $URL_PATH;
        (new Orm)->eliminarUnProducto($id);
        header("Location: " . $URL_PATH);
    }

    function eliminarProductoCompra($id){
        global $URL_PATH;
        (new Orm)->eliminarUnProductoDeCompra($id);
        header("Location: " . $URL_PATH."/realizarCompra");
    }

    function vaciarCesta(){
        global $URL_PATH;
        (new Orm)->vaciarCesta();
        header("Location: " . $URL_PATH);
    }
    
 

}
