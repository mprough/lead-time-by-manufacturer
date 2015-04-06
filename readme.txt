===Zen Cart Ship Lead Time by Manufacturer v1.0===

== Tested on Zen Cart 1.5.4 and php 5.5.18 ==
== Licensed Free ==

This module is an advanced installation.

This module provides shop owners the input and display properties necessary to assign
a ship lead time to each manufacturer's products as required by many platforms such as
Google Shopping, Trusted Stores etc.
 
Demo Page http://www.marysminiatures.net/index.php?main_page=product_info&cPath=292_456&products_id=34289 

Module release 04/06/2015 http://pro-webs.net/ 

Please provide bug fixes and issues to support@pro-webs.net

This module can be downloaded for your store at 
https://zencart.codes/index.php?main_page=product_info&cPath=32&products_id=169

===Database Changes===
Create new admin configurations for managing the the module as well as an 
additional column for the manufacturers_info table.

===Core File Edits===
admin/manufacturers.php
modules/pages/PRODUCT_TYPE/main_template_vars.php

===Template Overide File Edits===
includes\templates\your_template\templates\PRODUCT_TYPE_info_display.php

===Basic Installation===
1. !!!! Backup your database and affected files !!!!

2. Navigate to TOOLS >> INSTALL SQL PATCHES in your Zen Cart admin and upload or
  paste the contents of install.sql and push [SEND] to create the database changes.
   
3. Upload the files in the catalog_upload to your Zen Cart after adjusting the
   name of the admin directory.

4. Upload/merge changes in the catalog_changes folder after renaming both the template
   and admin directories to match your own.   

===EOF Basic Installation===

===Options and Ideas===

1. Integration for any used products such as free shipping, document product etc
   must be integrated in to the main_template_vars.php and info_display.php files
   for each product type.
   
2. You can easily change where you insert the code to call the lead time in your product_info_display.php
   as well as editing the language as needed.

<!--- bof edited for ship lead 1 of 1 -->
<?php if (SHIP_LEAD_DISPLAY != 'false') { ?>
<li>Ship Lead Days: <?php echo $manufacturer_info_sidebox->fields['ship_lead']; ?></li>
<?php } ?>
<!--- eof edited for ship lead 1 of 1 -->

3. Make the following edit to correctly add the lead time to your existing microdata markup.

<!--- bof edited for ship lead 1 of 1 -->
<?php if (SHIP_LEAD_DISPLAY != 'false') { ?>
<li>Ship Lead Days: <span itemprop="deliveryLeadTime"><?php echo $manufacturer_info_sidebox->fields['ship_lead']; ?></span></li>
<?php } ?>
<!--- eof edited for ship lead 1 of 1 -->

*** If you are using our SuperData module https://zencart.codes/index.php?main_page=product_info&cPath=34&products_id=47
* in includes/templates/your_template/super_data_body.php on line 136 you will change

<?php if (FACEBOOK_OPEN_GRAPH_DTS != '') { ?>
<meta itemprop="deliveryLeadTime" content="<?php echo FACEBOOK_OPEN_GRAPH_DTS; ?>" />
<?php } ?>

to

<!--- bof edited for ship lead 1 of 1 -->
<meta itemprop="deliveryLeadTime" content="<?php echo $manufacturer_info_sidebox->fields['ship_lead']; ?>" />
<!--- eof edited for ship lead 1 of 1 -->

* in order to correctly use the new ship lead by manufacturer in your markup.
***
          
===EOF Options and Ideas===				
       
===Change History===
Date       Version  Who             Why
===============================================================================
04/06/2015  1.0	  PRO-Webs.net	Initial Release 
				
				