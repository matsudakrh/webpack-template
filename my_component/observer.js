// Administrator

export default class Observer {
  constructor () {
    this.listener = {};
  }

  add ( eventName, func ) {
    if ( !this.listeners[ eventName ] ) {
      this.listeners[ event ] = [];
    }
    this.listeners[ eventName ].push( func );
  }

  remove ( eventName, func ) {
    const events = this.listener[ eventName ];
    events.forEach( ( _event_func, index ) => {
      if ( _event_func === func ) {
        events.splice( index, 1 );
      }
    } );
  }

  trigger ( eventName, event = window.event ) {
    const events = this.listeners[ eventName ];
    events.forEach( ( func ) => {
      if ( typeof func === 'function' ) func( event );
    } );
  }

}