require 'rails_helper'

describe Petition do
  it 'passes' do
    Petition.delete_all
    Petition.create([{ starter_urn: 'urn:changeorg:starter:6757e68c-8ac4-11eb-8dcd-0242ac130003', title: 'Save our oceans', body: 'Lorem ipsum...', created_at: Time.new(2020, 12, 24)}])
    Petition.create([{ starter_urn: 'urn:changeorg:starter:c6e83ee8-151b-4ac0-8e4a-b0dcc11a7f0d', title: 'Fight for justice', body: 'Lorem ipsum...', created_at: Time.now - 1.day}])
    Petition.create([{ starter_urn: 'urn:changeorg:starter:f5ae944c-8cd8-11eb-8dcd-0242ac130003', title: 'Sign for climate change', body: 'Lorem ipsum...', created_at: Time.now - 2.day }])
    Petition.create([{ starter_urn: 'urn:changeorg:starter:6757e68c-8ac4-11eb-8dcd-0242ac130003', title: 'Ban the Cruel Sale & Trade of Shark Fins', body: 'Lorem ipsum...', created_at: Time.new(2020, 06, 01) }])
    Petition.create([{ starter_urn: 'urn:changeorg:starter:ad922736-8cd9-11eb-8dcd-0242ac130003', title: 'Seatbelts for Canadian School Buses, Now!', body: 'Lorem ipsum...', created_at: Time.now - 3.day }])
    Petition.create([{ starter_urn: 'urn:changeorg:starter:c6e83ee8-151b-4ac0-8e4a-b0dcc11a7f0d', title: 'COVID-19 funding for Indigenous communities', body: 'Lorem ipsum...', created_at: Time.now - 4.day  }])
    Petition.create([{ starter_urn: 'urn:changeorg:starter:b1da6920-8cd9-11eb-8dcd-0242ac130003', title: 'Safer Personal Protective Equipment (PPE) for NHS workers', body: 'Lorem ipsum...', created_at: Time.now - 5.day }])
    Petition.create([{ starter_urn: 'urn:changeorg:starter:b5f3eebe-8cd9-11eb-8dcd-0242ac130003 ', title: 'Cancer patients exempted from travel restrictions', body: 'Lorem ipsum...', created_at: Time.now - 6.day }])

    expect(Petition.getLast3Petitions.count).to be(3)
  end

  it 'passes' do
    Petition.delete_all
    Petition.create([{ starter_urn: 'urn:changeorg:starter:6757e68c-8ac4-11eb-8dcd-0242ac130003', title: 'Save our oceans', body: 'Lorem ipsum...', created_at: Time.new(2020, 12, 24)}])
    Petition.create([{ starter_urn: 'urn:changeorg:starter:c6e83ee8-151b-4ac0-8e4a-b0dcc11a7f0d', title: 'Fight for justice', body: 'Lorem ipsum...', created_at: Time.now - 1.day}])
    Petition.create([{ starter_urn: 'urn:changeorg:starter:f5ae944c-8cd8-11eb-8dcd-0242ac130003', title: 'Sign for climate change', body: 'Lorem ipsum...', created_at: Time.now - 2.day }])
    Petition.create([{ starter_urn: 'urn:changeorg:starter:6757e68c-8ac4-11eb-8dcd-0242ac130003', title: 'Ban the Cruel Sale & Trade of Shark Fins', body: 'Lorem ipsum...', created_at: Time.new(2020, 06, 01) }])
    Petition.create([{ starter_urn: 'urn:changeorg:starter:ad922736-8cd9-11eb-8dcd-0242ac130003', title: 'Seatbelts for Canadian School Buses, Now!', body: 'Lorem ipsum...', created_at: Time.now - 3.day }])
    Petition.create([{ starter_urn: 'urn:changeorg:starter:c6e83ee8-151b-4ac0-8e4a-b0dcc11a7f0d', title: 'COVID-19 funding for Indigenous communities', body: 'Lorem ipsum...', created_at: Time.now - 4.day  }])
    Petition.create([{ starter_urn: 'urn:changeorg:starter:b1da6920-8cd9-11eb-8dcd-0242ac130003', title: 'Safer Personal Protective Equipment (PPE) for NHS workers', body: 'Lorem ipsum...', created_at: Time.now - 5.day }])
    Petition.create([{ starter_urn: 'urn:changeorg:starter:b5f3eebe-8cd9-11eb-8dcd-0242ac130003 ', title: 'Cancer patients exempted from travel restrictions', body: 'Lorem ipsum...', created_at: Time.now - 6.day }])

    # debugger
    # 2, 3, 5
    petitions = Petition.getLast3Petitions
    expect(petitions[0]['id']).to be(2)
    expect(petitions[1]['id']).to be(3)
    expect(petitions[2]['id']).to be(5)
  end
end