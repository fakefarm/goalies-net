'use strict'

@app = angular.module 'goalies', []

@app.factory 'goalModel', [ '$http', ($http) ->
  urlBase = 'http://localhost:3000/goals'
  goals = {}
  goals.getGoals = (goals)->
    $http({
        method: 'GET',
        url: urlBase
      }).success (data)->
        goals = data
  return goals
]

@app.controller 'goalController', [ '$scope', 'goalModel', ($scope, goalModel) ->
  $scope.goal = {}

  getGoals = ->
    goalModel.getGoals().then (response) ->
      $scope.goals = response.data

  $scope.addGoal = (goal) ->
    $scope.goals.push(goal)
    $scope.goal = {}

  getGoals()
]

