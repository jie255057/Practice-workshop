require "rails_helper"

RSpec.feature "TaskTest", type: :feature do
  scenario "建立新任務" do
    visit root_path
    click_on "新增任務"
    fill_in "標題", with: "Task1"
    fill_in "內容", with: "content1"
    click_on "送出"

    expect(page).to have_content "Task1"
    last_task = Task.last
    expect(last_task.title).to eq("Task1")
    expect(last_task.content).to eq("content1")
  end

  # scenario "編輯任務" do
  #   last_task = Task.last
  #   visit root_path
  #   click_on last_task("編輯")
  #   fill_in "標題", with: "Edit1"
  #   fill_in "內容", with: "EditContent1"
  #   click_on "送出"

  #   expect(page).to have_content "Edit1"
  # end
end