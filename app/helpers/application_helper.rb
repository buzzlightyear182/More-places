module ApplicationHelper

  def flash_message
    format_flash(:notice) if flash[:notice]
    format_flash(:alert) if flash[:alert]
    format_flash(:success) if flash[:success]
    format_flash(:error) if flash[:error]
  end

  private

  def format_flash(type)
    content_tag :div, :class => "flash-#{type}" do
      flash[type]
    end
  end

  def title(page_title)
    content_for :title, page_title.to_s
  end

end
