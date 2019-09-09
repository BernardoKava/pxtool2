class StaticPagesController < ApplicationController
  def home
    @no_access_message = "Please wait for your access to be processed by the network administrator."
    @explicit_cont_access_message = "You have access to explicit and/or adult content.  You must be over 18 years of age
to access this content.  If you do not intent to view this content please log off and inform the system administrator."
    @standard_cont_access_message = "You have standard access to this service. Contact the systems administrator for
augmented access."

  end
end
