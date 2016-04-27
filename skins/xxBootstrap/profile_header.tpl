{jrCore_include template="header.tpl"}

<div id="profile">

    <div class="container theme-showcase">

        <div class="fb-profile">
            <img align="left" class="fb-image-lg" src="{$jamroom_url}/profile/image/profile_banner/{$_profile_id}/xxxlarge/crop=850:200/_v={$profile_banner_time}">
            <img align="left" class="fb-image-profile thumbnail" src="{$jamroom_url}/profile/image/profile_image/{$_profile_id}/xxxlarge/crop=square/_v={$profile_image_time}" alt="Profile image example"/>
            <div class="fb-config-btns block_config" style="margin-top:0">
                {jrCore_module_function function="jrFollower_button" profile_id=$_profile_id title="Follow This Profile"}
                {jrCore_item_update_button module="jrProfile" view="settings/profile_id=`$_profile_id`" profile_id=$_profile_id item_id=$_profile_id title="Update Profile"}
                {if jrUser_is_admin()}
                    {jrCore_item_create_button module="jrProfile" view="create" profile_id=$_profile_id title="Create new Profile"}
                {/if}
                {if jrUser_is_master()}
                    {jrCore_item_delete_button module="jrProfile" view="delete_save" profile_id=$_profile_id item_id=$_profile_id title="Delete this Profile" prompt="Are you sure you want to delete this profile?"}
                {/if}
            </div>
            <div class="fb-profile-text clear">
                <h1>{$profile_name}</h1>
                {if strlen($profile_bio) > 0}
                    <p>{$profile_bio|jrCore_format_string:$profile_quota_id}</p>
                {/if}
            </div>
        </div>


        <div class="row" style="clear: left;">
            <div class="col-sm-3">

                {jrProfile_menu template="profile_menu.tpl" profile_quota_id=$profile_quota_id profile_url=$profile_url}

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Online Status</h3>
                    </div>

                    {jrUser_online_status profile_id=$_profile_id}

                </div>

                {jrCore_list module="jrFollower" search1="follow_profile_id = `$_profile_id`" search2="follow_active = 1" order_by="_created desc" limit="14" assign="followers"}
                {if strlen($followers) > 0}
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">{jrCore_lang skin=$_conf.jrCore_active_skin id="43" default="Latest Followers"}:</h3>
                        </div>
                        <div class="panel-body">
                            {$followers}
                        </div>
                    </div>
                {/if}


                {jrCore_list module="jrRating" search1="_profile_id = `$_profile_id`" search2="rating_image_size = 1" order_by="_updated desc" limit="14" assign="rated"}
                {if strlen($rated) > 0}
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">{jrCore_lang skin=$_conf.jrCore_active_skin id="46" default="Recently Rated"}:</h3>
                        </div>
                        <div class="panel-body">
                            {$rated}
                        </div>
                    </div>
                {/if}

                {jrTags_cloud profile_id=$_profile_id height="350" assign="tag_cloud"}
                {if strlen($tag_cloud) > 0}
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">{jrCore_lang module="jrTags" id="1" default="Profile Tag Cloud"}:</h3>
                        </div>
                        <div class="panel-body">
                            {$tag_cloud}
                        </div>
                    </div>
                {/if}



                {jrTags_cloud profile_id=$_profile_id height="350" assign="tag_cloud"}
                {if strlen($tag_cloud) > 0}
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">{jrCore_lang skin=$_conf.jrCore_active_skin id="45" default="Profile Stats"}:</h3>
                        </div>

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

                        <div class="panel-body">
                            {jrProfile_stats profile_id=$_profile_id template=$stats_tpl}
                        </div>
                    </div>
                {/if}

            </div>

            <div class="col-sm-9">