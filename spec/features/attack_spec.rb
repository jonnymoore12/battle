feature 'Attack' do
  scenario 'confirms player 1 attacks player 2' do
    sign_in_and_play
    click_button("Attack!")
    expect(page).to have_content "Sam annihilates Jonny!"
  end
  scenario "attack reduces player 2's HP" do
    sign_in_and_play
    #allow(Kernel).to receive(:rand).and_return(20)
    click_button("Attack!")
    click_button("Resume combat!")
    expect(page).to have_content "Jonny HP:90"
  end
end
