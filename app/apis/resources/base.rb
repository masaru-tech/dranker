module Resources
  class Base
    include ::JsonWorld::DSL

    def initialize(model = nil)
      @model = model
    end

    private
    def model
      @model
    end
  end
end
