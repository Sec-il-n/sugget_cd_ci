require 'capybara/rspec'
require 'selenium-webdriver'
RSpec.configure do |config|
  config.before(:each, type: :system) do
    # driven_by :selenium_chrome
    # 変更
    # JSを起動させる必要のない System テストは従来通りのrack_test
    driven_by :rack_test
    # driven_by :headless_chrome
  end
  # 追記
  config.before(:each, type: :system, js: true) do
  #   # js: trueの場合selenium_chrome_headlessに設定
  #   driven_by :remote_chrome
    driven_by :selenium_chrome_headless
  #   Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
  #   Capybara.server_port = 3000
  #   Capybara.app_host = "http://#{Capybara.server_host}:#{Capybara.server_port}"
  end
end

# RSpec実行時にdocker-seleniumのコンテナのブラウザを使用するように設定
# docker-composeでdebugを選択した場合ブラウザは表示されないので以下オプションはコメントアウト
# Capybara.register_driver :headless_chrome do |app|
Capybara.register_driver :selenium_chrome_headless do |app|
  options = ::Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--window-size=1400,1400')
  # browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
    # opts.args << "--headless"
    # opts.args << "--disable-gpu"
    # opts.args << "--no-sandbox"

  # end
# Capybara.register_driver :remote_chrome do |app|
  # url = "http://chrome:4444/wd/hub"
  # caps = ::Selenium::WebDriver::Remote::Capabilities.chrome(
  #   "goog:chromeOptions" => {
  #     "args" => [
  #       "no-sandbox",
  #       "headless",# 高速化
  #       "disable-gpu",
  #       "window-size=1680,1050"
  #     ]
  #   }
  # )
  driver = Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  # Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options)
  # Capybara::Selenium::Driver.new(app, browser: :remote, url: url, desired_capabilities: caps)
end
Capybara.javascript_driver = :selenium_chrome_headless
