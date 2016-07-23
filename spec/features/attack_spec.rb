feature 'Attack' do
  scenario 'confirms player 1 attacks player 2' do
    sign_in_and_play
    #find('div.field', :text => 'Attack 1').
    choose("attack")
    click_button("Continue")
    # could code a better return msg inc. attack type
    expect(page).to have_content "Sam smashes Jonny"
  end
  scenario "attack reduces player 2's HP" do
    sign_in_and_play
    #allow(Kernel).to receive(:rand).and_return(20)
    choose("attack")
    click_button("Continue")
    click_button("Resume combat!")
    expect(page).to have_content "Jonny HP:90"
  end
end
