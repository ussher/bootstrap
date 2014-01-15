{if jrProfile_is_profile_owner($_profile_id)}


    {jrCore_module_url module="jrAction" assign="murl"}

    {if jrCore_module_is_active('jrFeed')}
        {jrCore_module_url module="jrFeed" assign="furl"}
        {jrCore_lang module="xxBootstrap" id="51" default="activity feed" assign="title"}
        <a href="{$jamroom_url}/{$furl}/{$murl}/{$profile_url}" title="{$title}">{jrCore_icon icon="rss" size="20"}</a>
        &nbsp;
    {/if}

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
                        <input type="text" class="form-control" placeholder="{$svar}">
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
                        <input type="text" class="form-control" placeholder="{$svar}">
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
    <div class="panel panel-default">
        <div class="panel-body">
            Panel content profile owner
        </div>
    </div>


{else}
    {*todo do this section *}
    <div class="block">

        <div class="title">
            <h2>{jrCore_lang module="jrAction" id="4" default="Profile Updates"}</h2>
            {if jrCore_module_is_active('jrFeed')}
                <div style="float:right">
                    {jrCore_module_url module="jrFeed" assign="furl"}
                    {jrCore_module_url module="jrAction" assign="murl"}
                    <a href="{$jamroom_url}/{$furl}/{$murl}/{$profile_url}">{jrCore_icon icon="rss" size="20"}</a>
                </div>
            {/if}
        </div>

        <div class="block_content">
            <div class="item">
                <div id="timeline">
                    {if isset($_post.p)}
                        {jrCore_list module="jrAction" profile_id=$_profile_id order_by="_item_id numerical_desc" pagebreak="12" page=$_post.p pager=true}
                    {else}
                        {jrCore_list module="jrAction" profile_id=$_profile_id order_by="_item_id numerical_desc" pagebreak="12" page="1" pager=true}
                    {/if}
                </div>
            </div>
        </div>

    </div>
{/if}