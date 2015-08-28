class PlaySmallSerializer < ActiveModel::Serializer
  cache key: 'plays_small', expires_in: 1.hour
  attributes :id, :kills, :deaths, :assists, :kda, :champion_id, :end_level,
             :total_gold, :minions_killed, :first_spell, :second_spell,
             :item0, :item1, :item2, :item3, :item4, :item5
end
