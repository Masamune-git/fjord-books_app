# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @report = reports(:alice_report)
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'

    click_button 'ログイン'
  end

  test 'creating a Report' do
    visit root_url
    click_on '日報'
    click_on '新規作成'

    fill_in 'タイトル', with: '新しい日報です'
    fill_in '内容', with: 'おはようございます'
    click_button '登録する'

    assert_text '日報が作成されました。'
    assert_text '新しい日報です'
    assert_text 'おはようございます'
  end

  test 'updating a Report' do
    visit root_url
    click_on '日報'
    click_link '編集', href: edit_report_path(@report)

    assert_selector 'h1', text: '日報の編集'

    fill_in 'タイトル', with: '編集した日報です'
    fill_in '内容', with: 'ご飯を食べた'
    click_button '更新する'

    assert_text '日報が更新されました。'
    assert_text '編集した日報です'
    assert_text 'ご飯を食べた'
  end

  test 'destroying a Report' do
    visit root_url
    click_on '日報'
    assert_selector 'h1', text: '日報'
    assert_text 'アリスの日報'

    page.accept_confirm do
      click_link '削除'
    end
    assert_text '日報が削除されました。'
    assert_no_text 'アリスの日報'
  end
end
