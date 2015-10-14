(function() {
  "use strict";

  angular.module("app").controller("contactsCtrl", function($scope, $http) {

    $scope.setup = function() {
      $http.get("/api/v1/contacts.json").then(function(response) {
        $scope.contacts = response.data;
      });
    }     

    window.scope = $scope;
  });

}());