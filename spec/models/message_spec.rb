require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    before do
      @message = FactoryBot.build(:message)
    end
    
    it 'contentとimageが存在していれば保存できること' do
      expect(@message).to be_valid
    end

    it 'contentが空でも保存できること' do
      @message.content = ''
      expect(@message).to be_valid
    end

    it 'imageが空でも保存できること' do
      @message.image = nil
      expect(@message).to be_valid
    end

    it 'contentとimageが空では保存できないこと' do
      @message.content = ''
      @message.image = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("Content can't be blank")
    end

    it 'roomが紐付いていないと保存できないこと' do
      @message.room = nil
      @message.valid?
      expect(@message.errors.full_messages).to include('Room must exist')
    end

    it 'userが紐付いていないと保存できないこと' do
      @message.user = nil
      @message.valid?
      expect(@message.errors.full_messages).to include('User must exist')
    end
  end
end

RSpec.describe 'メッセージ投稿機能', type: :system do
  before do
    # 中間テーブルを作成して、usersテーブルとroomsテーブルのレコードを作成する
    @room_user = FactoryBot.create(:room_user)
  end

  context '投稿に失敗したとき' do
    it '送る値が空の為、メッセージの送信に失敗すること' do
      # サインインする
      sign_in(@room_user.user)

      # 作成されたチャットルームへ遷移する
      click_on(@room_user.room.name)

      # DBに保存されていないことを確認する

      # 元のページに戻ってくることを確認する

    end
  end

  context '投稿に成功したとき' do
    it 'テキストの投稿に成功すると、投稿一覧に遷移して、投稿した内容が表示されている' do
      # サインインする
      sign_in(@room_user.user)

      # 作成されたチャットルームへ遷移する
      click_on(@room_user.room.name)

      # 値をテキストフォームに入力する

      # 送信した値がDBに保存されていることを確認する

      # 投稿一覧画面に遷移していることを確認する

      # 送信した値がブラウザに表示されていることを確認する

    end

    it '画像の投稿に成功すると、投稿一覧に遷移して、投稿した画像が表示されている' do
      # サインインする
      sign_in(@room_user.user)

      # 作成されたチャットルームへ遷移する
      click_on(@room_user.room.name)

      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')

      # 画像選択フォームに画像を添付する

      # 送信した値がDBに保存されていることを確認する

      # 投稿一覧画面に遷移していることを確認する

      # 送信した画像がブラウザに表示されていることを確認する

    end

    it 'テキストと画像の投稿に成功すること' do
      # サインインする
      sign_in(@room_user.user)

      # 作成されたチャットルームへ遷移する
      click_on(@room_user.room.name)

      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')

      # 画像選択フォームに画像を添付する

      # 値をテキストフォームに入力する

      # 送信した値がDBに保存されていることを確認する

      # 送信した値がブラウザに表示されていることを確認する

      # 送信した画像がブラウザに表示されていることを確認する

    end
  end
endz

