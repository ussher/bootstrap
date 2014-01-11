{jrCore_include template="meta.tpl"}

<body>
<i>(header.tpl file)</i><br/>


{* NOTE: remember to put a link to the ACP somewhere so your admin can adminster.*}
{jrCore_module_url module="jrCore" assign="core_url"}
<i><a href="{$jamroom_url}/{$core_url}/admin/global">a link to admin panel</a></i>
