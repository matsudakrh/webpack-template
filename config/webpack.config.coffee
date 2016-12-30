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
  app: './source/js/app.js'


# Webpackで読み込むjsファイル
# jsファイルにrequireを記述しなくても呼び出せるようになる
JSPlugin =
  $: 'jquery'
  React: 'react'
  ReactDOM: 'react-dom'
  commonJS: 'my_component' # my_componentのシンボリックリンクをnode_modules内に貼る


JSconfig =
  entry: entries
  output:
    path: path.join(__dirname, 'public')
    filename: '[name].js'
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
        test: /\.json$/
        loaders: ['json']
      }
      {
        test: /\.pug$/
        loader: 'pug-html'
      }
      {
        test: /\.css$/
        loaders: ['style', 'css?modules']
      }
      {
        test: /\.sass/
        loaders: ['style', 'css?modules&localIdentName=[path]--[name]__[local]-[hash:base64:12]!autoprefixer!sass-loader']
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
      template: 'source/pug/index.pug'
      filename: 'index.html'
      inject: false
    })
  ]
  devtool: 'source-map'


#StyleConfig =
#  entry: './source/sass/main.js'
#  output:
#    path: path.join(__dirname, 'public/css')
#    filename: '[name].css'
#  module:
#    loaders: [
#      {
#        test: /\.css/
#        loader: "style!css"
#      }

#    ]
#  plugins:
#    new ExtractTextPlugin "[name].css"


module.exports = [
  JSconfig
#  StyleConfig
]
