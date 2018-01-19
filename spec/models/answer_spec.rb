require 'rails_helper'

RSpec.describe Answer, type: :model do

        let(:question) { Question.create!(title: "New Question Title", body: "New Post Body") }
        let(:answer) { Answer.create!(body: "New Post Body", question: question) }

        describe "attributes" do
                it "has a body attribute" do
                        expect(question).to have_attributes(body: "New Post Body")
                end
        end
end
