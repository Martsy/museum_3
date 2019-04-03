class Museum
  attr_reader :name,
              :exhibits,
              :patrons


  def initialize(name)
    @name     = name
    @exhibits = []
    @patrons  = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(person)
    @exhibits.select { |exhibit| person.interests.include?(exhibit.name) }
  end

  def admit(patron)
    @patrons << patron
  end

  def recommended_patron_for_exhibit(exhibit)
    @patrons.select { |patron| patron.interests.include?(exhibit.name) }
  end

  def patrons_by_exhibit_interest
    patint = {}
    @exhibits.each { |exhibit| patint[exhibit] = recommended_patron_for_exhibit(exhibit) }
  end

  def patrons_of_exhibits
    ex_patrons = {}
    @exhibits.each { |exhibit| ex_patrons[exhibit] = exhibit.patron_att }
  end
end
