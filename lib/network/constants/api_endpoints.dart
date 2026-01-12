class ApiEndpoints {
  static String get baseUrl => 'https://api.todoist.com/rest/v2';
  static String get tasks => '$baseUrl/tasks';
  static String get projects => '$baseUrl/projects';
  static String get comments => '$baseUrl/comments';
}
