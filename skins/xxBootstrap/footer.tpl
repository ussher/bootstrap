
		<div class="bottom-block">
			<div class="row">
				<div class="col-md-6">
					<div id="footer_logo">
						{jrCore_image image="logo.png" width="150" height="38" alt="Elastic Skin &copy; 2012 The Jamroom Network" title="Elastic Skin &copy; 2012 The Jamroom Network"}
					</div>
				</div>
				<div class="col-md-6">
					<div id="footer_text">
						&copy;{$smarty.now|date_format:"%Y"} <a href="{$jamroom_url}">{$_conf.jrCore_system_name}</a><br>
						<span style="font-size:9px;color:#CCC;">Powered by</span> <a href="http://www.jamroom.net"><span style="font-size:9px;">Jamroom</span></a>
					</div>
				</div>
			</div>
		</div>

    </div> <!-- /container -->
    
{* THIS STUFF IS SO MODULES CAN INJECT THE STUFF THEY NEED INTO THE FOOTER, LEAVE IT HERE IF YOU WANT MODULES TO WORK.*}

{if isset($css_footer_href)}
    {foreach from=$css_footer_href item="_css"}
        <link rel="stylesheet" href="{$_css.source}" media="{$_css.media|default:"screen"}"/>
    {/foreach}
{/if}
{if isset($javascript_footer_href)}
    {foreach from=$javascript_footer_href item="_js"}
        <script type="{$_js.type|default:"text/javascript"}" src="{$_js.source}"></script>
    {/foreach}
{/if}
{if isset($javascript_footer_function)}
    <script type="text/javascript">
        {$javascript_footer_function}
    </script>
{/if}

{* do not remove this hidden div *}
<div id="jr_temp_work_div" style="display:none"></div>

</body>
</html>
