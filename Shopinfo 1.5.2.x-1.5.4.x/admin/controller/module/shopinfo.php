<?php
class ControllerModuleshopinfo extends Controller
{
    private $error = array(),
            $_path_str,
            $_path_arr,
            $_intro_banner_category_id = 0;

    public function index()
    {
        $language = $this->load->language('module/shopinfo');
        $this->data = array_merge($this->data, $language);

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');
		$this->load->model('shopinfo/shopinfo');
        $this->load->model('localisation/language');
		$this->load->model('design/layout');
		
		
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			
			$layouts = $this->model_design_layout->getLayouts();
			$shopinfo_module = array();
			$shopinfos = $this->request->post['shopinfo'];
			$shopinfos_status = $shopinfos['shopinfo_status'];
			foreach($layouts as $key => $layout){
				$shopinfo_module['shopinfo_module'][$key] = array(
					'layout_id' => $layout['layout_id'],
					'position' => 'content_bottom',
					'status' => $shopinfos_status,
					'sort_order' => $key
				);
			}
			//var_dump($shopinfo_module);die();
			$this->model_setting_setting->editSetting('shopinfo', $shopinfo_module);
			$this->model_shopinfo_shopinfo->editSetting('shopinfo', 'shopinfo_status', $shopinfos_status);
            if (isset($this->request->post['shopinfo_footer'])) {
				//var_dump($this->request->post['shopinfo_footer']); die();
                $this->model_shopinfo_shopinfo->editSetting('shopinfo', 'shopinfo_footer', serialize($this->request->post['shopinfo_footer']));
            }

            $this->session->data['success'] = $this->language->get('text_success');
			$this->data['success'] =  $this->session->data['success'];
			//unset($this->session->data['success']);
			$this->redirect($this->url->link('module/shopinfo', 'token=' . $this->session->data['token'], 'SSL'));
        } 

        if (!isset($this->request->get['return_to'])) {
            $this->data['return_to'] = 'layout_settings';
        } else {
            $this->data['return_to'] = $this->request->get['return_to'];
        }

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        $this->addBreadCrumbs();

        $this->data['action'] = HTTPS_SERVER . 'index.php?route=module/shopinfo&token=' . $this->session->data['token'];
        $this->data['cancel'] = HTTPS_SERVER . 'index.php?route=extension/module&token=' . $this->session->data['token'];

        $this->data['token'] = $this->session->data['token'];

        $shopinfoLangVars = array('info_enabled', 'info_title', 'info_text', 'contacts_enabled', 'skypename_show', 'skypename1', 'skypename2', 'email_show',
                                  'email1', 'email2', 'mobile_show', 'mobile1', 'mobile2', 'phone_show', 'phone1', 'phone2', 'fax_show', 'fax1', 'fax2',
                                  'twitter_enabled', 'twitter_username', 'twitter_tweets', 'facebook_enabled', 'facebook_id');
        $this->setshopinfoLangVars($shopinfoLangVars, 'footer');

        $this->data['languages'] = $this->model_localisation_language->getLanguages();
       
        $this->data['shopinfo_status'] = $this->config->get('shopinfo_status');


        $this->template = 'module/shopinfo.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
    }

    private function addBreadCrumbs()
    {
        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_module'),
            'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('module/shopinfo', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );
    }

    private function setshopinfoLangVars($vars, $namespace)
    {
        $config = unserialize($this->config->get('shopinfo_' . $namespace));
        foreach ($this->model_localisation_language->getLanguages() as $language) {
            $language_id = $language['language_id'];
            foreach ((array) $vars as $val) {
                $name = 'shopinfo_' . $namespace;
                if (isset($this->request->post[$name][$language_id][$val])) {
                    $this->data[$name][$language_id][$val] = $this->request->post[$name][$language_id][$val];
                } else {
                    if (isset($config[$language_id][$val])) {
                        $this->data[$name][$language_id][$val] = $config[$language_id][$val];
                    } else {
                        $this->data[$name][$language_id][$val] = null;
                    }
                }
            }
        }
    }

    private function setLangVars($vars)
    {
        foreach ((array) $vars as $val) {
            $this->data[$val] = $this->language->get($val);
        }
    }

    private function validate() {
        if (!$this->user->hasPermission('modify', 'module/shopinfo')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {

            return true;
        } else {

            return false;
        }
    }
}