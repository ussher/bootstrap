{jrCore_module_url module="jrAction" assign="murl"}

{if jrProfile_is_profile_owner($_profile_id)}


    {if isset($_post.profile_actions) && $_post.profile_actions == 'mentions'}
        <nav class="navbar navbar-default" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                {if jrCore_module_is_active('jrFeed')}
                    {jrCore_module_url module="jrFeed" assign="furl"}
                    {jrCore_lang module="xxBootstrap" id="51" default="activity feed" assign="title"}
                    <a class="nav navbar-btn navbar-left" style="padding-left: 5px" href="{$jamroom_url}/{$furl}/{$murl}/{$profile_url}" title="{$title}">{jrCore_icon icon="rss"}</a>
                {/if}
                <span class="navbar-brand">{jrCore_lang module="jrAction" id="7" default="Mentions"}</span>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <form class="navbar-form navbar-right" role="search" name="action_search_form" action="{$jamroom_url}/{$profile_url}/{$murl}/search" method="get">
                    <div class="form-group">
                        {jrCore_lang skin=$_conf.jrCore_active_skin id="27" default="search activity stream" assign="svar"}
                        <input type="text" class="form-control" placeholder="{$svar}" name="ss">
                    </div>
                    <button type="submit" class="btn btn-default"><i class="glyphicon glyphicon-search bs-glyphicons"></i></button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="{$jamroom_url}/{$profile_url}/{$murl}/timeline">{jrCore_lang module="jrAction" id="4" default="Timeline"}</a></li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
    {else}
        <nav class="navbar navbar-default" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                {if jrCore_module_is_active('jrFeed')}
                    {jrCore_module_url module="jrFeed" assign="furl"}
                    {jrCore_lang module="xxBootstrap" id="51" default="activity feed" assign="title"}
                    <a class="nav navbar-btn navbar-left" style="padding-left: 5px" href="{$jamroom_url}/{$furl}/{$murl}/{$profile_url}" title="{$title}">{jrCore_icon icon="rss"}</a>
                {/if}
                <span class="navbar-brand">{jrCore_lang module="jrAction" id="4" default="Timeline"}</span>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <form class="navbar-form navbar-right" role="search" name="action_search_form" action="{$jamroom_url}/{$profile_url}/{$murl}/search" method="get">
                    <div class="form-group">
                        {jrCore_lang skin=$_conf.jrCore_active_skin id="27" default="search activity stream" assign="svar"}
                        <input type="text" class="form-control" placeholder="{$svar}" name="ss">
                    </div>
                    <button type="submit" class="btn btn-default"><i class="glyphicon glyphicon-search bs-glyphicons"></i></button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="{$jamroom_url}/{$profile_url}/{$murl}/mentions">{jrCore_lang module="jrAction" id="7" default="Mentions"}</a></li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
    {/if}

{* we only show the new action form to the profile owner *}
    {if jrUser_is_linked_to_profile($_profile_id)}
        <div class="panel panel-default" id="new_action">
            <div class="panel-heading">
                {jrCore_lang module="jrAction" id="3" default="Post a new Activity Update"}:
            </div>
            <div class="panel-body">
                {jrAction_form}
            </div>
        </div>
    {/if}
    <div id="timeline">
        {assign var="page_num" value="1"}
        {if isset($_post.p)}
            {assign var="page_num" value=$_post.p}
        {/if}

        {* See what we are loading - time line or mentions *}
        {if isset($_post.profile_actions) && $_post.profile_actions == 'mentions'}
            {jrCore_list module="jrAction" search1="_profile_id != `$_profile_id`" search2="action_text regexp @`$profile_url`[[:>:]]" order_by="_item_id numerical_desc" pagebreak="12" page=$page_num pager=true}
        {elseif isset($_post.profile_actions) && $_post.profile_actions == 'search'}
            {jrCore_list module="jrAction" search="_item_id in `$_post.match_ids`" order_by="_item_id numerical_desc" pagebreak="12" page=$page_num pager=true}
        {else}
        {* If we are the site owner, we include action updates for profiles we follow *}
            {if jrUser_is_linked_to_profile($_profile_id)}
                {jrCore_list module="jrAction" profile_id=$_profile_id include_followed=true order_by="_item_id numerical_desc" pagebreak="12" page=$page_num pager=true no_cache=true}
            {else}
                {jrCore_list module="jrAction" profile_id=$_profile_id order_by="_item_id numerical_desc" pagebreak="12" page=$page_num pager=true}
            {/if}
        {/if}
    </div>
{else}
    <nav class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
            {if jrCore_module_is_active('jrFeed')}
                {jrCore_module_url module="jrFeed" assign="furl"}
                {jrCore_lang module="xxBootstrap" id="51" default="activity feed" assign="title"}
                <a class="nav navbar-btn navbar-left" style="padding-left: 5px" href="{$jamroom_url}/{$furl}/{$murl}/{$profile_url}" title="{$title}">{jrCore_icon icon="rss"}</a>
            {/if}
            <span class="navbar-brand">{jrCore_lang module="jrAction" id="4" default="Timeline"}</span>
        </div>
    </nav>
    <div id="timeline">
        {if isset($_post.p)}
            {jrCore_list module="jrAction" profile_id=$_profile_id order_by="_item_id numerical_desc" pagebreak="12" page=$_post.p pager=true}
        {else}
            {jrCore_list module="jrAction" profile_id=$_profile_id order_by="_item_id numerical_desc" pagebreak="12" page="1" pager=true}
        {/if}
    </div>
{/if}