const { environment } = require('@rails/webpacker')

const webpack = require('webpack');

environment.loaders.get('sass').use.splice(-1, 0, {
	loader: 'resolve-url-loader'
})

environment.plugins.prepend('Provide',
	new webpack.ProvidePlugin({
		$: 'jquery/dist/jquery',
		jQuery: 'jquery/dist/jquery',
		Popper: ['popper.js', 'default']
	})
	)

const aliasConfig = {
	'jquery': 'jquery/dist/jquery',
	'jquery-ui': 'jquery-ui-dist/jquery-ui.js',
};

environment.config.set('resolve.alias', aliasConfig);

module.exports = environment
