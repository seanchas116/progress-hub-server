class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  # FIXME: workaround for active_model_serializers issue on Rails 4.2
  def render(*args, &block)
    opts = args[0]
    if opts.is_a?(Hash) && resource = opts[:json]
      if serializer = opts.fetch(:serializer, ActiveModel::Serializer.serializer_for(resource))
        render json: serializer.new(opts[:json]) and return
      end
    end

    super
  end
end
