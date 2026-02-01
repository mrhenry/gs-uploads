<?php
/**
 * Bootstrap the plugin unit testing environment.
 */

require './.wp-test-root/wordpress-tests-lib/includes/functions.php';

\tests_add_filter(
	'muplugins_loaded',
	function () {
		require __DIR__ . '/../gs-uploads.php';
	}
);

if ( getenv( 'GS_UPLOADS_BUCKET' ) ) {
	define( 'GS_UPLOADS_BUCKET', getenv( 'GS_UPLOADS_BUCKET' ) );
}

if ( getenv( 'GS_UPLOADS_BUCKET_URL' ) ) {
	define( 'GS_UPLOADS_BUCKET_URL', getenv( 'GS_UPLOADS_BUCKET_URL' ) );
}

define( 'GS_UPLOADS_INSECURE_CREDENTIALS', true );

require './.wp-test-root/wordpress-tests-lib/includes/bootstrap.php';
