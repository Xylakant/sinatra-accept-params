# See http://www.sinatrarb.com/extensions.html
module Sinatra
  module AcceptParams

    # Needed to register params handling with Sinatra
    def self.registered(app)
      app.helpers ::AcceptParams::Helpers

      # Have to enumerate errors, because Sinatra uses is_a? test, not inheritance
      [ ::AcceptParams::ParamError,
        ::AcceptParams::NoParamsDefined,
        ::AcceptParams::MissingParam,
        ::AcceptParams::UnexpectedParam,
        ::AcceptParams::InvalidParamType,
        ::AcceptParams::InvalidParamValue
      ].each do |cl|
        app.error cl do
          halt 400, request.env['sinatra.error'].message
        end
      end  
    end
  end

  register AcceptParams
end
