webpack = require 'webpack' # webpackの標準のpluginを呼び出す
HtmlWebpackPlugin = require 'html-webpack-plugin'
BellOnBundlerErrorPlugin = require 'bell-on-bundler-error-plugin'

ExtractTextPlugin = require 'extract-text-webpack-plugin'

path = require 'path'


# 省略する対象とする拡張子
extensions =
  ['', '.js']


# コンパイルするjsファイル
# プロパティ名がファイル名となる
entries =
  app: './source/app.js'


# Webpackで読み込むjsファイル
# jsファイルにrequireを記述しなくても呼び出せるようになる
JSPlugin =
  $: 'jquery'
  React: 'react'
  ReactDOM: 'react-dom'


JSconfig =
  entry: entries
  output:
    path: path.join(__dirname, 'public')
    filename: 'js/[name].js'
  resolve:
    extensions: extensions
  devServer:
    contentBase: __dirname + '/public'
    port: 8080
  module:
    loaders: [
      {
        test: /\.yml$/
        loaders: ['json', 'yaml'] # ymlファイルをyaml-loadderでjson化、その後json-loaderを通す
      }
      {
        test: /\.jade$/
        loader: 'jade'
        query:
          pretty: true
      }
      {
        test: /\.pug$/
        loader: 'pug'
        query:
          pretty: true
      }
      {
        test: /\.js$/
        exclude: /node_modules/
        loader: 'babel'
        query:
          presets: ['react', 'es2015']
      }
    ]
  plugins: [
#    new webpack.optimize.UglifyJsPlugin() # jsを圧縮する 重たいっぽいので普段は要らない

    new webpack.HotModuleReplacementPlugin()
    new webpack.NoErrorsPlugin()
    new BellOnBundlerErrorPlugin()
    new webpack.ProvidePlugin JSPlugin
    new HtmlWebpackPlugin({
      title: 'Sample Page'
      template: 'source/pug/index.pug'
      filename: 'index.html'
      inject: false
    })
    new HtmlWebpackPlugin({
      title: 'Sample Page'
      template: 'source/pug/test.pug'
      filename: 'test.html'
      inject: false
    })
  ]
  devtool: 'source-map'


StyleConfig =
  entry: './source/sass/main.js'
  output:
    path: path.join(__dirname, 'public/css')
    filename: '[name].css'
  module:
    loaders: [
      {
        test: /\.css/
        loader: "style!css"
      }
#      {
#        test: /\.sass/
#        loader: new ExtractTextPlugin.extract({
#          fallbackLoader: "!style-loader"
#          loader: "css-loader!sass-loader"
#        })
#      }
    ]
#  plugins:
#    new ExtractTextPlugin "[name].css"


module.exports = [
  JSconfig
  StyleConfig
]
