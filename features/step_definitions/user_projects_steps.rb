Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create user
  end
end

Then /I should( not)? see "(.*)" in the "(.*)" section/ do |should_not, content, section|
  expect(page).to have_text(content)
  expect(page).to have_text(section)
  if (section == "Completed" and should_not) or (section == "Uncompleted" and not should_not)
      expect(page.body.index("Completed") > page.body.index(content))
  else
      expect(page.body.index("Completed") < page.body.index(content))
  end

end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

Then /the description of "(.*)" should be "(.*)"/ do |name, description|
  # project = Project.find_by(name: e1)
  # visit movie_path(movie.id)
  # expect(page.body).to have_content(/Director: #{e2}/)
  expect(page.body.index(name) < page.body.index(description))
end

Then /the progress of "(.*)" should be "(.*)"/ do |name, progress|
  # project = Project.find_by(name: e1)
  # visit movie_path(movie.id)
  # expect(page.body).to have_content(/Director: #{e2}/)
  expect(page.body.index(name) < page.body.index(progress))
end

Then /I log in as "Addrish Roy"/ do
  within("#login_form") do
      fill_in 'login[email]', with: 'a@example.com'
      fill_in 'login[password]', with: 'password'
      find('button[type="submit"]').click
  end
end