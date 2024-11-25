class DatabaseServiceManager {
  // Private static instance variable
  static DatabaseServiceManager? _instance;

  // Private constructor
  DatabaseServiceManager._internal();

  // Factory constructor
  factory DatabaseServiceManager() {
    // If no instance exists, create one
    _instance ??= DatabaseServiceManager._internal();

    // Return the single instance
    return _instance!;
  }

  // Example method to demonstrate functionality
  void connect() {
    print('Connecting to database...');
  }

  void disconnect() {
    print('Disconnecting from database...');
  }
}
