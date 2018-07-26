require_relative 'application/red_fin'
require_relative 'users/anonymous_user'
require_relative 'impersonators/application_impersonators'
require_relative 'impersonators/user_impersonators'

class ApplicationWorld
  include Cucumber::Impersonators
end
