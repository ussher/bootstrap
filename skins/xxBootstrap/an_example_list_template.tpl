{* //comment
This template is called from the index page via the {jrCore_list module="jrProfile" template="an_example_list_template.tpl"}
call.

{jrCore_list ...} docs can be found here: http://www.jamroom.net/the-jamroom-network/documentation/development/89/jrcore-list

It is the primary function for pulling info in from a datastore.

This template formats that information in any way you want.

To find out what variables are available to you, use the {debug} function. docs: https://www.jamroom.net/the-jamroom-network/documentation/development/1477/debug
*}

{if isset($_items)}
    <div class="page-header">
        <h1>Profiles</h1>
    </div>
    {foreach from=$_items item="item"}
        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><a href="{$jamroom_url}/{$item.profile_url}">{$item.profile_name}</a>
                    </div>
                    <div class="panel-body">
                        <a href="{$jamroom_url}/{$item.profile_url}">{jrCore_module_function function="jrImage_display" module="jrProfile" type="profile_image" item_id=$item._profile_id size="medium" crop="auto" class="img-thumbnail pull-right" alt=$item.profile_name title=$item.profile_name width=false height=false}</a>
                        {if !empty($item.profile_bio)}
                            <br>
                            {$item.profile_bio|jrCore_format_string:$item.profile_quota_id|truncate:900:"..."}
                         {else}
                            <p>This user has not yet added a biography to their profile</p>
                        {/if}
                    </div>
                </div>
            </div>
        </div>
    {/foreach}
{/if}
