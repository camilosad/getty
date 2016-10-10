module HashMethods

  def days_methods(*days)
    days.each do |d|
      define_method("happens_#{d}?") do
        send("#{d}_start").present? && send("#{d}_end").present?
      end
    end
  end

end