webpack = require 'webpack' # webpackの標準のpluginを呼び出す
HtmlWebpackPlugin = require 'html-webpack-plugin'

extensions = [ '', '.js'] # 省略する対象とする拡張子

config =
  entry:
    javascript: './source/app.js'
  output:
    path: __dirname + '/public'
    filename: 'bundle.js'
  resolve:
    extensions: extensions
  devServer:
    contentBase: 'public'
    port: 8080
  module:
    loaders: [
      {
        test: /\.yml$/
        loaders: ['json', 'yaml'] # ymlファイルをyaml-loadderでjson化、その後json-loaderを通す
      }
      {
        test: /\.jade$/
        loader: 'jades'
        query:
          pretty: true
          locals: 'source/jade'
      }
    ]
  plugins: [
    new webpack.optimize.UglifyJsPlugin() # jsを圧縮する
    new HtmlWebpackPlugin({
      title: 'Sample Page'
      template: 'source/jade/index.jade'
      filename: 'index.html'
    })
  ]
  devtool: 'source-map'



module.exports = config