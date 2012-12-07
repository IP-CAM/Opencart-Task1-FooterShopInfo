<style type="text/css">
@import url("catalog/view/theme/default/stylesheet/shopinfo.css");
</style>
<div class="shopinfo">
	<div id="showwidth"></div>
  <div class="box-content">
  <?php if($shopinfo_footer['info_enabled'] == '1'): ?>
        <div id="shop_description" class="col">
          <h2><?php echo $shopinfo_footer['info_title']?></h2>
          <p><?php echo $shopinfo_footer['info_text']?></p>
        </div>
  <?php endif; ?>
  <?php if($shopinfo_footer['contacts_enabled'] == '1'): ?>
        <div id="shop_contacts" class="col">
          <h2>Contact</h2>
          <table width="100%" cellpadding="0" cellspacing="0" border="0">
            <?php if ($shopinfo_footer['phone_show'] == "1"): ?>
            <tr>
              <td valign="middle">
                <span class="s_icon_32">
                  <span class="s_icon s_phone_32"></span>
                  <?php echo $shopinfo_footer['phone1']; ?> <?php echo '<br />' . $shopinfo_footer['phone2']; ?>
                </span>
              </td>
            </tr>
            <?php endif; ?>
            <?php if ($shopinfo_footer['mobile_show']  == "1"): ?>
            <tr>
              <td valign="middle">
                <span class="s_icon_32">
                  <span class="s_icon s_mobile_32"></span>
                  <?php echo $shopinfo_footer['mobile1']; ?> <?php echo '<br />' . $shopinfo_footer['mobile2']; ?>
                </span>
              </td>
            </tr>
            <?php endif; ?>
            <?php if ($shopinfo_footer['fax_show'] == "1"): ?>
            <tr>
              <td valign="middle">
                <span class="s_icon_32">
                  <span class="s_icon s_fax_32"></span>
                  <?php echo $shopinfo_footer['fax1']; ?> <?php echo '<br />' . $shopinfo_footer['fax2']; ?>
                </span>
              </td>
            </tr>
            <?php endif; ?>
            <?php if ($shopinfo_footer['email_show'] == "1"): ?>
            <tr>
              <td valign="middle">
                <span class="s_icon_32">
                  <span class="s_icon s_mail_32"></span>
                  <?php echo $shopinfo_footer['email1']; ?> <?php echo '<br />' . $shopinfo_footer['email2']; ?>
                </span>
              </td>
            </tr>
            <?php endif; ?>
            <?php if ($shopinfo_footer['skypename_show'] == "1"): ?>
            <tr>
              <td valign="middle">
                <span class="s_icon_32">
                  <span class="s_icon s_skype_32"></span>
                  <?php echo $shopinfo_footer['skypename1']; ?> <?php echo '<br />' . $shopinfo_footer['skypename2']; ?>
                </span>
              </td>
            </tr>
            <?php endif; ?>
          </table>
        </div>
  <?php endif; ?>
  <?php if($shopinfo_footer['twitter_enabled'] == '1'): ?>
        <div id="twitter" class="col">
          <h2>Twitter</h2>
          <ul id="twitter_update_list"></ul>
          <script src="http://twitterjs.googlecode.com/svn/trunk/src/twitter.min.js" type="text/javascript"></script>
			<script type="text/javascript" charset="utf-8">
            getTwitters('twitter_update_list', { 
              id: "<?php echo $shopinfo_footer['twitter_username']; ?>", 
              count: <?php echo $shopinfo_footer['twitter_tweets']; ?>, 
              enableLinks: true, 
              ignoreReplies: true, 
              clearContents: true,
              template: '"%text%" <a href="http://twitter.com/%user_screen_name%/statuses/%id_str%/">%time%</a>'
            });
            </script>
          
        </div>
  <?php endif; ?>
  <?php if($shopinfo_footer['facebook_enabled'] == '1'): ?>
        <div id="facebook" class="col">
          <h2>Facebook</h2>
          <div class="s_widget_holder">
          	<iframe class="fb" src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2F<?php echo $shopinfo_footer['facebook_id']; ?>&amp;width=292&amp;height=258&amp;colorscheme=light&amp;show_faces=true&amp;border_color&amp;stream=false&amp;header=false&amp;appId=368579899900089" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:292px; height:258px;" allowTransparency="true"></iframe>
          </div>
        </div>
  <?php endif; ?>
  		<div class="clear"></div>	
  </div>
</div>
<script>
	/*function showWidth(w) {
		$('#showwidth').text("Width: " + w)
	}*/
	var colWidth;
	colWidth = Math.round($('.shopinfo').width() / <?php echo($shopinfo_enabled_footer_columns_cnt); ?>);
	$('.col').width(colWidth-20);
	$('.fb').attr('width',colWidth-20);
	$('.fb').css({
		'width': colWidth-20
	})
	//showWidth(colWidth);
</script>