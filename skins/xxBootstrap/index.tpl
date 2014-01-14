{jrCore_include template="header.tpl"}

{jrCore_list module="jrBlog" order_by="_created numerical_desc" template="carousel_index.tpl" limit="12" require_image="blog_image"}

<!-- Main jumbotron for a primary marketing message or call to action -->
<div class="jumbotron">
    <h1>Hello, world!</h1>

    <p>This is a base skin built with Bootstrap 3.0.3.  Use it to build your own <a href="http://www.jamroom.net">Jamroom 5</a> skins.</p>

    <p><a href="{$jamroom_url}/example" class="btn btn-primary btn-lg" role="button">Examples elements here &raquo;</a></p>
</div>

{* list of profiles*}


    {jrCore_list module="jrProfile" template="an_example_list_template.tpl"}






{jrCore_include template="footer.tpl"}

