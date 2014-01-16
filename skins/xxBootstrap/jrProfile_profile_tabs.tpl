{* //comment
This is an example of a module template over-ride

Any modules templates can be over-ridden by the skin by this naming structure.
(module_name)_(template_name).tpl

So the original of this template was found at:
/modules/jrProfile/templates/profile_tabs.tpl

It was copied to:
/skins/xxBootstrap/jrProfile_profile_tabs.tpl

so that the data could be arranged in a structure that fits the bootstrap class syntax.

deleting the jrProfile_profile_tabs.tpl will make Jamroom fall back to the default template provided by the module.
*}

<ul class="nav nav-tabs nav-justified">
    {foreach $tabs as $tab}
        {if isset($tab.onclick)}
            {if isset($tab.active) && $tab.active == '1'}
                <li id="{$tab.id}" class="{$tab.class} active" onclick="{$tab.onclick}">{$tab.label}</li>
            {else}
                <li id="{$tab.id}" class="{$tab.class}" onclick="{$tab.onclick}">{$tab.label}</li>
            {/if}
        {else}
            {if isset($tab.active) && $tab.active == '1'}
                <li id="{$tab.id}" class="{$tab.class} active"><a href="{$tab.url}">{$tab.label}</a></li>
            {else}
                <li id="{$tab.id}" class="{$tab.class}"><a href="{$tab.url}">{$tab.label}</a></li>
            {/if}
        {/if}
    {/foreach}
</ul>
