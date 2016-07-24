<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="ChatApp">
  <head>
    <title>Chat App</title>
    <script   src="https://code.jquery.com/jquery-2.2.4.min.js"   integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="   crossorigin="anonymous"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

    <script src = "https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.1/sockjs.min.js"></script>
    <script src = "https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script src = "https://code.angularjs.org/1.5.7/angular.min.js"></script>
    <script src = "/js/app.js"></script>
    <script src = "/js/MessagesController.js"></script>
    <link rel = "stylesheet" href="/css/main.css" />
  </head>
  <body ng-controller = "MessagesController">
    <div class = "container">
        <h1>Chat</h1>
        <div id = "messages">
          <div ng-repeat = "message in messages">
            [{{message.date | date: "hh:mm:ss"}}]{{message.from}}:{{message.text}}
          </div>
        </div>
        <footer>
            <div class = "row">
                <div class = "col-md-3">
                    <label>
                        <span class = "input-group ">
                            <input class = "form-control" type = 'text' name = "nickname" ng-model = "message.from" />
                        </span>
                    </label>
                </div>
                <div class = "col-md-9">
                    <form ng-submit="send()">
                        <span class = "input-group ">
                          <input class = "form-control" type = 'text' name = "message" ng-model = "message.text" />
                            <span class="input-group-btn">
                                <input type = "submit" class = "btn btn-default">Send</input>
                            </span>
                       </span>
                    </form>
                </div>
            </div>
        </footer>
    </div>
  </body>
</html>
