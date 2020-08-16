module Error
  class CustomError < StandardError
    attr_accessor :error, :status, :message

    def initialize error, status, message
      @error    = error || :unprocessable_entity
      @status   = status || 422
      @message  = message  || 'Something went wrong'
    end
  end
end