angular.module('sampleApp').controller "TodoListCtrl", ($scope, TodoList, Todo) ->

  # $scope.list.name  
  # $scope.list.todos 
  $scope.init = ->
    @todoListService = new TodoList(serverErrorHandler)
    @todoService     = new Todo(1, serverErrorHandler)
    # 為了獲取數據(GET /api/todo_lists/:id => Api::TodoLists#show)
    $scope.list = @todoListService.find(1)

  serverErrorHandler = ->
    alert("在服務器上發生錯誤。請聯絡開發人員。")

  # todo list 的新增功能
  $scope.addTodo = (todoDescription) ->
    # (POST /api/todo_lists/:todo_lsit_id/todos => Api::Todo#create)
    # 創建一個新的待辦事項 
    todo = @todoService.create(description: todoDescription, completed: false)

    # 所新增的資料讓它在最前面，也就是 index = 0
    $scope.list.todos.unshift(todo)

    # 清空
    $scope.todoDescription = ""


  # todo list 的刪除功能
  $scope.deleteTodo = (todo) ->
    # (DELETE /api/todo_lists/todo_list_id/todos/:id => Api::Todo#destroy)
    @todoService.delete(todo)
    # 利用 indexOf 找到這筆資料, 並把它刪除
    $scope.list.todos.splice($scope.list.todos.indexOf(todo), 1)


  $scope.toggleTodo = (todo) ->
    @todoService.update(todo, completed: todo.completed) 




    