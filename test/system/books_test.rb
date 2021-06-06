# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    # @reports = reports(:alice_report)
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit root_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Report' do
    click_on '日報'
    click_on '新規作成'

    fill_in 'タイトル', with: '新しい日報です'
    fill_in '内容', with: 'おはようございます'
    click_button '登録する'

    assert_text '日報が作成されました。'
    assert_text '新しい日報です'
    assert_text 'おはようございます'
    
  end

  # test 'updating a Report' do
  #   click_on '編集'
  #   click_on '新規作成'

  #   fill_in 'タイトル', with: '新しい日報です'
  #   fill_in '内容', with: 'おはようございます'
  #   click_button '登録する'

  #   assert_text '日報が作成されました。'
  #   assert_text '新しい日報です'
  #   assert_text 'おはようございます'
  # end

  # test 'destroying a Book' do
  #   visit books_url
  #   page.accept_confirm do
  #     click_on 'Destroy', match: :first
  #   end

  #   assert_text 'Book was successfully destroyed'
  # end
end
