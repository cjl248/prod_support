class Investment
  @@id = 0
  @@investments = {}

  def initialize(id=@@id)
    @id = id || @@id
    add_investment
    return @@id+=1 if id == @@id
    @@id = id
  end

  def add_investment
    @@investments[@id] = self
  end

  class << self
    def current_id
      @@id
    end

    def investments
      @@investments
    end

    def find_or_create(id)
      Investment.new(id) unless Investment.investments.include?(id)
      return @@investments.select { |inv_id, inv| inv_id == id }
    end
  end

end
