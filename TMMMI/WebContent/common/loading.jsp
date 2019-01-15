<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>DEMO1</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1"> 
        <link rel="stylesheet" href="/css/loading.css">
        
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="/javascript/loading.js"></script>
        <script>
            $(document).ready(function(){
                $(".fakeloader").fakeLoader({
                    timeToHide:3000,
                    bgColor:"#2ecc71",
                    spinner:"spinner2"
                });
            });
        </script>
    </head>
    <body>
    <!--[if lt IE 7]>
        <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->
        

        <section id="section-navigation">
            <div class="container text-center">
                <a href="http://joaopereirawd.github.io/fakeLoader.js"><button class="btn-default btn-goback">← Article & Download</button></a>
            </div>
            <div class="container text-center">
                <a href="demo1.html"><button class="btn-default btn-white btn-active">Spinner1</button></a>
                <a href="demo2.html"><button class="btn-default btn-white">Spinner2</button></a>
                <a href="demo3.html"><button class="btn-default btn-white">Spinner3</button></a>
                <a href="demo4.html"><button class="btn-default btn-white">Spinner4</button></a>
                <a href="demo5.html"><button class="btn-default btn-white">Spinner5</button></a>
                <a href="demo6.html"><button class="btn-default btn-white">Spinner6</button></a>
                <a href="demo7.html"><button class="btn-default btn-white">Spinner7</button></a>
                <a href="demo8.html"><button class="btn-default btn-white">Costum Image</button></a>
            </div>
        </section>
		<div class="fakeloader"></div>
        <div class="container text-center">
            <h1 style="margin-top:250px">DOM was loaded</h1>
        </div>
        
        

    </body>
</html>