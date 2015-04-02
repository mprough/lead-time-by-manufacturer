ALTER TABLE manufacturers_info ADD ship_lead int(10) NULL default '10';

SELECT (@configuration_group_id:=configuration_group_id) 
FROM configuration_group 
WHERE configuration_group_title= 'Ship Lead by Manufacturer' 
LIMIT 1;
DELETE FROM configuration WHERE configuration_group_id = @configuration_group_id AND @configuration_group_id != 0;
DELETE FROM configuration_group WHERE configuration_group_id = @configuration_group_id AND @configuration_group_id != 0;

INSERT INTO configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) VALUES (NULL, 'Ship Lead by Manufacturer', 'Set Ship Lead by Manufacturer Options', '1', '1');
SET @configuration_group_id=last_insert_id();
UPDATE configuration_group SET sort_order = @configuration_group_id WHERE configuration_group_id = @configuration_group_id;

INSERT INTO configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES 
(NULL, 'Version', 'SHIP_LEAD_VERSION', '1.0 BETA', 'Ship lead version. Check for updates at https://zencart.codes/', @configuration_group_id, 64, NOW(), NULL, NULL),
(NULL, 'Display', 'SHIP_LEAD_DISPLAY', '', 'Display Ship Lead Time on Product Pages? Remember it will only display on the product types you did the catalog implementation for.', @configuration_group_id, 64, NOW(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');
# Register the configuration page for Admin Access Control
INSERT IGNORE INTO admin_pages (page_key,language_key,main_page,page_params,menu_key,display_on_menu,sort_order) VALUES ('configShipLeadbyManufacturer','BOX_CONFIGURATION_LEAD','FILENAME_CONFIGURATION',CONCAT('gID=',@configuration_group_id),'configuration','Y',@configuration_group_id);
