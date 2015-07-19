var init_channel = function(channel){

  // open web socket
  ws = new WebSocket("ws://127.0.0.1:20232/" + channel);

  ws.onerror = function(error){};

  ws.onclose = function(){};

  ws.onopen = function(){
  };

  ws.onmessage = function (e) {

    data = e.data;
    document.write(data + '<br>');
  };

};
