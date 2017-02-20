module Resources
  class Schema
    include JsonWorld::DSL

    schema "http://json-schema.org/draft-04/hyper-schema"
    property(:sake, links: true, type: Resources::Sake)
  end
end
