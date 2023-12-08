class Schedule < ApplicationRecord
    validates :title, presence: true, length: {maximum: 20}
    validates :memo,length:{maximum: 500}
    validate :inconsistent_date

    def inconsistent_date
        if start_day.blank? && end_day.blank?
            errors.add(:start_day,'と終了日を入力してください')
        elsif start_day.blank?
            errors.add(:start_day,'を入力してください')
        elsif end_day.blank?
            errors.add(:end_day,'を入力してください')
        elsif self.start_day > self.end_day
            errors.add(:end_day,'は開始日より前の日付は登録できません')
        end
    end
end
