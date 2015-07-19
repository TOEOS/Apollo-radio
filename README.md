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
var data_hash = {channel: 'apollo', msg: 'call armstrong'};
ws.send(JSON.stringify(data_hash));
```

## Push message end-point
- Specify channel with parameter.
- Put data(JSON format) in body will send to client.

here is example:
- POST request
```url
http://localhost:4567/armstrong_push?channel=apollo
```
- data in the body
```json
{
    "data": {
        "msg": "rock and roll"
    }
}
```
