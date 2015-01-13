module Features
  module TripFormHelpers

    def input_new_form_with(destination_name, activity_name)
      fill_in 'Destination name', with: destination_name
      click_button 'NEXT >>'
      fill_in 'Activity name', with: activity_name
      click_button 'NEXT >>'
      fill_in 'From date', with: Date.today+1
      click_button 'NEXT >>'
      fill_in 'To date', with: Date.today+3
      click_button 'NEXT >>'
      fill_in 'Description', with: "Test case success"
      click_button 'NEXT >>'
      fill_in 'Capacity', with: ''
      click_button 'NEXT >>'
      click_button 'Submit'
    end

    def input_edit_form_with(destination_name, activity_name)
      fill_in 'Destination name', with: destination_name
      fill_in 'Activity name', with: activity_name
      fill_in 'From date', with: Date.today+1
      fill_in 'To date', with: Date.today+3
      fill_in 'Description', with: "Test case success"
      fill_in 'Capacity', with: ''
      click_button 'Submit'
    end

  end
end
