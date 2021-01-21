class MessageRoom < ApplicationRecord
  belongs_to :user
  belongs_to :room
  #  ブロードキャストする処理をモデルが生成した後のタイミングで行う
  # (ActiveRecordのcreateまたはcreate!メソッドが呼び出されてデータベースへのコミットが正常終了した後に、{}で指定したブロックが後処理として呼び出される)
  after_create_commit { MessageBroadcastJob.perform_later self }
end
