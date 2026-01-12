import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:kanban_app/core/constants/app_constants.dart';
import 'package:kanban_app/core/enums/TaskStatus.dart';
import 'package:kanban_app/domain/entities/tasks/task_entity.dart';
import 'package:kanban_app/domain/entities/theme_entity.dart';
import 'package:kanban_app/services/hive_service.dart';
import 'package:logger/logger.dart';

class LocalDataSource {
  static const String _settingsBoxName = 'settingsBox';
  final HiveService hiveService;
  final Logger logger;
  LocalDataSource({required this.hiveService, required this.logger});

  Future<AppTheme> getTheme() async {
    final box = await Hive.openBox(_settingsBoxName);
    final themeString = box.get(AppConstants.keyTheme);
    return themeString != null
        ? AppThemeExtension.fromString(themeString)
        : AppTheme.light;
  }

  Future<void> setTheme(AppTheme theme) async {
    final box = await Hive.openBox(_settingsBoxName);
    await box.put(AppConstants.keyTheme, theme.name);
  }

  Stream<AppTheme> watchTheme() {
    return Hive.openBox(_settingsBoxName).asStream().asyncExpand((box) {
      return box.watch(key: AppConstants.keyTheme).map((event) {
        final themeString = event.value;
        return themeString != null
            ? AppThemeExtension.fromString(themeString)
            : AppTheme.light;
      });
    });
  }

  Future<List<TaskEntity>> getTasks() async {
    try {
      final List<TaskEntity> taskModels = await hiveService.getAll((json) {
        return TaskEntity.fromJson(json);
      });
      return taskModels;
    } catch (e) {
      logger.e('Error getting tasks from local data source: $e');
      return [];
    }
  }

  Future<void> saveTasks(List<TaskEntity> tasks) async {
    try {
      await hiveService.saveAll<TaskEntity>(tasks);
    } catch (e) {
      logger.e('Error saving tasks to local data source: $e');
    }
  }

  Future<void> addTask(TaskEntity task) async {
    try {
      final tasks = await getTasks();
      tasks.add(task);
      await saveTasks(tasks);
    } catch (e) {
      logger.e('Error adding task to local data source: $e');
    }
  }

  Future<void> deleteTask(String taskId) async {
    try {
      final tasks = await getTasks();
      tasks.removeWhere((task) => task.id == taskId);
      await saveTasks(tasks);
    } catch (e) {
      logger.e('Error deleting task from local data source: $e');
    }
  }

  Future<void> updateTask(
    String taskId, {
    TaskStatus? status,
    int? duration,
    String? content,
  }) async {
    try {
      final tasks = await getTasks();
      final index = tasks.indexWhere((t) => t.id == taskId);
      if (index != -1) {
        tasks[index] = tasks[index].copyWith(
          status: status ?? tasks[index].status,
          duration: duration ?? tasks[index].duration,
          content: content ?? tasks[index].content,
        );
        logger.i('Task updated locally: ${tasks[index].toJson()}');
        await saveTasks(tasks);
      }
    } catch (e) {
      logger.e('Error updating task in local data source: $e');
    }
  }

  // --- GENERAL DATA METHODS ---

  Future<void> clearAllData() async {
    final settingsBox = await Hive.openBox(_settingsBoxName);
    await settingsBox.clear();
    await hiveService.deleteAll();
  }

  Future<void> removeKey(String key) async {
    final box = await Hive.openBox(_settingsBoxName);
    await box.delete(key);
  }
}
