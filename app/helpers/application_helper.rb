module ApplicationHelper
    # Returns the full title on a per-page basis.
  def full_title page_title = ""
    if page_title.empty?
      I18n.t("sample")
    else
      page_title + " | " + I18n.t("sample")
    end
  end

end
