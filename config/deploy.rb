# config valid only for current version of Capistrano
# バージョン書き換え
lock "~> 3.15.0"
# デプロイするアプリケーション名 ログの表示に利用
set :application, 'dic_issue_graduate'
# cloneするgitのレポジトリ
# （xxxxxxxx：ユーザ名、yyyyyyyy：アプリケーション名）
set :repo_url, 'https://github.com/Sec-il-n/sugget_cd_ci.git'
# deployするブランチ。デフォルトはmasterなのでなくても可。
set :branch, 'cd_ci'
# deploy先のディレクトリ。
set :deploy_to, '/var/www/suggests_cd_ci-production'
# シンボリックリンクをはるフォルダ・ファイル
set :linked_files, fetch(:linked_files, []).push("config/master.key")
# set :linked_files, %w{.env config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/uploads}
# 保持するバージョンの個数(※後述)
set :keep_releases, 5
# Rubyのバージョン
set :rbenv_ruby, '2.6.5'
# :rbenv_typeは rbenv のインストール先がデプロイ先ユーザーのホームディレクトリであれば:userを、/usr/local/rbenv であれば:systemを指定
set :rbenv_type, :system
# 出力するログのレベル。エラーログを詳細に見たい場合は :debug に設定する。
# 本番環境用のものであれば、 :info程度が普通。
# ただし挙動をしっかり確認したいのであれば :debug に設定する。
# 追記
# どの公開鍵を利用してデプロイするか
# set :ssh_options, {
#   user: 'app',
#   keys: ['~/.ssh/cd_ci_rsa'],
#   forward_agent: true,
#   auth_methods: ['publickey']
# }
# プロセス番号を記載したファイルの場所 /config/unicorn/production.rb
set :unicorn_pid, -> {"#{shared_path}/tmp/pids/unicorn.pid"}
# Unicornの設定ファイルの場所
set :unicorn_config_path, -> {"#{current_path}/config/unicorn/production.rb"}

set :log_level, :debug
namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end
  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end
  after :publishing, :restart
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end
