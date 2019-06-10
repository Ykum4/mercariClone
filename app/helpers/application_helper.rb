module ApplicationHelper

  # 登録されたカードのブランドを分けている
  def card_images(brand)
    case brand
      when "Visa"
        image_tag("//www-mercari-jp.akamaized.net/assets/img/card/visa.svg?3703848211", alt: "visa", height: "19", width: "49")
      when "MasterCard"
        image_tag("//www-mercari-jp.akamaized.net/assets/img/card/master-card.svg?3703848211", alt: "master", height: "30", width: "49")
      when "Discover"
        image_tag("//www-mercari-jp.akamaized.net/assets/img/card/discover.svg?3703848211", alt: "discover", height: "30", width: "49")
      when "American Express"
        image_tag("//www-mercari-jp.akamaized.net/assets/img/card/american_express.svg?3703848211", alt: "american", height: "30", width: "49")
      when "JCB"
        image_tag("//www-mercari-jp.akamaized.net/assets/img/card/jcb.svg?3703848211", alt: "jcb", height: "30", width: "49")
      when "Diners Club"
        image_tag("//www-mercari-jp.akamaized.net/assets/img/card/dinersclub.svg?3703848211", alt: "jcb", height: "30", width: "49")
      else 
        image_tag("//www-mercari-jp.akamaized.net/assets/img/card/saison-card.svg?3703848211", alt: "saison", height: "30", width: "49")
    end
  end

  # 登録したカードの有効期限を表示させるhelperメソッド
  # payjpから返ってくる有効期限の月と年が下記なのでこれをメルカリの表記と似せるためにhelperメソッドを作りviewで呼んでいる
  # "exp_month": 2,
  # "exp_year": 2020,
  def display_expMonYear(month, year)
    exp_month = "0" + month.to_s if month < 9
    exp_year  = year.to_s.slice(0..1).to_i
    return "#{exp_month} / #{exp_year}"
  end

end
