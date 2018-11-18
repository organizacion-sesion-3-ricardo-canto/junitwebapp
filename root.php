<?php

// Modelo de objetos que se corresponde con la tabla de MySQL
class Articulo extends \Illuminate\Database\Eloquent\Model
{
	public $timestamps = false;
}

$app->get('/', function ($req, $res, $args)  {

    // Creamos un objeto collection + json con la lista de películas

    // Obtenemos la lista de los libros de la base de datos y la convertimos del formato Json (el devuelto por Eloquent) a un array PHP
    $articles = json_decode(\Article::all());

    // Mostramos la vista
    return $this->view->render($res, 'articulolist_template.php', [
        'items' => $articles
    ]);
})->setName('root');


/*  Obtención de un libro en concreto  */
$app->get('/articulos/{name}', function ($req, $res, $args) {

    // Creamos un objeto collection + json con el libro pasado como parámetro

    // Obtenemos el libro de la base de datos a partir de su id y la convertimos del formato Json (el devuelto por Eloquent) a un array PHP
    $p = \articulo::find($args['name']);
    $articulo = json_decode($p);

    // Mostramos la vista
    return $this->view->render($res, 'articulo_template.php', [
        'item' => $articulo
    ]);

});


/* Borrado de un libro en concreto */
$app->delete('/articulos/{name}', function ($req, $res, $args) {

    // Obtenemos el libro de la base de datos a partir de su id y lo borramos
    $p = \Articulo::find($args['name']);  
    $p->delete();

});

/* Añadido de un libro */

$app->post('/articulos', function ($req, $res, $args) {
    $template = $req->getParsedBody();

    $datos = $template['template']['data'];

    foreach ($datos as $item) { 
        switch ($item['name']) {
        case 'name':
            $name = $item['value'];
            break;

        case 'description':
            $description = $item['value'];
            break;

        case 'isbn':
            $isbn = $item['value'];
            break;

        case 'datePublished':
            $datePublished = $item['value'];
            break;

        case 'image':
            $image = $item['value'];
            break;
        }
    }

    $articulo = new Articulo;

    $articulo->name = $name;
    $articulo->description = $description;
    $articulo->isbn = $isbn;
    $articulo->datePublished = $datePublished;
    $articulo->image = $image;
    $articulo->save();
});

/* Actualizacion de un libro en concreto */
/*  Obtención de un libro en concreto  */
$app->put('/articulos/{name}', function ($req, $res, $args) {

    // Creamos un objeto collection + json con el libro pasado como parámetro

    // Obtenemos el libro de la base de datos a partir de su id y la convertimos del formato Json (el devuelto por Eloquent) a un array PHP
    $p = \articulo::find($args['name']);

    $template = $req->getParsedBody();

    $datos = $template['template']['data'];

    foreach ($datos as $item) { 
        switch ($item['name']) {
        case 'nombre':
            $nombre= $item['value'];
            break;

        case 'precio':
            $precio = $item['value'];
            break;

        case 'codigo':
            $codigo = $item['value'];
            break;

        case 'grupo':
            $grupo = $item['value'];
            break;

        }
    }

    $p->nombre = $nombre;
    $p->precio = $precio;
    $p->codigo = $codigo;
    $p->grupo = $grupo;
    $p->save();


});

?>
