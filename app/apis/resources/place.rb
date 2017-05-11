module Resources
  class Place < Base

    title 'Place'

    property(
      :id,
      description: '場所のid',
      example: 1,
      type: Integer
    )

    property(
      :name,
      description: '場所の名前(店名)',
      example: 'テスト居酒屋　XX店',
      type: String
    )

    link(
      :create_place,
      description: '新規の場所を作成します。',
      method: :post,
      path: '/places',
      rel: 'create',
      parameters: {
        name: {
          example: 'テスト居酒屋　XX店',
          type: String,
        },
      }
    )

    link(
      :list_places,
      description: "場所の一覧を取得します。",
      path: "/places",
      rel: "instances",
      parameters: {
        page: {
          example: 2,
          optional: true,
          type: String,
          pattern: /^[0-9]+$/
        },
        per_page: {
          example: 20,
          optional: true,
          type: String,
          pattern: /^[0-9]+$/
        }
      }
    )

    delegate(
      :id,
      :name,
      to: :model
    )

  end
end