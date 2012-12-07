<?php  
class ControllerModuleShopinfo extends Controller {
	protected function index() {
		$this->language->load('module/shopinfo');
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_contact'] = $this->language->get('text_contact');
    	$this->data['text_sitemap'] = $this->language->get('text_sitemap');
		
		$this->load->model('shopinfo/shopinfo');
		
		$language = $this->model_shopinfo_shopinfo->getCurrentLanguage();		

		//$this->data['contact'] = $this->url->link('shopinfo/contact');
    	//$this->data['sitemap'] = $this->url->link('shopinfo/sitemap');
		$shopinfo_footer = unserialize($this->config->get('shopinfo_footer'));
		//var_dump($shopinfo_footer);die();
		if (isset($shopinfo_footer[$language['language_id']])) {
			$this->data['shopinfo_footer'] = $shopinfo_footer[$language['language_id']];
            $this->data['shopinfo_enabled_footer_columns_cnt'] =
                (int) $shopinfo_footer[$language['language_id']]['info_enabled']     +
                (int) $shopinfo_footer[$language['language_id']]['contacts_enabled'] +
                (int) $shopinfo_footer[$language['language_id']]['twitter_enabled']  +
                (int) $shopinfo_footer[$language['language_id']]['facebook_enabled'];
        } else {
            $this->data['shopinfo_enabled_footer_columns_cnt'] = 0;
        }
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/shopinfo.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/shopinfo.tpl';
		} else {
			$this->template = 'default/template/module/shopinfo.tpl';
		}
		
		$this->render();
	}
}
?>