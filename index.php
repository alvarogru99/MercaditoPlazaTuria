<?php
require 'vendor/autoload.php';
require 'cargarconfig.php';
session_start(); 
use NoahBuscher\Macaw\Macaw;
use controller\ProductoController;

//Main Menu
Macaw::get($URL_PATH . '/', "controller\ProductoController@listarProductos");
Macaw::get($URL_PATH . '/page/(:num)', "controller\ProductoController@listarProductos");

//Listado
Macaw::get($URL_PATH . '/productos', "controller\ProductoController@listadoProductos");
Macaw::get($URL_PATH . '/productos/page/(:num)', "controller\ProductoController@listadoProductos");

Macaw::get($URL_PATH . '/contacto', "controller\UserController@verContacto");

// ver producto
Macaw::get($URL_PATH . '/producto/(:num)', "controller\ProductoController@verProducto");

//ver cesta
Macaw::get($URL_PATH . '/api/cesta', "controller\ApiController@verCesta");
//Ver datos
Macaw::get($URL_PATH . '/api/descripcion/(:num)', "controller\ApiController@verDescripcion");

//compra
Macaw::get($URL_PATH . '/api/compra/(:num)', "controller\ApiController@compraProducto");

//incrementar
Macaw::get($URL_PATH . '/api/incrementar/(:num)', "controller\ApiController@incrementarProducto");
//decrementar
Macaw::get($URL_PATH . '/api/decrementar/(:num)', "controller\ApiController@decrementarProducto");

//Realizar compra
Macaw::get($URL_PATH . '/realizarCompra', "controller\ProductoController@realizarCompra");
//Procesar compra logeado (parte final)
Macaw::post($URL_PATH . '/realizarCompra', "controller\ProductoController@procesarCompra");

//login usuario
Macaw::get($URL_PATH . '/login', "controller\UserController@formularioLogin");
Macaw::post($URL_PATH . '/login', "controller\UserController@procesarLogin");
// registro
Macaw::get($URL_PATH . '/registro', "controller\UserController@formularioRegistro");
Macaw::post($URL_PATH . '/registro', "controller\UserController@procesarRegistro");
// logout
Macaw::get($URL_PATH . '/logout', "controller\UserController@hacerLogout");


//Eliminar Producto
Macaw::get($URL_PATH . '/eliminarProducto/(:num)', "controller\ProductoController@eliminarProducto");

//Eliminar Producto desde compra
Macaw::get($URL_PATH . '/eliminarProductoCompra/(:num)', "controller\ProductoController@eliminarProductoCompra");

//Eliminar datos 
Macaw::get($URL_PATH . '/eliminarDatos/(:num)', "controller\UserController@eliminarDatos");

//Vaciar cesta
Macaw::get($URL_PATH . '/vaciarCesta', "controller\ProductoController@vaciarCesta");

//pasarela informa
Macaw::get($URL_PATH . '/informa', "controller\ApiController@informa");

//pasarela retorno
Macaw::get($URL_PATH . '/retorno', "controller\UserController@retorno");


Macaw::error(function() {
  (new \controller\ErrorController) -> notFound();
});

try {
  Macaw::dispatch();
} catch (Exception $ex) {
  (new \controller\ErrorController) -> error500($ex);
}

