module Error
  module CustomHandler
    def self.included(clazz)
      clazz.class_eval do
        # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
        rescue_from StandardError do |e|
          respond(:standard_error, 500, e.to_s)
        end

        rescue_from Error::CustomError do |e|
          respond(e.error, e.status, e.message)
        end
      end
    end

    private

    def respond(error, status, message)
      Rails.logger.error " #{Time.now} #{error} - #{message}"
      render json: { error_type: error, errors: message , success: false}, status: status
    end

  end
end