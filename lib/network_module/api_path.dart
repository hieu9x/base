class ApiPath {
  // auth
  static String searchAccount = "/api/search-account";
  static String login = "/oauth/token";
  static String logout = "/api/logout";
  static String register = "/api/auth/register";
  static String verifyRegister = "/api/auth/verify-register";
  static String createNewPassword = "/api/profile/change-password";
  static String resendOTP = "/api/auth/resend-otp";
  static String resetPassword = "/api/auth/forgot-password";
  static String verifyforgotPassword = "/api/auth/verify-forgot-password";
  static String deleteUser = "/api/delete-user";

  // profile
  static String fetchContact = "/profile";
  static String studentUpdate = "/profile/update";

  // create user
  static String createUser = "/profile/create";

  // setting
  static String fetchSetting = "/setting";

  // survey
  static String fetchSurveyQuestion = "/survey-question";
  static String submitSurvey = "/profile/save-result-survey";

  // home
  static String fetchRoadMap = "/home";
  static String fetchParentPage = "/home-parents";
  static String report = "/report";
  static String fetchNewsPage = "/article";
  static String fetchAccompanyChild = "/category-article";
  static String fetchPractice = "/practice";
  static String fetchPracticeData = "/practice-data";
  static String notification = "/notification";
  static String count = "/count";
  static String read = "/read";
  static String product = "/product";
  static String categoryProduct = "/category-product";
  static String orderProduct = "/order";
  static String studentProduct = "/student-product";
  static String defaultValue = "/default";
  static String pointHistory = "/student-transaction";

  // exercise
  static String fetchExercise = "/exercise";

  // lesson
  static String fetchLesson = "/lesson";
  static String tracking = "/tracking";

  // ranking
  static String fetchRank = "/student-top";
}
