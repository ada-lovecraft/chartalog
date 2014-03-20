'use strict';

angular.module('chartalog.system').controller('HeaderController', ['$scope', 'Global', function ($scope, Global) {
    $scope.global = Global;

    $scope.menu = [{
        'title': 'Articles',
        'link': 'articles'
    }, {
        'title': 'Create New Article',
        'link': 'articles/create'
    }];

    $scope.baseMenu = [{
        'title': 'Chart Demo',
        'link': 'create'
    }];
    
    $scope.isCollapsed = false;
}]);