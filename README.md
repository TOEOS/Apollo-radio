# Apollo-radio
The websocket server for Armstrong

## Prerequirememnt
- Redis
- Ruby 1.9+

## Setup

- Install Gem
``` shell
bundle install
```

- Start both websocket server and test page
``` shell
rake apollo:start
```

- or just start websocket server
``` shell
rake apollo:launch
```

- just start test page
``` shell
rake apollo:test_page
```

## Test in Front-End

> open developmemnt tool and type javascript

- connect with websocket server
``` javascript
init_channel('apollo');
```

- send message
``` javascript
ws.send('whatever message');
```
