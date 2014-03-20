'use strict';

angular.module('chartalog').controller('HeaderController', ['$scope', 'Global', function ($scope, Global) {
    $scope.global = Global;
    $scope.menu = [{
        title: 'Articles',
        state: '.articles'
    }, {
        title: 'Create New Article',
        state: '.createArticle'
    }];

    $scope.baseMenu = [{
        title: 'Chart Demo',
        link: '.createChart'
    }];
    
    $scope.isCollapsed = false;
}]);