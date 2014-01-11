{jrCore_include template="meta.tpl"}
<body>

<div id="profile">

<div class="container theme-showcase">
    <!-- Fixed navbar -->
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Bootstrap theme</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="#contact">Contact</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li class="divider"></li>
                            <li class="dropdown-header">Nav header</li>
                            <li><a href="#">Separated link</a></li>
                            <li><a href="#">One more separated link</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron" style="background: url('http://jr5a.iixxii.cc/profile/image/profile_image/1/xxxlarge/_v=1389434576') no-repeat top center;background-size: 100%">
        <div class="block_config" style="margin-top:0">
            {jrCore_module_function function="jrFollower_button" profile_id=$_profile_id title="Follow This Profile"}
            {jrCore_item_update_button module="jrProfile" view="settings/profile_id=`$_profile_id`" profile_id=$_profile_id item_id=$_profile_id title="Update Profile"}
            {if jrUser_is_admin()}
                {jrCore_item_create_button module="jrProfile" view="create" profile_id=$_profile_id title="Create new Profile"}
            {/if}
            {if jrUser_is_master()}
                {jrCore_item_delete_button module="jrProfile" view="delete_save" profile_id=$_profile_id item_id=$_profile_id title="Delete this Profile" prompt="Are you sure you want to delete this profile?"}
            {/if}
        </div>

        <h1>{$profile_name}</h1>
    </div>

    <div class="navbar navbar-default">
        <ul class="nav navbar-nav">
            <li><a href="{$jamroom_url}/{$profile_url}" class="navbar-brand">{$profile_name}</a></li>
            {jrProfile_menu template="profile_menu.tpl" profile_quota_id=$profile_quota_id profile_url=$profile_url}
        </ul>
    </div>

    this is an icon: <i class="glyphicon glyphicon-arrow-up"></i>

    <div class="row">
        <div class="col-sm-4">

            <div class="block">
                {if jrProfile_is_profile_owner($_profile_id)}
                    {jrCore_module_url module="jrProfile" assign="purl"}
                    <div class="profile_image">
                        {jrCore_lang skin=$_conf.jrCore_active_skin id="25" default="Change Image" assign="hover"}
                        <a href="{$_conf.jrCore_base_url}/{$purl}/settings/profile_id={$_profile_id}">{jrCore_module_function function="jrImage_display" module="jrProfile" type="profile_image" item_id=$_profile_id size="xlarge" class="img_scale img_shadow" alt=$profile_name title=$hover width=false height=false}</a>

                        <div class="profile_hoverimage">
                            <span class="normal" style="font-weight:bold;color:#FFF;">{$hover}</span>&nbsp;{jrCore_item_update_button module="jrProfile" view="settings/profile_id=`$_profile_id`" profile_id=$_profile_id item_id=$_profile_id title="Update Profile"}
                        </div>
                    </div>
                {else}
                    {jrCore_module_function function="jrImage_display" module="jrProfile" type="profile_image" item_id=$_profile_id size="xxlarge" class="img_scale img_shadow" alt=$profile_name width=false height=false}
                {/if}
            </div>

            <div class="block">
                <div class="block_content mt10">
                    <div style="padding-top:8px;min-height:48px;max-height:288px;overflow:auto;">
                        {jrUser_online_status profile_id=$_profile_id}
                    </div>
                </div>
            </div>


            {if strlen($profile_bio) > 0}
                <div class="block">
                    <h3>{jrCore_lang skin=$_conf.jrCore_active_skin id="44" default="About"} {$profile_name}</h3>

                    <div class="block_content mt10">
                        <div style="padding-top:8px;max-height:350px;overflow:auto;">
                            {$profile_bio|jrCore_format_string:$profile_quota_id}
                        </div>
                    </div>
                </div>
            {/if}


            {if isset($profile_influences) && strlen($profile_influences) > 0}
                <div class="block">
                    <h3>{jrCore_lang skin=$_conf.jrCore_active_skin id="47" default="Influences"}</h3>

                    <div class="block_content mt10">
                        <div style="padding-top:8px;">
                            <span class="highlight-txt bold">{$profile_influences}</span><br>
                        </div>
                    </div>
                </div>
            {/if}


            {jrCore_list module="jrFollower" search1="follow_profile_id = `$_profile_id`" search2="follow_active = 1" order_by="_created desc" limit="14" assign="followers"}
            {if strlen($followers) > 0}
                <div class="block">
                    <h3>{jrCore_lang skin=$_conf.jrCore_active_skin id="43" default="Latest Followers"}:</h3>

                    <div class="block_content mt10">
                        <div style="padding-top:8px">
                            {$followers}
                        </div>
                    </div>
                </div>
            {/if}


            {jrCore_list module="jrRating" search1="_profile_id = `$_profile_id`" search2="rating_image_size = 1" order_by="_updated desc" limit="14" assign="rated"}
            {if strlen($rated) > 0}
                <div class="block">
                    <h3>{jrCore_lang skin=$_conf.jrCore_active_skin id="46" default="Recently Rated"}:</h3>

                    <div class="block_content mt10">
                        <div style="padding-top:8px">
                            {$rated}
                        </div>
                    </div>
                </div>
            {/if}

            <div>
                <h3>{jrCore_lang module="jrTags" id="1" default="Profile Tag Cloud"}:</h3>

                <div>
                    {$tag_cloud}
                </div>
            </div>


            {jrTags_cloud profile_id=$_profile_id height="350" assign="tag_cloud"}
            {if strlen($tag_cloud) > 0}
                <div class="">
                    <h3>{jrCore_lang skin=$_conf.jrCore_active_skin id="45" default="Profile Stats"}:</h3>
                    {capture name="template" assign="stats_tpl"}
                        {literal}
                            {foreach $_stats as $title => $_stat}
                            {jrCore_module_url module=$_stat.module assign="murl"}
                            <div class="stat_entry_box">
                                <a href="{$jamroom_url}/{$profile_url}/{$murl}"><span class="stat_entry_title">{$title}:</span> <span class="stat_entry_count">{$_stat.count|default:0}</span></a>
                            </div>
                            {/foreach}
                        {/literal}
                    {/capture}
                    <div class="">
                        {jrProfile_stats profile_id=$_profile_id template=$stats_tpl}
                    </div>
                </div>
            {/if}

        </div>

        <div class="col-sm-8">