<?php
namespace controller;
use dawfony\Ti;

class ErrorController {

    function notFound() {
        http_response_code(404);
        echo Ti::render("view/error404.phtml");
    } 
    function error500($ex) {
        http_response_code(500);
        echo Ti::render("view/error500.phtml");
    }

}