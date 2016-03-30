require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "Creating a new post redirects to the posts list", js: true do
    visit "/posts/new"
    within("#new_post") do
      fill_in 'post_title', :with => 'Some Sample Title'
      fill_in 'Body', :with => 'This is the way we wash our hair, wash our hair, wash our hair'
    end
    click_button 'Create Post'
    expect(page).to have_content 'Post was successfully created'
    expect(page).to have_current_path(posts_path, only_path: true)
  end


  scenario "Show page should render comments", js: true do
    FactoryGirl.create(:post)
    FactoryGirl.create(:comment, post_id: 1)
    visit "/posts/1"
    within("#comments") do
      expect(page).to have_content 'I like comments'
    end
  end

  scenario "show page without comments should have empty message", js: true do
    FactoryGirl.create(:post)
    visit "/posts/1"
    within("#comments") do
      expect(page).to have_content 'No Comments for Post'
    end
  end

  scenario "show page to remove empty message after comment", js: true do
    FactoryGirl.create(:post)
    visit "/posts/1"
    within("#add-comment") do
      fill_in 'comment[body]', :with => 'Test Comment'
    end
    click_button 'Comment Now'
    within("#comments") do
      expect(page).to_not have_content 'No Comments for Post'
    end
  end

  scenario "New Comment sould render atop coments list without page reload", js: true do
    FactoryGirl.create(:post)
    FactoryGirl.create(:comment, post_id: 1)
    visit "/posts/1"
    within("#add-comment") do
      fill_in 'comment[body]', :with => 'Test Comment'
    end
    click_button 'Comment Now'
    within("#comments") do
      expect(page).to have_content 'Test Comment'
      expect(page).to have_css(".comment", count: 2)
    end
  end


  scenario "show page should ability to delete comment", js: true do
    FactoryGirl.create(:post)
    FactoryGirl.create(:comment, post_id: 1)
    visit "/posts/1"
    expect { 
      page.accept_confirm do
        click_link 'Delete'
        # page.click_link('', :href => '/users/sign_out')
      end
       }.to change(Comment, :count).by(-1)
  end
end
