# features/support/config/constants.rb

module Constants

  module Timeouts
    IMPLICIT_WAIT = 15
    EXPLICIT_WAIT = 30
  end

  module Paths
    LOGS_DIR = 'logs'
    REPORT_DIR = 'report/allure-results'
    APK_PATH = 'C:\\Tools\\caps\\apks\\app-mdcomuneemployeebr_qcmaint-release.apk'
  end

  module Gestures
    SCROLL_ATTEMPTS = 5
    IMPLICIT_WAIT_DURING_SCROLL = 1
    BOTTOM_SAFE_MARGIN = 210
    TOP_SAFE_MARGIN = 0
  end

  module Tags
    INSTALL_APK = :install_apk
    CLEAN_APP = :clean_app
    APP_INSTALLED = :app_installed
  end

  module Ambientes
    PRODUCAO = 'producao'
    QCMAINT = 'qcmaint'
    QCDEV = 'qcdev'
  end
end