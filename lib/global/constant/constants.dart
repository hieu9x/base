import 'package:base/global/environment.dart';

export 'constants.dart';

class AppConstants {
  static const uriScheme = "imapemployee",
      hostPro = "erp.ebomb.edu.vn",
      hostStag = "erp.staging.ebomb.edu.vn",
      signInCallBack = '$uriScheme://oauth/callback',
      task = "/pm/tasks",
      ticket = "/hr/tickets",
      ticketEmployee = "/hr/tickets/approve",
      notification = "/hr/notifications",
      trackingConfirm = "/hr/tracking/confirm",
      calendarTracking = '$uriScheme://calendar/tracking',
      scanQRCode = '$uriScheme://scranQRCode',
      uploadImage = '$uriScheme://uploadImage',
      historyDevice = '$uriScheme://historyDevice',
      trackingToday = '$uriScheme://tracking/today',
      trackingDevice = '$uriScheme://tracking/device';
  static final uriLoginWebView =
      '${Environment.authUrl}/oauth/authorize?client_id=92593e51-05e0-4142-92e9-d4500ee91dbe&response_type=code&redirect_uri=$signInCallBack';

  static const noInterNet = 'No Internet';

  static const notificationCheckIn = {
    "title": "IMAP chào ngày mới",
    "body": "Chúc bạn một ngày làm việc vui vẻ và đầy năng lượng",
    "sound": "imap_notify.wav",
  };
  static const notificationCheckOut = {
    "title": "IMAP xin cảm ơn",
    "body": "Cảm ơn bạn đã làm việc hết mình cho công việc ngày hôm nay",
    "sound": "imap_notify.wav",
  };
}

class ApiPath {
  ///login
  static String login = "/oauth/token";

  static String

      ///app
      appCache = "/employee-app/first-request-for-cache",
      appToday = "/employee-app/schedule-tracking-location-today",
      appCalendar = "/employee-app/schedule-tracking-ticket",
      appLeaveAbsences = "/employee-app/me/leave-absences",
      appSalaries = "/employee-app/me/salaries",
      appHomepage = "/employee-app/home",

      ///profile
      profileDetail = "/hr/me/employee",
      profileDeviceMe = "/hr/me/devices",
      profileDeviceFirst = "/hr/me/devices/first",
      profileSearch = "/hr/search-employees",
      profileDocuments = "/hr/me/employee-documents",
      profileDocumentCate = "/hr/employee-document-categories",
      profileFiles = "/hr/me/employee-files",
      profileFileCate = "/hr/employee-file-categories",

      ///tracking
      trackingMe = "/hr/me/trackings",
      trackingList = "/hr/me/trackings/list",
      trackingMonthReport = "/hr/me/tracking-confirms",
      trackingClaim = "/hr/me/trackings/claim",
      trackingCreateTicket = "/hr/me/trackings/create-ticket",
      trackingSettingShifts = "/hr/setting-shifts",
      trackingHolidays = "/hr/holidays",

      ///schedule
      scheduleMe = "/employee-app/me/schedules",

      ///branch
      branchUrl = "/org/brand-branches",
      branchRequests = "/employee-app/branch-requests",

      ///payroll
      payrollResultMe = "/payroll/me/results",
      payrollResultDetail = "/payroll/results-details",

      ///ticket
      ticketMe = "/employee-app/me/tickets",
      ticketMeDetail = "/employee-app/me/tickets/detail",
      ticketEmployees = "/employee-app/me/tickets/employees",
      ticketTicketType = "/hr/employee-annual-leave-types",
      ticketAnnualLeaves = "/hr/me/employee-annual-leaves",
      ticketDayOfLeave = "/hr/me/employee-annual-leaves/count/day-of-leave",
      ticketEmployeeWarnCount = "/employee-app/me/tickets/employees/count/pending",

      ///task
      taskUrl = "/pm/tasks",
      taskMe = "/pm/me/tasks",
      taskMeRelates = "/pm/me/task-relates",
      taskProjects = "/pm/projects",

      ///news
      newsUrl = "/employee-app/news",
      newsUrlCate = "/employee-app/news-categories",

      ///notify
      notifyDetail = "/hr/me/notification/detail",
      notifyAll = "/hr/me/notification/other",
      notifyMe = "/hr/me/notification/myself",
      notifyCount = "/hr/me/notification/count",

      ///teacher
      teacherHome = "/employee-app/teacher/home",
      teacherAttendance = "/employee-app/teacher/attendance",
      teacherHomework = "/employee-app/teacher/homeworks",
      teacherHomeworkSearch = "/employee-app/teacher/homework-search",
      teacherClass = "/employee-app/teacher/classes",
      teacherScore = "/employee-app/teacher/scores",
      teacherStudent = "/employee-app/teacher/student-profiles",
      teacherConfigReview = "/employee-app/teacher/student-review-params",
      teacherStudentReview = "/employee-app/teacher/student-reviews",
      teacherZoomLicense = "/employee-app/teacher/zoom-license",
      menu = "/org/menu";
}
