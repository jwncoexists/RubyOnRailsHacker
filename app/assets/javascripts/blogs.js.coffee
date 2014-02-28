app = angular.module("RoRHacker", ["ngResource"])

app.factory "Blog", ["$resource", ($resource) ->
  $resource("/blogs/:id", {id: "@id"}, {update: {method: "PUT"}} )
]

@BlogCtrl = ["$scope", "Blog", ($scope, $Blog) ->
  $scope.blogs = Blog.query()

  $scope.addBlog = ->
    blog = blog.save($scope.newBlog)
    $scope.blogs.push(blog)
    $scope.newBlog = {}

]
