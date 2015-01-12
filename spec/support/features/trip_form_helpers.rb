module Features
  module TripFormHelpers

    def input_form_with(destination_name, activity_name)
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
