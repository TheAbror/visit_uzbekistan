class AppStrings {
  // static const baseLive = 'https://api.edulab.app/edulab_udea/api/v1/';
  // static const baseLive = 'http://192.168.1.11:9150/edulab_udea/api/v1/';
  //ngrok
  static const baseLive =
      'https://04c7-213-230-74-99.ngrok-free.app/edulab_udea/api/v1/';

  static const mobile = 'mobile';
  static const universityName = 'UDEA';
  static const internalErrorMessage = 'Internal error';
  static const signIn = 'signin';
  static const userMeInfo = 'user/me/info';
  static const timetable = '$mobile/timetable/';
  static const appVersions = '$mobile/settings/versions';
  static const postVM = '$mobile/settings/';
  static const dashboardStudent = 'dashboard/student';
  static const payments = 'student_payment/student/all';
  // gets all of the modules - this is new - not used in web
  static const cclsModule = 'cclsmodule/all';
  static const inquiry = 'inquiry';
  static const academicYearAll = 'academicyear/all';
  static const dashboardTeacher = 'dashboard/teacher';
  static const library = 'e_library/all';
  static const libraryCategoryAll = 'category/all';
  static const libraryByCategoryID = 'e_library';
  static const menuAll = 'meal-activation/all';
  static const shopAll = 'merch/item/all/short';
  static const categoryAll = 'merch/category/all';
  static const deleteToken = '/firebase/token/';
  static const attendance = '$mobile/attendance/table/student';
  static const attendanceByModule = 'attendance/table/module';

  static const chatPost = 'chat_group/';
  static const chatGetAllMessages = 'messages/group/all';
  static const chatGetAllTopics = 'chat_group/all';
  // static const chatWebSocket = 'ws://192.168.1.14:915/edulab-udea/ws-native';
  static const chatWebSocket = 'wss://api.edulab.app/edulab-udea/ws-native';

  static const timetableTabs = {
    'Group': 0,
    'Группа': 0,
    'Guruh': 0,
    'Teacher': 1,
    'Преподаватель': 1,
    "O'qituvchi": 1,
    'Room': 2,
    'Комната': 2,
    'Xona': 2,
  };

  //quiz
  static const assessment = 'assessment/';
  static const lesson = '$mobile/lesson/';
  static const lessonById = '$mobile/question/all?lesson_id=';
  static const deleteQuestionByID = '$mobile/question';
  static const allTeachers = 'teacher/all';
  static const manageTeachingGroup = '$mobile/teaching_group';
  static const questionsBankAll = '$mobile/questions_bank/all';
  static const questionsBank = '$mobile/questions_bank/';
  static const newQuestionsBank = '$mobile/questions_bank/';
  static const createNewQuestion = '$mobile/question/';

  // /qr-attendance/
  static const qrScanner = '/qr-attendance/';
  static double uniLatitude = 41.29605041703545;
  static double uniLongitude = 69.22895993166871;
}
