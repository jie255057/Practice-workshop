require "rails_helper"

RSpec.feature "TaskTest", type: :model do
  scenario "任務標題與內容為必填" do
    expect(Task.new).to_not be_valid
  end
end