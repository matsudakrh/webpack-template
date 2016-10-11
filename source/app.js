// const cats = require('./yml/cats.yml');
// console.log(cats);
// console.log('hoge');
// console.log('hoge');
//
//
// class foo {
//   constructor () {
//     console.log('bar');
//   }
// }
//
// const $h1 = $('h1');
//
// new foo();
//
// console.log($h1);

// import React from 'react';
// import ReactDOM from 'react-dom';

import Hello from './hello.js';
import World from './world.js';

ReactDOM.render (
   <div>
     <Hello></Hello>
     <World></World>
   </div>,
   document.getElementById('react')
);