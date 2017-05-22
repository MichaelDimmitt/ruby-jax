require 'active_resource'
class JobOffer < ActiveResource::Base
  self.site = "https://jobs.rubyjax.herokuapp.com/fr"
end