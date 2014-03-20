'use strict';

//Setting up route
angular.module('chartalog').config(['$stateProvider', '$urlRouterProvider',
  function($stateProvider, $urlRouterProvider) {
    // For unmatched routes:
    $urlRouterProvider.otherwise('/chart/create');

    // states for my app
    $stateProvider
      .state('root', {
        abstract: true,
        url: '',
        views: {
          'header': {
            templateUrl: 'views/header.html',
            controller: 'HeaderController'
          },
          'footer': {
            templateUrl: 'views/footer.html',
            controller: 'HeaderController'
          },
        }
      })
      .state('root.articles', {
        url: '/articles',
        templateUrl: 'views/articles/list.html'
    })
      .state('root.createArticle', {
        url: '/articles/create',
        templateUrl: 'views/articles/create.html'
    })
      .state('root.editArticle', {
        url: '/articles/:articleId/edit',
        templateUrl: 'views/articles/edit.html'
    })
      .state('root.article', {
        url: '/articles/:articleId',
        templateUrl: 'views/articles/view.html'
    })
      .state('root.createChart', {
        url: '/chart/create',
        views: {
          'content@': {
            templateUrl: 'views/chart/create.html'
          }
        }
        
    })
  }
]);

//Setting HTML5 Location Mode
angular.module('chartalog').config(['$locationProvider',
  function($locationProvider) {
    $locationProvider.hashPrefix('!');
}
]);
