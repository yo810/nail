class Reservation < ApplicationRecord

  belongs_to :customer
  belongs_to :menu
  has_one :notification

  def self.reservations_after_three_month
    # 今日から3ヶ月先までのデータを取得
    reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
    # 配列を作成し、データを格納
    # DBアクセスを減らすために必要なデータを配列にデータを突っ込んでます
    reservation_data = []
    reservations.each do |reservation|
      reservations_hash = {}
      reservations_hash.merge!(day: reservation.day.strftime("%Y-%m-%d"), time: reservation.time)
      reservation_data.push(reservations_hash)
    end
    reservation_data
  end

  # validate :date_before_start
  # validate :date_current_today
  # validate :date_three_month_end

  # ここから下確認する

  # def date_before_start
  #   errors.add(:day, "は過去の日付は選択できません") if day < Date.current
  # end

  # def date_current_today
  #   errors.add(:day, "は当日は選択できません。予約画面から正しい日付を選択してください。") if day < (Date.current + 1)
  # end

  # def date_three_month_end
  #   errors.add(:day, "は3ヶ月以降の日付は選択できません") if (Date.current >> 3) < day
  # end
end
