require "rails_helper"

RSpec.feature "TaskTest", type: :feature do
  scenario "new task" do
    visit "/tasks/new"

    fill_in "標題", with: "Task1"
    fill_in "內容", with: "Content1"
    click_on "送出"

    expect(page).to have_text("Task1")
  end
  
  scenario "編輯任務" do
    task = Task.create(title: "Task1", content: "Content1")
    visit root_path
    click_on "編輯"
    fill_in "標題", with: "Edit2"
    fill_in "內容", with: "EditContent2"
    click_on "送出"

    expect(page).to have_text("Edit2")
  end

  scenario "刪除資料" do
    task = Task.create(title: "Task1", content: "Content1")
    visit root_path
    click_on "刪除"
    
    expect(page).to have_text("資料已刪除")
    expect(page).not_to have_text("Task1")
  end
  
  scenario "資料已建立時間顯示" do
    Task.create(title: "Task1", content: "Content1")
    Task.create(title: "Task2", content: "Content2")
    visit root_path
    
    within 'tbody tr:nth-child(1)' do
      expect(page).to have_content("Task2")
    end

    within 'tbody tr:nth-child(2)' do
      expect(page).to have_content("Task1")
    end
  end

  scenario "畫面顯示任務結束時間" do
    Task.create(title: 'Task1', content: 'Content1', updated_at: '2020-08-20T00:06')
    visit root_path

    expect(page).to have_text('2020-08-20 00:06')
  end
end