{if isset($_items)}
        {foreach $_items as $module => $entry}
            {if $entry.active == '1'}
                <li class="active"><a href="{$entry.target}">{$entry.label}</a></li>
            {else}
                <li><a href="{$entry.target}">{$entry.label}</a></li>
            {/if}
        {/foreach}
{/if}
