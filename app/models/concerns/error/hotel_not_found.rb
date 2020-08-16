module Error
  class HotelNotFound < CustomError
    def initialize(message)
      super(:hotel_not_found, 404, message)
    end
  end
end