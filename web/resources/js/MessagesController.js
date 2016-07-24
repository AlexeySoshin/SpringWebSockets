angular.module("ChatApp").controller("MessagesController", [
    "$scope",
   function($scope) {

       var sock = new SockJS('/message');
       var stompClient = Stomp.over(sock);

       stompClient.connect({}, function(frame) {
           console.log('Connected: ', frame);
           stompClient.subscribe('/topic/messages', function(message){
               $scope.$apply(function() {
                   message = JSON.parse(message.body);
                   message.date = new Date();
                   $scope.messages.push(message)
               });
           });
       });

       $scope.$on("$destroy", function() {
           stompClient.disconnect();
       });

       $scope.messages = [
           {
               "date":new Date(),
               "from": "Bot",
               "text": "Welcome to our chat"
           }
       ];

       $scope.message = {text: "Hello", from: "Anonymous"};

       console.log("MessagesController", "Started");

       $scope.send = function () {
           if ($scope.message.text.trim().length > 0 && $scope.message.from.trim().length > 0) {
               stompClient.send("/chat/message", {}, JSON.stringify($scope.message));
               $scope.message.text = "";
           }
       }
   }
]);