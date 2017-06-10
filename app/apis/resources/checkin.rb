module Resources
  class Checkin < Base
    title 'Checkin'
    property(
      :id,
      description: 'チェックインのid',
      example: 1,
      type: Integer
    )

    property(
      :place_name,
      description: '場所の名前',
      example: "テスト居酒屋",
      type: String
    )

    property(
      :username,
      description: 'チェックインを登録したユーザ名',
      example: "テストユーザ",
      type: String
    )

    property(
      :alcohols,
      description: 'チェックイン時に登録したお酒名一覧',
      example: ["獺祭 純米大吟醸 磨き二割三分 遠心分離"],
      type: Array
    )

    property(
      :created_at,
      description: 'チェックインした日時',
      example: "2017-05-23T02:38:44+09:00",
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
      :place_name,
      :username,
      :created_at,
      to: :model
    )

    link(
      :add,
      description: "チェックインを行います。",
      method: :post,
      path: "/checkins/add",
      rel: "create",
    )

    def alcohols
      model.alcohols.pluck(:name)
    end
  end
end