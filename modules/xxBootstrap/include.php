<?php
/**
 * @copyright 2012 Talldude Networks, LLC.
 */

// make sure we are not being called directly
defined('APP_DIR') or exit();

/**
 * xxBootstrap_meta
 */
function xxBootstrap_meta()
{
    $_tmp = array(
        'name'        => 'Bootstrap Tweaks',
        'url'         => 'bootstrap',
        'version'     => '1.0.0',
        'developer'   => 'The Jamroom Network, &copy;' . strftime('%Y'),
        'description' => 'tweaks to class names to make bootstrap CSS apply',
        'category'    => 'developer',
        'priority'    => 250
    );
    return $_tmp;
}

/**
 * xxBootstrap_init
 */
function xxBootstrap_init()
{
    // We're going to listen to the "save_media_file" event
    // so we can add image specific fields to the item
    jrCore_register_event_listener('jrCore', 'view_results', 'xxBootstrap_view_results_listener');
    jrCore_register_event_listener('jrCore', 'template_variables', 'xxBootstrap_template_variables_listener');
    jrCore_register_event_listener('jrCore', 'parsed_template', 'xxBootstrap_parsed_template_listener');
    return true;
}

//---------------------------------------------------------
// EVENT LISTENERS
//---------------------------------------------------------

//--------------------------------------------------
// view_results listener
// replace columns with bootstrap columns
//--------------------------------------------------
function xxBootstrap_view_results_listener($_data, $_user, $_conf, $_args, $event)
{
    global $_post;
    if ((!isset($_post['_uri']) || !strpos($_post['_uri'], '/admin/'))) {
        $_rep   = array(
            'col1'                                    => 'col-sm-1',
            'col2'                                    => 'col-sm-2',
            'col3'                                    => 'col-sm-3',
            'col4'                                    => 'col-sm-4',
            'col5'                                    => 'col-sm-5',
            'col6'                                    => 'col-sm-6',
            'col7'                                    => 'col-sm-7',
            'col8'                                    => 'col-sm-8',
            'col9'                                    => 'col-sm-9',
            'col10'                                   => 'col-sm-10',
            'col11'                                   => 'col-sm-11',
            'col12'                                   => 'col-sm-12',
            'id="widget-container" class="container"' => 'id="widget-container"',
        );
        $_after = strtr($_data, $_rep);
        return $_after;

    }
    return $_data;
}


//--------------------------------------------------
// template_variables listener
// catches any non-skin templates and flags them
//--------------------------------------------------
function xxBootstrap_template_variables_listener($_data, $_user, $_conf, $_args, $event)
{

    if (!isset($_args['jr_template_directory']) && $_args['jr_template_directory'] != "xxBootstrap") {
        jrCore_set_flag('xxBootstrap_replace', true);
    }
    return $_data;
}

//---------------------------------------------------------
// parsed_template listener
// replaces any clashing class names coming from modules
//---------------------------------------------------------
function xxBootstrap_parsed_template_listener($_data, $_user, $_conf, $_args, $event)
{

    $rep = jrCore_get_flag('xxBootstrap_replace');
    if ($rep) {
        $_rep = array(
            'class="container"' => 'class="jrcontainer"',
        );
        jrCore_delete_flag('xxBootstrap_replace');
        return strtr($_data, $_rep);
    }
    return $_data;
}
