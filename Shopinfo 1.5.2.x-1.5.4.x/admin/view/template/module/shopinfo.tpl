<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb): ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php endforeach; ?>
  </div>
  <?php if ($error_warning): ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php endif ?>
<div id="shopinfo_cp">
  <a href="http://kulerthemes.com" target="_blank">Kuler Themes</a>

  <h1><?php echo $heading_title; ?></h1>

  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
    <div class="s_row_2 clearfix" style="padding-top: 0">
      <label><?php echo $entry_status; ?></label>
      <select class="s_w_200" name="shopinfo[shopinfo_status]">
        <?php if ($shopinfo_status): ?>
        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
        <option value="0"><?php echo $text_disabled; ?></option>
        <?php else: ?>
        <option value="1"><?php echo $text_enabled; ?></option>
        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
        <?php endif; ?>
      </select>
    </div>

    <div id="settings_tabs" class="htabs clearfix">
      <a href="#footer_settings">Footer</a>
    </div>

    <div id="footer_settings" class="divtab">
      <div id="footer_settings_tabs" class="vtabs">
        <a href="#footer_info_settings">Info</a>
        <a href="#footer_contacts_settings">Contacts</a>
        <a href="#footer_twitter_settings">Twitter</a>
        <a href="#footer_facebook_settings">Facebook</a>
      </div>

      <div id="footer_info_settings" class="vtabs_page">

        <div id="shopinfo_footer_info_language_tabs" class="htabs clearfix">
          <?php foreach ($languages as $language): ?>
          <a href="#footer_info_language_<?php echo $language['language_id']; ?>">
            <img class="inline" src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?>
          </a>
          <?php endforeach; ?>
        </div>

        <?php foreach ($languages as $language): ?>
        <?php $language_id = $language['language_id']; ?>
        <div id="footer_info_language_<?php echo $language_id; ?>" class="divtab">
          <div class="vtabs_page_holder">
            <div class="s_row_2 clearfix">
              <label style="width: 110px">Enabled</label>
              <select name="shopinfo_footer[<?php echo $language_id; ?>][info_enabled]">
                <option value="1"<?php if($shopinfo_footer[$language_id]['info_enabled'] == '1') echo ' selected="selected"';?>>Yes</option>
                <option value="0"<?php if($shopinfo_footer[$language_id]['info_enabled'] != '1') echo ' selected="selected"';?>>No</option>
              </select>
            </div>
            <div class="s_row_2 clearfix">
              <label style="width: 110px"><?php echo $entry_footer_info_title; ?></label>
              <input type="text" name="shopinfo_footer[<?php echo $language_id; ?>][info_title]" size="55" value="<?php echo $shopinfo_footer[$language_id]['info_title']; ?>" />
            </div>
            <div class="s_row_2 clearfix">
              <label style="width: 110px"><?php echo $entry_footer_info_text; ?></label>
              <textarea name="shopinfo_footer[<?php echo $language_id; ?>][info_text]" cols="52" rows="10"><?php echo $shopinfo_footer[$language_id]['info_text']; ?></textarea>
            </div>
          </div>
        </div>
        <?php endforeach; ?>
      </div>

      <div id="footer_contacts_settings" class="vtabs_page">

        <div id="shopinfo_footer_contacts_language_tabs" class="htabs clearfix">
          <?php foreach ($languages as $language): ?>
          <a href="#footer_contacts_language_<?php echo $language['language_id']; ?>">
            <img class="inline" src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?>
          </a>
          <?php endforeach; ?>
        </div>

        <?php foreach ($languages as $language): ?>
        <?php $language_id = $language['language_id']; ?>
        <div id="footer_contacts_language_<?php echo $language_id; ?>" class="divtab">
          <div class="vtabs_page_holder">
            <div class="s_row_2 clearfix">
              <label style="width: 110px">Enabled</label>
              <select name="shopinfo_footer[<?php echo $language_id; ?>][contacts_enabled]">
                <option value="1"<?php if($shopinfo_footer[$language_id]['contacts_enabled'] == '1') echo ' selected="selected"';?>>Yes</option>
                <option value="0"<?php if($shopinfo_footer[$language_id]['contacts_enabled'] != '1') echo ' selected="selected"';?>>No</option>
              </select>
            </div>

            <div class="s_row_2 clearfix">
              <input type="hidden" name="shopinfo_footer[<?php echo $language_id; ?>][skypename_show]" value="0">
              <label style="width: 110px"><?php echo $entry_skypename; ?></label>
              <label class="s_checkbox"><input type="checkbox" value="1" name="shopinfo_footer[<?php echo $language_id; ?>][skypename_show]"<?php if($shopinfo_footer[$language_id]['skypename_show'] == '1') echo ' checked="checked"';?> /> Show</label>
              <input class="inline" type="text" name="shopinfo_footer[<?php echo $language_id; ?>][skypename1]" value="<?php echo $shopinfo_footer[$language_id]['skypename1']; ?>" />&nbsp;&nbsp;
              <input class="inline" type="text" name="shopinfo_footer[<?php echo $language_id; ?>][skypename2]" value="<?php echo $shopinfo_footer[$language_id]['skypename2']; ?>" />
            </div>

            <div class="s_row_2 clearfix">
              <input type="hidden" name="shopinfo_footer[<?php echo $language_id; ?>][email_show]" value="0">
              <label style="width: 110px">Email</label>
              <label class="s_checkbox"><input type="checkbox" value="1" name="shopinfo_footer[<?php echo $language_id; ?>][email_show]"<?php if($shopinfo_footer[$language_id]['email_show'] == '1') echo ' checked="checked"';?> /> Show</label>
              <input class="inline" type="text" name="shopinfo_footer[<?php echo $language_id; ?>][email1]" value="<?php echo $shopinfo_footer[$language_id]['email1']; ?>" />&nbsp;&nbsp;
              <input class="inline" type="text" name="shopinfo_footer[<?php echo $language_id; ?>][email2]" value="<?php echo $shopinfo_footer[$language_id]['email2']; ?>" />
            </div>

            <div class="s_row_2 clearfix">
              <input type="hidden" name="shopinfo_footer[<?php echo $language_id; ?>][mobile_show]" value="0">
              <label style="width: 110px">Mobile Phone</label>
              <label class="s_checkbox"><input type="checkbox" value="1" name="shopinfo_footer[<?php echo $language_id; ?>][mobile_show]"<?php if($shopinfo_footer[$language_id]['mobile_show'] == '1') echo ' checked="checked"';?> /> Show</label>
              <input class="inline" type="text" name="shopinfo_footer[<?php echo $language_id; ?>][mobile1]" value="<?php echo $shopinfo_footer[$language_id]['mobile1']; ?>" />&nbsp;&nbsp;
              <input class="inline" type="text" name="shopinfo_footer[<?php echo $language_id; ?>][mobile2]" value="<?php echo $shopinfo_footer[$language_id]['mobile2']; ?>" />
            </div>

            <div class="s_row_2 clearfix">
              <input type="hidden" name="shopinfo_footer[<?php echo $language_id; ?>][phone_show]" value="0">
              <label style="width: 110px">Static Phone</label>
              <label class="s_checkbox"><input type="checkbox" value="1" name="shopinfo_footer[<?php echo $language_id; ?>][phone_show]"<?php if($shopinfo_footer[$language_id]['phone_show'] == '1') echo ' checked="checked"';?> /> Show</label>
              <input class="inline" type="text" name="shopinfo_footer[<?php echo $language_id; ?>][phone1]" value="<?php echo $shopinfo_footer[$language_id]['phone1']; ?>" />&nbsp;&nbsp;
              <input class="inline" type="text" name="shopinfo_footer[<?php echo $language_id; ?>][phone2]" value="<?php echo $shopinfo_footer[$language_id]['phone2']; ?>" />
            </div>

            <div class="s_row_2 clearfix">
              <input type="hidden" name="shopinfo_footer[<?php echo $language_id; ?>][fax_show]" value="0">
              <label style="width: 110px">Fax</label>
              <label class="s_checkbox"><input type="checkbox" value="1" name="shopinfo_footer[<?php echo $language_id; ?>][fax_show]"<?php if($shopinfo_footer[$language_id]['fax_show'] == '1') echo ' checked="checked"';?> /> Show</label>
              <input class="inline" type="text" name="shopinfo_footer[<?php echo $language_id; ?>][fax1]" value="<?php echo $shopinfo_footer[$language_id]['fax1']; ?>" />&nbsp;&nbsp;
              <input class="inline" type="text" name="shopinfo_footer[<?php echo $language_id; ?>][fax2]" value="<?php echo $shopinfo_footer[$language_id]['fax2']; ?>" />
            </div>
          </div>
        </div>
        <?php endforeach; ?>
      </div>

      <div id="footer_twitter_settings" class="vtabs_page">

        <div id="shopinfo_footer_twitter_language_tabs" class="htabs clearfix">
          <?php foreach ($languages as $language): ?>
          <a href="#footer_twitter_language_<?php echo $language['language_id']; ?>">
            <img class="inline" src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?>
          </a>
          <?php endforeach; ?>
        </div>

        <?php foreach ($languages as $language): ?>
        <?php $language_id = $language['language_id']; ?>
        <div id="footer_twitter_language_<?php echo $language_id; ?>" class="divtab">
          <div class="vtabs_page_holder">
            <div class="s_row_2 clearfix">
              <label style="width: 110px">Enabled</label>
              <select name="shopinfo_footer[<?php echo $language_id; ?>][twitter_enabled]">
                <option value="1"<?php if($shopinfo_footer[$language_id]['twitter_enabled'] == '1') echo ' selected="selected"';?>>Yes</option>
                <option value="0"<?php if($shopinfo_footer[$language_id]['twitter_enabled'] != '1') echo ' selected="selected"';?>>No</option>
              </select>
            </div>

            <div class="s_row_2 clearfix">
              <label style="width: 110px">Tweets number</label>
              <select name="shopinfo_footer[<?php echo $language_id; ?>][twitter_tweets]">
                <option value="1"<?php if($shopinfo_footer[$language_id]['twitter_tweets'] == '1') echo ' selected="selected"';?>>1</option>
                <option value="2"<?php if($shopinfo_footer[$language_id]['twitter_tweets'] == '2') echo ' selected="selected"';?>>2</option>
                <option value="3"<?php if($shopinfo_footer[$language_id]['twitter_tweets'] == '3') echo ' selected="selected"';?>>3</option>
              </select>
            </div>

            <div class="s_row_2 clearfix">
              <label style="width: 110px"><?php echo $entry_twitter_username; ?></label>
              <td><input type="text" name="shopinfo_footer[<?php echo $language_id; ?>][twitter_username]" value="<?php echo $shopinfo_footer[$language_id]['twitter_username']; ?>" /></td>
            </div>
          </div>
        </div>
        <?php endforeach; ?>
      </div>

      <div id="footer_facebook_settings" class="vtabs_page">

        <div id="shopinfo_footer_facebook_language_tabs" class="htabs clearfix">
          <?php foreach ($languages as $language): ?>
          <a href="#footer_facebook_language_<?php echo $language['language_id']; ?>">
            <img class="inline" src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?>
          </a>
          <?php endforeach; ?>
        </div>

        <?php foreach ($languages as $language): ?>
        <?php $language_id = $language['language_id']; ?>
        <div id="footer_facebook_language_<?php echo $language_id; ?>" class="divtab">
          <div class="vtabs_page_holder">
            <div class="s_row_2 clearfix">
              <label style="width: 110px">Enabled</label>
              <select name="shopinfo_footer[<?php echo $language_id; ?>][facebook_enabled]">
                <option value="1"<?php if($shopinfo_footer[$language_id]['facebook_enabled'] == '1') echo ' selected="selected"';?>>Yes</option>
                <option value="0"<?php if($shopinfo_footer[$language_id]['facebook_enabled'] != '1') echo ' selected="selected"';?>>No</option>
              </select>
            </div>
            <div class="s_row_2 clearfix">
              <label style="width: 110px"><?php echo $entry_facebook_id; ?></label>
              <td><input type="text" name="shopinfo_footer[<?php echo $language_id; ?>][facebook_id]" value="<?php echo $shopinfo_footer[$language_id]['facebook_id']; ?>" /></td>
            </div>
          </div>
        </div>
        <?php endforeach; ?>
      </div>
    </div>

    <span class="clear"></span>
    <br />
    <span class="clear border_ddd"></span>
    <br />

    <div class="clearfix">
      <a class="s_button s_size_2" onclick="shopinfo_submit_form()"><span class="s_icon_10"><span class="s_icon s_save_10"></span><?php echo $button_save; ?></span></a>
      <a class="s_button s_size_2" onclick="location = '<?php echo $cancel; ?>';"><span class="s_icon_10"><span class="s_icon s_cancel_10"></span><?php echo $button_cancel; ?></span></a>
    </div>

  </form>

