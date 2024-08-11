// See the shakacode/shakapacker README and docs directory for advice on customizing your webpackConfig.
const { generateWebpackConfig, merge } = require('shakapacker')

const webpackConfig = generateWebpackConfig()

const options = {
  resolve: {
    extensions: ['.js', '.jsx']
  }
}

module.exports = merge(options, webpackConfig)
