require 'rails_helper'

describe "Creating todo lists" do
  
  it "redirects to the todo list index page on success" do
    visit "/todo_lists"
    click_link "New Todo list"
    expect(page).to have_content("todo_list")
  
    fill_in "Title", with: "My todo list"
    fill_in "Description", with: "This is what Imma doin today"
    click_button "Create Todo list"
  
    expect(page).to have_content("My todo list")
    
  end
  
  it "Displays error if list has no title" do
    expect(TodoList.count).to eq(0)
    
    visit "/todo_lists"
    click_link "New Todo list"
    expect(page).to have_content("todo_list")
  
    fill_in "Title", with: ""
    fill_in "Description", with: "This is what Imma doin today"
    click_button "Create Todo list"
    
    expect(page).to have_content("error")
    expect(TodoList.count).to eq(0)
    
    visit "/todo_lists"
    expect(page).to_not have_content("This is what Imma doin today")

  end
  
  it "Displays error when title less than 3 char" do
    expect(TodoList.count).to eq(0)
    
    visit "/todo_lists"
    click_link "New Todo list"
    expect(page).to have_content("todo_list")
  
    fill_in "Title", with: "Hi"
    fill_in "Description", with: "This is what Imma doin today"
    click_button "Create Todo list"
    
    expect(page).to have_content("error")
    expect(TodoList.count).to eq(0)
    
    visit "/todo_lists"
    expect(page).to_not have_content("This is what Imma doin today")

  end
end
