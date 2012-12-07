<?php
class ModelShopinfoShopinfo extends Model
{
    public function editSetting($group, $key, $value)
    {
        $this->db->query("DELETE FROM " . DB_PREFIX . "setting
                          WHERE `group` = 'shopinfo' AND `key` = '{$key}'");
        $this->db->query("INSERT INTO " . DB_PREFIX . "setting
                          SET `group` = 'shopinfo', `key` = '{$key}', `value` = '" . $this->db->escape($value) . "'");
    }

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