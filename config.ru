require './config/environment'

use Rack::MethodOverride
use TodosController
use UsersController
run ApplicationController
