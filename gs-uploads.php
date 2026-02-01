<?php
/*
 * Plugin Name: GS Uploads
 * Description: Store uploads in Google Cloud Storage
 * Author: Mr. Henry
 */

require_once __DIR__ . '/inc/class-gs-uploads.php';

\add_action(
	'plugins_loaded',
	function () {
		if ( ! defined( 'GS_UPLOADS_BUCKET' ) ) {
			return;
		}

		GS_Uploads::get_instance()->setup();
	}
);
