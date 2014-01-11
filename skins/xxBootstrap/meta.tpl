<!doctype html>
<html lang="{jrCore_lang module="_settings" id="lang" default="en"}" dir="{jrCore_lang module="_settings" id="direction" default="ltr"}">
<head>{jrCore_lang skin=$_conf.jrCore_active_skin id="1" assign="default_title"}
<title>{$page_title|default:"`$default_title`"|capitalize} | {$_conf.jrCore_system_name}</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
{if isset($meta)}
{foreach from=$meta key="mname" item="mvalue"}
<meta name="{$mname}" content="{$mvalue}" />
{/foreach}
{/if}
<link rel="stylesheet" href="{jrCore_css_src}" media="screen" />
{if isset($css_href)}
{foreach from=$css_href item="_css"}
<link rel="stylesheet" href="{$_css.source}" media="{$_css.media|default:"screen"}" />
{/foreach}
{/if}
{if isset($css_embed)}
<style type="text/css">
{$css_embed}</style>
{/if}
{if isset($javascript_embed)}
<script type="text/javascript">
{$javascript_embed}</script>
{/if}
<script type="text/javascript" src="{jrCore_javascript_src}"></script>
{if isset($javascript_href)}
{foreach from=$javascript_href item="_js"}
<script type="{$_js.type|default:"text/javascript"}" src="{$_js.source}"></script>
{/foreach}
{/if}
{if isset($javascript_ready_function)}
<script type="text/javascript">
$(document).ready(function(){ldelim}
{$javascript_ready_function}return true;
{rdelim});
</script>
{/if}

    <!-- Bootstrap core CSS -->
    <link href="{$jamroom_url}/skins/xxBootstrap/css/bootstrap.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="{$jamroom_url}/skins/xxBootstrap/css/bootstrap-theme.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="{$jamroom_url}/skins/xxBootstrap/css/carousel.css" rel="stylesheet">


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

</head>
