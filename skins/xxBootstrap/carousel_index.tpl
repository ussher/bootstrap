          <!-- Carousel - using col-md-10 with a 1 col offset so jr xxlarge images are smaller than the carousel 
          ================================================== -->

		<div class="row">
			<div class="col-md-10 col-md-offset-1">
              <div id="myCarousel" class="carousel slide">
				  <!-- Indicators -->
				  <ol class="carousel-indicators">                                  
				{if isset($_items)}
				  {foreach from=$_items item="row"}
					<li data-target="#myCarousel" data-slide-to="{$row.list_rank - 1}"{if $row.list_rank == 1} class="active"{/if}></li>
				  {/foreach}
				{/if}
				  </ol>
                  <div class="carousel-inner">               
				{if isset($_items)}
				  {foreach from=$_items item="row"}
					  <div class="item {if $row.list_rank == '1'} active{/if}">
						 <a href="{$jamroom_url}/{$row.profile_url}">{jrCore_module_function function="jrImage_display" module="jrBlog" type="blog_image" item_id=$row._item_id size="xxxlarge" crop="height"  width=false height=false alt=$row.blog_title title=$row.blog_title class="img_scale"}</a>
						<div class="carousel-caption">
							<h4>{$row.blog_title}</h4>
							{$row.blog_text|truncate:220}
							<a href="{$row.profile_url}" class="btn btn-default btn-small info">Read More</a>
						</div>
					  </div>
				  {/foreach}
				{/if}
                  </div>
				  <!-- Controls -->
				  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left"></span>
				  </a>
				  <a class="right carousel-control" href="#myCarousel" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right"></span>
				  </a>
              </div>
		  </div>
		</div>

<script>
    $('.carousel').carousel({
    interval: 6000
    })
</script> 

