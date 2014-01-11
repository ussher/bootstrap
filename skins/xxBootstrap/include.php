<?php

// We are never called directly
if (!defined('APP_DIR')) { exit; }

/**
 * xxBootstrap_meta
 */
function xxBootstrap_skin_meta()
{
    $_tmp = array(
        'name'        => 'xxBootstrap',
        'version'     => '1.0.0',
        'developer'   => 'The Jamroom Network, &copy;'. strftime('%Y'),
        'description' => 'a blank skin with bootstrap 3 CSS',
        'support'     => 'http://www.jamroom.net/'
    );
    return $_tmp;
}

/**
 * xxBootstrap_init
 * NOTE: unlike with a module, init() is NOT called on each page load, but is
 * called when the core needs to rebuild CSS or Javascript for the skin
 */
function xxBootstrap_skin_init()
{
    // Bring in all our CSS files
    jrCore_register_module_feature('jrCore','css','xxBootstrap','admin.css');
    jrCore_register_module_feature('jrCore','css','xxBootstrap','form.css');
    jrCore_register_module_feature('jrCore','css','xxBootstrap','profile.css');

    // Register our Javascript files with the core
    jrCore_register_module_feature('jrCore','javascript','xxBootstrap','bootstrap.min.js');
    jrCore_register_module_feature('jrCore','javascript','xxBootstrap','xxBootstrap.js');
    jrCore_register_module_feature('jrCore','javascript','xxBootstrap','holder.js');

    // Tell the core the size of our action buttons (width in pixels, up to 64)
    jrCore_register_module_feature('jrCore','icon_size','xxBootstrap',32);

    return true;
}