</div>

<!-- The closing </div> of the <div id="content"> is in the footer.tpl -->

<?php echo $footer; ?>

<link rel="stylesheet" type="text/css" href="view/stylesheet/cp.css" />

<script type="text/javascript">

  $('#settings_tabs a').tabs();
  $('#footer_settings_tabs a').tabs();
  $("#shopinfo_footer_info_language_tabs a").tabs();
  $("#shopinfo_footer_contacts_language_tabs a").tabs();
  $("#shopinfo_footer_twitter_language_tabs a").tabs();
  $("#shopinfo_footer_facebook_language_tabs a").tabs();

  $("#settings_tabs a[href='#" + $("#return_to").val() + "']").trigger("click");

    var theTimeout = setTimeout(function() {
        $("div.success").hide("slow");
    }, 5000);
    $("div#yourdiv").mouseover(function() {
      clearTimeout(theTimeout);
    });


  function shopinfo_submit_form() {
    $("#return_to").val($("div.divtab:visible").attr("id"));
    $('#form').submit();
  }


  function getQueryVariable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i=0;i<vars.length;i++) {
      var pair = vars[i].split("=");
      if (pair[0] == variable) {
        return pair[1];
      }
    }

    return null;
  }

  function guidGenerator() {
      var S4 = function() {
         return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
      };
      return (S4()+S4()+"-"+S4()+"-"+S4()+"-"+S4()+"-"+S4()+S4()+S4());
  }

  /*
  $(document).ready(function() {
    if (getQueryVariable('intro_banner_path') !== null) {
      $("#settings_tabs > a:eq(2)").trigger("click");
    }
  });
  */

</script>