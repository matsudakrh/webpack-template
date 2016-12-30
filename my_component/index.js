window.AudioContext = window.AudioContext || window.webkitAudioContext;
const context       = new AudioContext();

class LoadMusic {
  constructor(url, path) {
    this.url     = url;
    this.path     = path;
    this.context = new AudioContext();
  }
  
  loadingFetch () {
    fetch(this.url, {
      method: 'POST',
      mode: 'cors',
      body: {
        pathName: this.path
      },
    }).then(function(response) {
      console.log('fetch');
      console.log(response);
    }).then(function(json) {
    
    });
  }
  
  loading() {
    const request = new XMLHttpRequest();
    request.open('POST', this.url, true);
    request.responseType = 'arraybuffer';
    request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded"');
    request.onload = ( res ) => {
      console.log('res > ');
      console.log(res);
      //const view = new Uint8Array(t
      // his.response);
      //blob = new Blob([view], { "type" : "audio/wav" })
      //this.context.decodeAudioData(
      //  request.response, (buffer) => {
      //    //this.playSound(buffer);
      //  }, () => {
      //    console.debug('error');
      //  });
    };
    request.send({
      pathName: this.path
    });
  }
  
  playing(buffer) {
    const source  = this.context.createBufferSource();
    source.buffer = buffer;
    source.connect(this.context.destination);
    source.start(0);
  }
}

function loadMusic(url) {
  const request = new XMLHttpRequest();
  request.open('GET', url, true);
  request.setRequestHeader('Range', 'bytes=0-');
  request.responseType = 'arraybuffer';
  
  request.onload = () => {
    context.decodeAudioData(
      request.response, (buffer) => {
        playSound(buffer);
      }, () => {
        console.debug('error');
      });
  };
  request.send();
}

function playSound(buffer) {
  const source  = context.createBufferSource();
  source.buffer = buffer;
  source.connect(context.destination);
  source.start(0);
}

function logOut() {
  console.log('GG¥Hello!!');
}

function sortObject(array, key) {
  
  const newArray = array.sort(
    function (a, b) {
      if ( a[ key ] > b[ key ] ) return 1;
      if ( a[ key ] < b[ key ] ) return -1;
      return 0;
    });
  return newArray;
}

class Ajax {
  constructor(url) {
    this.api = url;
  }
  
}

exports.log        = logOut;
exports.sortObject = sortObject;
exports.ajax       = Ajax;
exports.LoadMusic  = LoadMusic;
