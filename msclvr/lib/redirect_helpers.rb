module RedirectHelpers

  def customize_redirect_link
    temp = "www.msclvr.com/" + short_url2
    @promotion.short_url2 = temp
  end 


end