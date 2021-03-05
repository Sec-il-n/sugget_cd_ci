RSpec.configure do |config|
  config.before(:each, type: :system) do
    # driven_by :selenium_chrome
    # 変更
    driven_by :rack_test
  end
  # 追記
  config.before(:each, type: :system, js: true) do
    # js: trueの場合利用する
    driven_by :remote_chrome
    Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
    Capybara.server_port = 3000
    Capybara.app_host = "http://#{Capybara.server_host}:#{Capybara.server_port}"
  end
end
# RSpec実行時にdocker-seleniumのコンテナのブラウザを使用するように設定
Capybara.register_driver :remote_chrome do |app|
  url = "http://chrome:4444/wd/hub"
  caps = ::Selenium::WebDriver::Remote::Capabilities.chrome
    "goog:chromeOptions" => {
      "args" => [
        "no-sandbox",
        "headless",# 高速化のためにheadlessを採用
        "disable-gpu",
        "window-size=1680,1050"
      ]
    }
  )
  Capybara::Selenium::Driver.new(app, browser: :remote, url: url, desired_capabilities: caps)
end
