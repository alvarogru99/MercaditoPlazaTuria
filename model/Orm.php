<?php

namespace model;

use dawfony\Klasto;

class Orm
{
    /* public function obtenerProducto($id)
    {
        $productos = Klasto::getInstance()->queryOne(
            "SELECT `id`, `nombre`, `descripcion`, `precio`, `img`, `youtube`  FROM `producto` where id = ?",
            [$id],
            "model\Producto"
        );
        return $productos;
    } */
    public function crearUsuario($user)
    {
        Klasto::getInstance()->execute(
            "INSERT INTO usuario(login_usu, password, direccion, email) "
                . "VALUES (?, ?, ?, ?)",
            [$user->login_usu, $user->password, $user->direccion, $user->email]
        );
    }
    
    public function obtenerUsuario($login_usu)
    {
        return Klasto::getInstance()->queryOne(
            "SELECT login_usu, password, direccion, email from usuario WHERE login = ? ",
            [$login_usu],
            "model\Usuario"
        );
    }
//listado Principal
    public function obtenerProductosPagina($pagina = 1)
    {
        global $config;
        $limite = $config["productos_por_pagina"];
        $offset = ($pagina - 1) * $limite;
        $bd = Klasto::getInstance();
        $sql = "SELECT `id`, `nombre`, `descripcion`, `img`, `precio`, `youtube` FROM `producto` LIMIT $limite OFFSET $offset";
        $productos = $bd->query($sql, [], "model\Producto");
        return $productos;
    } 
    public function obtenerProductos($pagina = 1)
    {
        global $config;
        $limite = $config["productos_por_listado"];
        $offset = ($pagina - 1) * $limite;
        $bd = Klasto::getInstance();
        $sql = "SELECT `id`, `nombre`, `descripcion`, `img`, `precio`, `youtube` FROM `producto` LIMIT $limite OFFSET $offset";
        $productos = $bd->query($sql, [], "model\Producto");
        return $productos;
    } 

    //contar los productos
    public function contarProductos()
    {
        return Klasto::getInstance()->queryOne("SELECT count(*) as cuenta FROM `producto`")["cuenta"];
    }
    

    //obtengo el producto que se va a reproducir en el modal.
    public function obtenerProducto($id)
    {
        $producto = Klasto::getInstance()->queryOne(
            "SELECT `nombre`, `precio`, `img` FROM `producto` where id = ?",
            [$id],
            "model\Producto"
        );
        return $producto;
    }
    public function obtenerDescripcion($id)
    {
        $producto = Klasto::getInstance()->queryOne(
            "SELECT 'nombre, `descripcion` FROM `producto` where id = ?",
            [$id],
            "model\Producto"
        );
        return $producto;
    }

    
    //comprar si existe el producto y si ya existe hacemos un update
    public function existeProductoCesta($id,$visitante){
        return Klasto::getInstance()->execute(
         "UPDATE `cesta` SET `cantidad` = `cantidad` + 1 WHERE id_visitante=? and id_producto=?",
         [$visitante,$id]
        );
    }

    //se añade producto a la cesta de la BD
    public function productoComprado($id, $idVisitante){
        return Klasto::getInstance()->execute(
            "INSERT INTO `cesta`(`id_visitante`, `id_producto`, `cantidad`) VALUES (?,?,1)",
            [$idVisitante,$id]
        );
    }
    //sacar la cantidad de productos que hay en la cesta cn el mismo ID y mostrarlo tambien cada vez que amos a comprar, por si compramos dos veces el mismo articulo
    public function cantidadProductoComprado($id){
        return Klasto::getInstance()->queryOne(
            "SELECT cantidad as cantidad FROM `cesta` WHERE id_producto = ?",
            [$id],"model\Cesta"
        );
    }


    //lo dejo comentado, es la cesta cuando le hacemos click.
     public function obternerProductos(){
        return Klasto::getInstance()->query(
            "SELECT producto.id as clave, producto.nombre, producto.descripcion, producto.precio, producto.img,cesta.cantidad as cantidad from producto, cesta where producto.id=cesta.id_producto  GROUP by producto.id ",
            [],"model\Producto"
        );
    } 
    //Articulos totales en cesta
    public function articulosEnCesta($cookie){
        return Klasto::getInstance()->queryOne(
            "SELECT count(*) as total FROM `cesta` WHERE id_visitante=?",
            [$cookie],"model\Cesta"
        );
    }

    //Suma Total Precio
    public function sumaTotalArticulos($cookie){
        return Klasto::getInstance()->queryOne(
            "SELECT round(sum(producto.precio * cesta.cantidad),2) as suma FROM `cesta`,`producto` WHERE producto.id=cesta.id_producto and cesta.id_visitante=? ",
            [$cookie], "model\Cesta"
        );
    }

    //incrementar producto en pagina principal
    public function incrementProductos($id, $visitante){

        return Klasto::getInstance()->execute(
            "UPDATE `cesta` SET `cantidad` = `cantidad` WHERE id_visitante=? and id_producto=?",
            [$visitante,$id]
        );

    }
    //incrementar producto en pagina realizar Compra inputs
    public function incrementProductosPorInput($id, $visitante){

        return Klasto::getInstance()->execute(
            "UPDATE `cesta` SET `cantidad` = `cantidad` + 1 WHERE id_visitante=? and id_producto=?",
            [$visitante,$id]
        );

    }
    

