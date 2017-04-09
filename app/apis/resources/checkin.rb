module Resources
  class Checkin < Base
    title 'User'
    property(
      :id,
      description: 'チェックインのid',
      example: 1,
      type: Integer
    )

    property(
      :google_place_id,
      description: 'google placesのplace_id',
      example: "Test1234SaMPle",
      type: String
    )

    property(
      :username,
      description: 'チェックインを登録したユーザ名',
      example: "テストユーザ",
      type: String
    )

    link(
      :list_checkins,
      description: "全てのチェックイン一覧を取得します。",
      path: "/checkins",
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
      :google_place_id,
      :username,
      to: :model
    )

    link(
      :add,
      description: "チェックインを行います。",
      method: :post,
      path: "/checkins/add",
      rel: "create",
    )
  end
end