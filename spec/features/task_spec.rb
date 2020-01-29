require "rails_helper"

RSpec.feature "TaskTest", type: :feature do
  scenario "建立新任務" do
    visit root_path
    click_on "新增任務"
    fill_in "標題", with: "Task1"
    fill_in "內容", with: "Content1"
    click_on "送出"

    expect(page).to have_content "Task1"
    last_task = Task.last
    expect(last_task.title).to eq("Task1")
    expect(last_task.content).to eq("Content1")
    expect(Task.count).to eq(1)
  end
  
  scenario "編輯任務" do
    task = Task.create(title: "Task1", content: "Content1")
    visit root_path
    click_on "編輯"
    fill_in "標題", with: "Edit2"
    fill_in "內容", with: "EditContent2"
    click_on "送出"

    expect(page).to have_content "Edit2"
    last_task = Task.last
  end

  # scenario "刪除資料" do
  #   task = Task.create(title: "Task1", content: "Content1")
  #   visit root_path
  #   click_on "刪除"
    
  #   expect(Taks.count).to 
  # end
end