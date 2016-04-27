{if isset($_items)}
    <div class="list-group">
        {foreach $_items as $module => $entry}
            {if $entry.active == '1'}
                <a href="{$entry.target}" class="list-group-item active">{$entry.label}</a>
            {else}
                <a href="{$entry.target}" class="list-group-item">{$entry.label}</a>
            {/if}
        {/foreach}
    </div>
{/if}