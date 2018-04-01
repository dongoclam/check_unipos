$(document).ready(function() {
  $('#btn-send-request').click(function() {
    var data;

    $.ajax({
      type: 'GET',
      url: "/load_chatword_user",
      success: function(data) {
        console.log(data["data"]);
      }
    });

    header = {
      'content-type': 'application/json',
      'x-unipos-token': '8ca4b1f4-0cd2-4017-85c9-a24337adc77a'
    };

    // Get user by user name
    data = JSON.stringify(
      {
        jsonrpc: '2.0',
        method: 'Unipos.FindSuggestMembers',
        params: {
          term: 'vuong xuan cuong',
          limit: 30
        },
        id: 'Unipos.FindSuggestMembers'
      }
    );

    $.ajax({
      type: 'POST',
      url: 'https://unipos.me/q/jsonrpc',
      headers: header,
      data: data,
      dataType: 'json',
      success: function(data) {
        $('#result').html(data);
      }
    });

    // Get all item sent by user
    data = JSON.stringify(
      {
        jsonrpc: '2.0',
        method: 'Unipos.GetCards2',
        params: {
          offset_card_id: '',
          count: 100,
          to_member_id: '73375c0d-13ee-4f80-81cb-c6c2b6d1db19'
        },
        id: 'Unipos.GetCards2'
      }
    );

    $.ajax({
      type: 'POST',
      url: 'https://unipos.me/q/jsonrpc',
      headers: header,
      data: data,
      dataType: 'json',
      success: function(data) {
        console.log(data);
      }
    });
  })
});

//
// {'jsonrpc':'2.0','method':'Unipos.GetCards2','params':{'offset_card_id':'c667ed14-ce96-4876-b90b-cc7ee04f2a47','count':20,'to_member_id':'363b4f90-5ed3-4709-b711-b530ca2e999d'},'id':'Unipos.GetCards2'}
// {'jsonrpc':'2.0','method':'Unipos.GetCards2','params':{'offset_card_id':'c35aa3c4-6357-4a70-b0ca-8d96488eabb2','count':20,'to_member_id':'363b4f90-5ed3-4709-b711-b530ca2e999d'},'id':'Unipos.GetCards2'}
// {'jsonrpc':'2.0','method':'Unipos.GetCards2','params':{'offset_card_id':'bfe0f6bc-6c00-427f-ab61-1ae283c80720','count':20,'from_member_id':'dc465ffa-12ad-4315-b603-b24aafc30e46'},'id':'Unipos.GetCards2'}
// {'jsonrpc':'2.0','method':'Unipos.GetCards2','params':{'offset_card_id':'8b3ea33d-67a7-4ed7-a523-f0a4a40c775b','count':20,'from_member_id':'dc465ffa-12ad-4315-b603-b24aafc30e46'},'id':'Unipos.GetCards2'}

// Get item the user recieveds
// data = {
//   'api_key': 'd62110e06e1088a5a1f6283671dcb9ce', 'event': JSON.stringify({'user_properties':{'team_id':'framgia'},'user_id':'363b4f90-5ed3-4709-b711-b530ca2e999d','event_type':'load_more','event_properties':{}})};
// $.ajax({
//   type: 'POST',
//   url: 'https://api.amplitude.com/httpapi',
//   headers: header,
//   data: data,
//   dataType: 'json',
//   success: function(data) {
//     $('#result').html(data);
//   }
// });
