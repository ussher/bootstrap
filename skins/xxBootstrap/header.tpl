{jrCore_include template="meta.tpl"}

<body>

<!-- Fixed navbar -->
<div class="navbar navbar-inverse" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="{$jamroom_url}">{$_conf.jrCore_system_name}</a>
        </div>
        <div class="navbar-collapse collapse">

            <nav id="header-fixed-nav">
                <ul class="nav navbar-nav">
                    <li {if $nav_active == 'index' || !isset($nav_active)}class="active"{/if}><a href="{$jamroom_url}">Home</a></li>
                    <li {if $nav_active == 'example'}class="active"{/if}><a href="{$jamroom_url}/example">example</a></li>
                    {if jrCore_module_is_active('jrSearch')}
                        <li><a data-toggle="modal" href="#searchModal" title="Site Search"><i class="glyphicon glyphicon-search"></i></a></li>
                    {/if}
                </ul>
                <ul class="nav navbar-nav pull-right">
                    {* Add in Cart link if jrFoxyCart module is installed *}
                    {if jrCore_module_is_active('jrFoxyCart') && strlen($_conf.jrFoxyCart_api_key) > 0}
                        <li>
                            <a href="{$_conf.jrFoxyCart_store_domain}/cart?cart=view">{jrCore_image image="cart24.png" width="24" height="24" alt="cart"}</a>
                            <span id="fc_minicart"><span id="fc_quantity"></span></span>
                        </li>
                    {/if}

                    {if jrUser_is_logged_in()}
                        {if jrUser_is_admin()}
                            <li><a href="{$jamroom_url}/{jrCore_module_url module="jrCore"}/dashboard">{jrCore_lang skin=$_conf.jrCore_active_skin id="17" default="dashboard"}</a></li>
                        {/if}
                        <li class="dropdown">
                            <a class="dropdown-toggle" id="admindd" role="button" data-toggle="dropdown" data-target="#"">{jrUser_home_profile_key key="profile_name"} <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="admindd">
                                <li><a href="{$jamroom_url}/{jrUser_home_profile_key key="profile_url"}">Home Profile</li>
                                {jrCore_skin_menu template="menu.tpl" category="user"}
                            </ul>
                        </li>
                    {/if}


                    {* Add additional menu categories here *}

                    {if jrUser_is_logged_in()}
                        {if jrUser_is_master()}
                            {jrCore_module_url module="jrCore" assign="core_url"}
                            {jrCore_get_module_index module="jrCore" assign="url"}
                            <li class="dropdown">
                                <a class="dropdown-toggle" id="acpdd" role="button" data-toggle="dropdown" data-target="#" href="{$jamroom_url}/{$core_url}/admin/global">{jrCore_lang skin=$_conf.jrCore_active_skin id="16" default="ACP"} <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="acpdd">
                                    <li role="presentation" class="dropdown-header"><a href="{$jamroom_url}/{$core_url}/admin/tools">{jrCore_lang skin=$_conf.jrCore_active_skin id="37" default="System Tools"}</a></li>
                                    <li><a href="{$jamroom_url}/{$core_url}/{$url}">{jrCore_lang skin=$_conf.jrCore_active_skin id="28" default="Activity Logs"}</a></li>
                                    <li><a href="{$jamroom_url}/{$core_url}/cache_reset">{jrCore_lang skin=$_conf.jrCore_active_skin id="29" default="Reset Cache"}</a></li>
                                    <li><a href="{$jamroom_url}/{jrCore_module_url module="jrImage"}/cache_reset">{jrCore_lang skin=$_conf.jrCore_active_skin id="30" default="Reset Image Cache"}</a></li>
                                    <li><a href="{$jamroom_url}/{$core_url}/integrity_check">{jrCore_lang skin=$_conf.jrCore_active_skin id="31" default="Integrity Check"}</a></li>
                                    <li><a href="{$jamroom_url}/{$core_url}/system_check">{jrCore_lang skin=$_conf.jrCore_active_skin id="35" default="System Check"}</a></li>
                                    <li><a href="{$jamroom_url}/{jrCore_module_url module="jrBanned"}/browse">{jrCore_lang skin=$_conf.jrCore_active_skin id="32" default="Banned Items"}</a></li>
                                    <li><a href="{$jamroom_url}/{$core_url}/skin_menu">{jrCore_lang skin=$_conf.jrCore_active_skin id="33" default="Skin Menu Editor"}</a></li>
                                    <li><a href="{$jamroom_url}/{jrCore_module_url module="jrSitemap"}/admin/tools">{jrCore_lang skin=$_conf.jrCore_active_skin id="34" default="Create Sitemap"}</a></li>

                                    <li class="dropdown-header">
                                        {jrCore_module_url module="jrProfile" assign="purl"}
                                        {jrCore_module_url module="jrUser" assign="uurl"}
                                        <a href="{$jamroom_url}/{$purl}/admin/tools">{jrCore_lang skin=$_conf.jrCore_active_skin id="54" default="Users"}</a></li>

                                    <li><a href="{$jamroom_url}/{$purl}/quota_browser">{jrCore_lang skin=$_conf.jrCore_active_skin id="49" default="Profile Quota Browser"}</a></li>
                                    <li><a href="{$jamroom_url}/{$purl}/browser">{jrCore_lang skin=$_conf.jrCore_active_skin id="52" default="Profile Browser"}</a></li>
                                    <li><a href="{$jamroom_url}/{$uurl}/browser">{jrCore_lang skin=$_conf.jrCore_active_skin id="50" default="User Accounts"}</a></li>
                                    <li><a href="{$jamroom_url}/{$uurl}/online">{jrCore_lang skin=$_conf.jrCore_active_skin id="53" default="Who's Online"}</a></li>

                                    <li class="dropdown-header"><a href="{$jamroom_url}/{$core_url}/skin_admin/info/skin={$_conf.jrCore_active_skin}">{jrCore_lang skin=$_conf.jrCore_active_skin id="38" default="Skin Settings"}</a></li>
                                </ul>
                            </li>
                        {/if}
                    {else}
                        {jrCore_module_url module="jrUser" assign="uurl"}
                        {if $_conf.jrCore_maintenance_mode != 'on' && $_conf.jrUser_signup_on == 'on'}
                            <li><a href="{$jamroom_url}/{$uurl}/signup">{jrCore_lang skin=$_conf.jrCore_active_skin id="2" default="create"}&nbsp;{jrCore_lang skin=$_conf.jrCore_active_skin id="3" default="account"}</a></li>
                        {/if}
                        <li><a href="{$jamroom_url}/{$uurl}/login">{jrCore_lang skin=$_conf.jrCore_active_skin id="6" default="login"}</a></li>
                    {/if}

                </ul>
            </nav>

        </div>
        <!--/.nav-collapse -->
    </div>
</div>
<div id="searchModal" class="modal">
    <!-- Modal -->
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">{$_conf.jrCore_system_name} Site Search</h4>
            </div>
            <div class="modal-body">
                {jrSearch_form class="form_text" value="Search Site"}
            </div>
            <div class="modal-footer">
                <a href="#" class="btn" data-dismiss="modal">Cancel</a>
                <a href="#" class="btn btn-primary">Search</a>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dalog -->
</div>
<!-- /.modal -->
