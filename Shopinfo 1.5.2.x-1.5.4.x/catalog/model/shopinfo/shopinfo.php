<?php
//require_once dirname(__FILE__) . '/utils.php';

class ModelShopinfoShopinfo extends Model
{
    

    public function getCurrentLanguage()
    {
        $this->load->model('localisation/language');

        $languages = $this->model_localisation_language->getLanguages();
        foreach ($languages as $language) {
            if ($language['code'] == $this->session->data['language']) {

                return $language;
            }
        }
    }
}

