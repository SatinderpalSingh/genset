class CreateFakeQuotations < ActiveRecord::Migration
  def change
    create_table :fake_quotations do |t|
      t.string :companyName, :default => "Amrit Engineering"
      t.string :serviceTax, :default => "Service Tax No. : APRPK1196BSD001"
      t.string :companyTagLine, :default => "Providing Generator on Rent Basis & Allied Services "
      t.string :headerMobileNumber, :default => "87270 - 09500 <br /> 0161 - 2493500 <br /> 80540 - 70500"
      t.string :companyAddressOne, :default => "# 1380, St. No. 31, Janta Nagar, Bhagwan Chowk"
      t.string :companyAddressTwo, :default => "Near Public Health Center, Ludhiana-141003"
      t.string :referenceNumber
      t.text :subject, :default => "Subject: Providing Automation Silent Generator on Monthly Rent Basis"
      t.string :regard, :default => "With Regards,"
      t.text :regardContent, :default => "On the captioned subject we are pleased to introduce ourselves as service provider in the field of Generator on monthly rent basis. It is for your kind consideration that we are providing the generator sets on monthly rent basis to the banks and other Govt. offices. We have proper infrastructure and staff to serve best to our customers. At present we proudly declare that we are serving many branches of :"
      t.string :bankNameOne, :default => "Allahabad Bank:"
      t.string :bankNameTwo, :default => "Gill, Pakhowal & Gujjarwal"
      t.string :bankNameThree, :default => "Dugri, Tagore Nagar, Focal Point, Ferozepur Road, Bahadur Ke Road"
      t.string :bankNameFour, :default => "Kalsi Nagar "
      t.string :bankNameFive, :default => "Mandi Gobindgarh, Mullanpur Dakha, Khanna "
      t.text :bankZoneOne, :default => "Mandi Ahmedgarh, Malerkotla, Patiala, Shiv Puri, Raj Guru Nagar, Pakhowal Road, Bagha Purana, Bathinda, Dugri Road, Focal Point, Haiobwal, IFB Cheema Chowk "
      t.text :bankZoneTwo, :default => "Jalandher, Balachure, Rattewal, Batala, Nakodhar, Shanker, Patti, Dasuya, Shahkot, Raiya & Zonal Office Amritsar "
      t.text :quotationLine, :default => "Through this letter, we are offering our services to bank. Our monthly rent is quoted as:"
      t.text :quotationRateList, :default => "<li>Rs-7250.00 for 5.0 Kva</li><li>Rs-9500.00 for 7.5 Kva</li><li>Rs-11000.00 for 10.0 Kva</li><li>Rs-12500.00 for 12.5 Kva</li><li>Rs-13000.00 for 15 Kva</li><li>Rs-13500.00 for 20 Kva</li><li>Rs-17000.00 for 25.00 Kva</li><li>Rs-19500.00 for 31.05 Kva</li><li>Rs-21500.00 for 35.00 Kva</li><li>Rs-27000.00 for 40 Kva</li><li>Rs-29500.00 for 50 Kva</li><li>Rs-39500.00 for 62.5 Kva</li><li>Rs-43500.00 for 75.0 Ksva</li>"
      t.text :contentPartOne, :default => "We shall increase 10% after two years. The rent will include repairs & maintenances and the cost of diesel. Space will be provided by you. Our generator sets will be soundproof & automatic. We shall install only the branded generator sets. If you want higher capacity generator then we may fulfill your demand. Above rates are for all seasons."
      t.text :contentPartTwo, :default => "We hope you will consider our application and give an opportunity to serve your bank. We ensure you of our best service."
      t.string :thankYou, :default => "Thanking You"
      t.string :yoursTruly, :default => "Yours Truly"
      t.string :nameOfCompany, :default => "For Amrit Engineers"
      t.string :emailIdOne, :default => "ishnoorsingh@in.com"
      t.string :emailIdTwo, :default => "jasvirsinghsond@gmail.com"
      t.string :emailIdThree, :default => "amritengineers80@gmail.com"
      t.string :emailIdFour, :default => "amritengineers@yahoo.in"
      t.string :contactNumberOne, :default => "+91 98140-09500"
      t.string :contactNumberTwo, :default => "+91 87270-09500"
      t.string :contactNumberThree, :default => "0161-2439500"
      t.string :date, null: false, :default => "Dated : " + Date.today.strftime("%d/%m/%Y")
      t.references :client_details, index: true
      t.references :sender_details, index: true

      t.timestamps null: false
    end
  end
end
