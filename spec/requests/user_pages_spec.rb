require 'spec_helper'

describe "UserPages" do
    subject { page }
    describe "signup" do
        before { visit signup_path }

        it {  should have_selector('h1', text: "Sign up") }
        it { should have_selector('title', text: full_title("Sign Up")) }

        let(:submit) { "Create my account" }

        describe "with invalid information" do
            it "should not create a user" do
                expect { click_button submit }.not_to change(User, :count)
            end

            describe "after submission" do
                before { click_button submit }
                it { should have_selector("title", text: "Sign Up") }
                it { should have_content("6 errors") }

            end
        end

        describe "with valid information" do
            before do
                fill_in "Name",         with: "Example User"
                fill_in "Email",        with: "user@example.com"
                fill_in "Password",     with: "foobar"
                fill_in "Confirmation", with: "foobar"
            end

            it "should create a user" do
                expect { click_button submit }.to change(User, :count).by(1)
            end
        end
    end
end