    //decrementar producto
    public function decrementProductos($id, $visitante){
        
        return Klasto::getInstance()->execute(
            "UPDATE `cesta` SET `cantidad`= `cantidad` - 1 WHERE id_visitante=? and id_producto=?",
            [$visitante,$id]
        );

    }
    //actualizamos las cantidades y comprobamos en javascript
    public function actualizarCantidad($id,$visitante){
        return Klasto::getInstance()->queryOne(
            "SELECT `cantidad` as cantidad FROM `cesta` Where id_visitante=? and id_producto=?",
            [$visitante,$id]
        );
    }

    //igualamos a un producto en la base de datos si el cliente a pulsado muy rapido el decrementar y ha quedado a < 0 en la BD
    public function igualarAUnproducto($id,$visitante){
        return Klasto::getInstance()->execute(
            "UPDATE `cesta` SET `cantidad` =  1 WHERE id_visitante=? and id_producto=?",
            [$visitante,$id]
        );
    }

    //el precio Total actualizado en realizar compra
    public function precioTotalActualizado($visitante){

        return Klasto::getInstance()->execute(
    "SELECT Round(sum(producto.precio), 2) * cesta.cantidad as suma FROM cesta, producto WHERE cesta.id_visitante =? and cesta.id_producto = producto.id ORDER BY cesta.id_producto ",
            [$visitante], "model\Cesta"
        );
    }

    //eliminar Un producto de la cesta
    public function eliminarUnProducto($id){
        return Klasto::getInstance()->execute(
            "DELETE FROM `cesta` Where id_producto=?",
            [$id]
        );
    }
    //eliminar Un producto de la compra
    public function eliminarUnProductoDeCompra($id){
        return Klasto::getInstance()->execute(
            "DELETE FROM `cesta` Where id_producto=?",
            [$id]
        );
    }

    //vaiciar Cesta
    public function vaciarCesta(){
        return Klasto::getInstance()->execute(
            "DELETE FROM `cesta`",
            []
        );
    }

    //insertamos un Usuario si todo está correctamente
    public function insertarUsuario($usuario)
    {
        $bd = Klasto::getInstance();
        $sql = "INSERT INTO `usuario`(`login_usu`, `email`, `password`, `direccion`) VALUES (?,?,?,?);";
        return $bd->execute($sql, [$usuario->login_usu,$usuario->email,$usuario->password,$usuario->direccion]);
    }

    //sacamos informacion de la cesta de un cliente para guardarlos posteriormente en su pedido
    public function sacarProductosDeUnCliente($cookie){
        return Klasto::getInstance()->query(
            "SELECT * FROM `cesta` Where id_visitante=?",
            [$cookie], "\model\Cesta"
        );
    }

    //guardamos Productos de la cesta para realizar la compra en pedido
    public function guardarPedido($usuario){
        return Klasto::getInstance()->execute(
            "INSERT INTO `pedido`( `Usuario_login_usu`) VALUES (?)",
            [$usuario]
        );
    }

    //sacamos la id del pedido 
    public function idPedido($id_usuario){
        return Klasto::getInstance()->queryOne(
            "SELECT id FROM `pedido` WHERE Usuario_login_usu=?",
            [$id_usuario]
        );
    }

    //guardamos los productos de un cliente en el pedido que ha comprado
    public function guardarProductos($id_pedido,$id_producto,$cantidad){
        return Klasto::getInstance()->execute(
            "INSERT INTO `producto_pedido`(`Producto_id`, `Pedido_id`, `cantidad`) VALUES (?,?,?)",
            [$id_producto,$id_pedido,$cantidad]
        );
    }

    //informacion de la pasarela de si a pagado a cancelado o ha surgido error
    public function informacionPasarela($estado,$cod_pedido,$cod_operacion,$importe){
        return Klasto::getInstance()->execute(
            "UPDATE `pedido` SET `id`=?,`pago`=?,`cod_operacion`=?,`importe`=?",
            [$cod_pedido,$estado,$cod_operacion,$importe]
        );
    }

    //sacar datos del cod_pedido 
    public function sacarDatosPedidoPasarela($cod_pedido){
        return Klasto::getInstance()->queryOne(
            "SELECT pago, cod_operacion, importe FROM pedido where id=?",
            [$cod_pedido], "model\Pedido"
        );
    }
    //eliminar datos del usuario de su compra
    public function eliminarDatosUsuarioCompra($idPedido,$login,$cookie){

        Klasto::getInstance()->startTransaction();

        (new Orm)->borrarProductoHasComprado($idPedido);
        (new Orm)->borrarPedido($idPedido);
        (new Orm)->borrarUsuario($login);
        (new Orm)->borrarCesta($cookie);
        
        Klasto::getInstance()->commit();
    }
    
    public function borrarProductoHasComprado($idPedido){
        return Klasto::getInstance()->execute(
            "DELETE FROM `producto_pedido` WHERE Pedido_id=?",
            [$idPedido]
        );
    }
    public function borrarPedido($idPedido){
        return Klasto::getInstance()->execute(
            "DELETE FROM `pedido` WHERE id=?",
            [$idPedido]
        );
    }
    public function borrarUsuario($login){
        return Klasto::getInstance()->execute(
            "DELETE FROM `usuario` WHERE login_usu=?",
            [$login]
        );
    }
    public function borrarCesta($cookie){
        return Klasto::getInstance()->execute(
            "DELETE FROM `cesta` WHERE id_visitante=?",
            [$cookie]
        );
    }
}
