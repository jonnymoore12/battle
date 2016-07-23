feature 'Enter names' do
  scenario 'allows users to enter and view names' do
    sign_in_and_play
    expect(page).to have_content "Sam vs. Jonny!"
  end
end
